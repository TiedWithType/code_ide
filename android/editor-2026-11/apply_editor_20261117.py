#!/usr/bin/env python3
"""Nakłada zmiany linii 2026.11 (wersja 20261117) na drzewo Apktool.

Baza: dekompilacja `com.code.ide.apk` z wersji 20261114 (Expressive You - 2026.11.14).
Skrypt jest idempotentny: jeśli drzewo ma już versionCode 20261117, nic nie robi.

    python3 apply_editor_20261117.py /ścieżka/do/drzewa_apktool

Co robi:
  1. sprawdza bazę (versionCode 20261114),
  2. nakłada editor-20261117.patch (14 plików: manifest, apktool.yml, smali, zasoby, pomoc),
  3. usuwa Crashlytics, RootTools i stare klasy EmmetSnippets*.smali (zastępuje je Java z src/).
Nowy kod Java (src/) nie jest wstawiany do drzewa: build_editor.sh dokłada go jako classes2.dex.
"""
import os
import re
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
BASE_VERSION = "20261114"
NEW_VERSION = "20261117"

REMOVE = [
    "assets/crashlytics-build.properties",
    "smali/com/aor/droidedit/fs/implementation/root",
    "smali/com/aor/droidedit/fs/tasks/RunRootTask.smali",
    "smali/com/aor/droidedit/preferences/Preferences$4.smali",
    "smali/com/aor/droidedit/preferences/Preferences$5.smali",
    "smali/com/aor/droidedit/preferences/Preferences$6.smali",
    "smali/com/aor/droidedit/preferences/Preferences$7.smali",
    "smali/com/code/ide/compat/EmmetSnippets.smali",
    "smali/com/code/ide/compat/EmmetSnippets$1.smali",
    "smali/com/code/ide/compat/EmmetSnippets$2.smali",
    "smali/com/code/ide/compat/EmmetSnippets$3.smali",
    "smali/com/code/ide/compat/EmmetSnippets$3$1.smali",
    "smali/com/code/ide/compat/EmmetSnippets$4.smali",
    "smali/com/code/ide/compat/EmmetSnippets$5.smali",
    "smali/com/code/ide/compat/EmmetSnippets$5$1.smali",
    "smali/com/code/ide/compat/EmmetSnippets$5$2.smali",
    "smali/com/code/ide/compat/EmmetSnippets$5$2$1.smali",
    "smali/com/code/ide/compat/EmmetSnippets$5$3.smali",
    "smali/com/crashlytics",
    "smali/com/stericson",
    "smali_bin",
    "unknown/bin",
]


def version_code(tree):
    with open(os.path.join(tree, "apktool.yml"), encoding="utf-8") as f:
        m = re.search(r"versionCode:\s*'?(\d+)'?", f.read())
    return m.group(1) if m else None


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    tree = os.path.abspath(sys.argv[1])
    if not os.path.isfile(os.path.join(tree, "apktool.yml")):
        sys.exit("To nie jest drzewo Apktool: brak apktool.yml w " + tree)
    current = version_code(tree)
    if current == NEW_VERSION:
        print("Już zastosowano (versionCode %s) - nic do zrobienia." % NEW_VERSION)
        return
    if current != BASE_VERSION:
        sys.exit("Zła baza: versionCode %s, oczekiwano %s (dekompilacja com.code.ide.apk 2026.11.14)." % (current, BASE_VERSION))

    patch = os.path.join(HERE, "editor-20261117.patch")
    for cmd in (["git", "apply", "-p1", "--whitespace=nowarn"], ["patch", "-p1", "-s", "-i"]):
        if shutil.which(cmd[0]) is None:
            continue
        check = cmd[:] + ([patch] if cmd[0] == "git" else [patch])
        dry = (["git", "apply", "--check", "-p1", patch] if cmd[0] == "git" else ["patch", "-p1", "--dry-run", "-s", "-i", patch])
        if subprocess.run(dry, cwd=tree).returncode != 0:
            sys.exit("Łatka nie pasuje do tego drzewa (%s --check)." % cmd[0])
        if subprocess.run(cmd + [patch], cwd=tree).returncode != 0:
            sys.exit("Nałożenie łatki nie powiodło się.")
        break
    else:
        sys.exit("Potrzebne jest git albo patch.")

    for rel in REMOVE:
        path = os.path.join(tree, rel)
        if os.path.isdir(path):
            shutil.rmtree(path)
        elif os.path.exists(path):
            os.remove(path)
    print("Nałożono zmiany 20261117 na " + tree)


if __name__ == "__main__":
    main()
