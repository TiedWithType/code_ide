#!/usr/bin/env python3
"""Validate the entire xmode bundle. Requires Python 3 and lxml."""
from pathlib import Path
from collections import Counter
from lxml import etree as E
import json

base = Path(__file__).resolve().parents[1]
parser = E.XMLParser(resolve_entities=False, no_network=True)
dtd = E.DTD(str(base / 'xmode.dtd'))
cdtd = E.DTD(str(base / 'catalog.dtd'))
cat = E.parse(str(base / 'modes/catalog'), parser)
errors = []
if not cdtd.validate(cat):
    errors.append(str(cdtd.error_log))
entries = list(cat.getroot())
names = [e.get('NAME') for e in entries]
if len(names) != len(set(names)):
    errors.append('Duplicate catalog names')
files = {p.name: E.parse(str(p), parser) for p in (base / 'modes').glob('*.xml')}
by_name = {e.get('NAME'): e.get('FILE') for e in entries}
for name, t in files.items():
    if not dtd.validate(t):
        errors.append(f'{name}: {dtd.error_log}')
    sets = [r.get('SET', 'MAIN') for r in t.findall('RULES')]
    if 'MAIN' not in sets:
        errors.append(f'{name}: missing MAIN')
    for k in t.findall('.//KEYWORDS'):
        words = [(e.text or '') for e in k if isinstance(e.tag, str)]
        if k.getparent().get('IGNORE_CASE', 'TRUE') == 'TRUE':
            words = [w.casefold() for w in words]
        if any(not w for w in words):
            errors.append(f'{name}: empty keyword')
        dup = [w for w, count in Counter(words).items() if count > 1]
        if dup:
            errors.append(f'{name}: duplicate keywords {dup}')
    for e in t.xpath('//*[@DELEGATE]'):
        ref = e.get('DELEGATE')
        if '::' in ref:
            mode, ruleset = ref.split('::', 1)
            target = files.get(by_name.get(mode))
        else:
            ruleset, target = ref, t
        if target is None or ruleset not in [r.get('SET', 'MAIN') for r in target.findall('RULES')]:
            errors.append(f'{name}: missing delegate {ref}')
    for e in t.xpath('//*[@HASH_CHAR and @HASH_CHARS]'):
        errors.append(f'{name}: both HASH_CHAR and HASH_CHARS')
for entry in entries:
    if entry.get('FILE') not in files:
        errors.append(f'Missing catalog file: {entry.get("FILE")}')
unregistered = sorted(set(files) - set(by_name.values()))
if unregistered:
    errors.append(f'Unregistered: {unregistered}')
summary = {'mode_files': len(files), 'catalog_entries': len(entries), 'errors': errors}
print(json.dumps(summary, indent=2, ensure_ascii=False))
raise SystemExit(bool(errors))
