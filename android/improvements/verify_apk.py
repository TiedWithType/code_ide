from pathlib import Path
import xml.etree.ElementTree as E,zipfile,hashlib
b=Path('work/improvements/verify');app=b/'smali/com/aor/droidedit';compat=b/'smali/com/code/ide/compat'
assert 'versionCode: 20260925' in (b/'apktool.yml').read_text()
assert 'Expressive You - Editor 20260922' in (b/'apktool.yml').read_text()
for name in ['AppUi','AppText','AtomicStore','StateIo','RecoveryTicker','EmmetFields','FieldRanges','EmmetSnippets','EmmetBridge']:
 assert (compat/(name+'.smali')).exists(),name
s=(app/'DroidEditActivity.smali').read_text();a=s.index('.method private closeDocument(I)V');z=s.index('.end method',a);part=s[a:z]
for expected in ['SaveCloseClick','setNeutralButton','setPositiveButton','setNegativeButton','AppUi;->show']:assert expected in part,expected
assert 'compatCloseSaved' in s and 'RecoveryTicker;->stop' in s and 'EmmetSnippets;->handle' in s
s=(app/'DroidEditActivity$GenericSaveAction$5.smali').read_text();success=s[s.index('.method public uploadSuccessful'):];assert 'compatApplySavedState' in success and 'compatFinishSave' in success
assert 'compatFinishSave' not in s[:s.index('.method public uploadSuccessful')]
s=(app/'DroidEditActivity$GenericSaveAction.smali').read_text();assert 'compatSavedText' in s and 'Ljava/lang/String;->equals' in s
assert 'EmmetFields;->key' in (app/'DroidEditActivity$9.smali').read_text()
assert 'EmmetFields;->text' in (app/'DroidEditActivity$29.smali').read_text()
assert 'EmmetFields;->start' in (compat/'EmmetBridge$Request.smali').read_text()
assert 'setTypeface' in (compat/'AppUi.smali').read_text()
ns='{http://schemas.android.com/apk/res/android}'
r=E.parse(b/'res/layout/warning_dialog_title.xml').getroot();assert r[0].get(ns+'src')=='@drawable/ic_warning_outline';assert r[1].get(ns+'fontFamily')=='@font/default'
r=E.parse(b/'res/values-pl/plurals.xml').getroot();forms={x.get('name'):{c.get('quantity'):c.text for c in x} for x in r};assert forms['time_minutes']['few']=='%d minuty temu' and forms['time_hours']['many']=='%d godzin temu'
r=E.parse(b/'res/values-pl/strings.xml').getroot();values={x.get('name'):x.text for x in r};assert values['file_untitled']=='Bez nazwy';assert values['save_and_close']=='Zapisz i zamknij'
assert (b/'assets/fonts/quicksand.ttf').read_bytes()==Path('decoded/res/font/default.ttf').read_bytes()
with zipfile.ZipFile('output/Code-IDE-Editor-20260922.apk') as z:
 assert z.testzip() is None
 for p in Path('decoded/assets').rglob('*'):
  if p.is_file():assert z.read(p.relative_to('decoded').as_posix())==p.read_bytes(),p
print('Final APK: version, save/close safety hooks, fonts, localization, tabstops, assets and ZIP integrity: OK')
