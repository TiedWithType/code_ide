from pathlib import Path
import re,xml.etree.ElementTree as E
app=Path('decoded/smali/com/aor/droidedit');p=app/'DroidEditActivity.smali';s=p.read_text()
def replace_method(name,body):
 global s
 s,n=re.subn(r'\.method '+re.escape(name)+r'\n[\s\S]*?\.end method',lambda _:'.method '+name+'\n'+body+'\n.end method',s);assert n==1
replace_method('public static writeObjectToFile(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V',''' .locals 0
 invoke-static {p0, p1, p2}, Lcom/code/ide/compat/StateIo;->write(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V
 return-void''')
replace_method('public static readObjectFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;',''' .locals 1
 invoke-static {p0, p1}, Lcom/code/ide/compat/StateIo;->read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
 move-result-object v0
 return-object v0''')
# Recovery callback preserves cursor selection before saving the existing document model.
s+='''
.method public compatCheckpoint()V
 .locals 3
 invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;
 move-result-object v0
 if-eqz v0, :done
 iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
 invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I
 move-result v2
 invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I
 move-result v1
 invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/document/Document;->setSelection(II)V
 invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V
 :done
 return-void
.end method
.method private compatStartRecovery()V
 .locals 2
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
 new-instance v1, Lcom/aor/droidedit/RecoverySaveTask;
 invoke-direct {v1, p0}, Lcom/aor/droidedit/RecoverySaveTask;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V
 invoke-static {p0, v0, v1}, Lcom/code/ide/compat/RecoveryTicker;->start(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V
 return-void
.end method
'''
# onResume is after initial document restoration. Use a separate helper to avoid register changes.
start=s.index('.method protected onResume()V');end=s.index('.end method',start);part=s[start:end];part=part.replace('    return-void','    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->compatStartRecovery()V\n    return-void');s=s[:start]+part+s[end:]
for name in ['onPause','onDestroy']:
 start=s.index('.method protected '+name+'()V');end=s.index('.end method',start);part=s[start:end].replace('    .prologue','    .prologue\n    invoke-static {p0}, Lcom/code/ide/compat/RecoveryTicker;->stop(Landroid/app/Activity;)V');s=s[:start]+part+s[end:]
# User snippets menu and handler.
start=s.index('.method public onCreateOptionsMenu(Landroid/view/Menu;)Z');end=s.index('.end method',start);part=s[start:end].replace('    .prologue','    .prologue\n    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetSnippets;->menu(Landroid/app/Activity;Landroid/view/Menu;)V');s=s[:start]+part+s[end:]
start=s.index('.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z');end=s.index('.end method',start);part=s[start:end].replace('    .prologue','''    .prologue
    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetSnippets;->handle(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    move-result v0
    if-eqz v0, :compat_menu_continue
    return v0
    :compat_menu_continue''');s=s[:start]+part+s[end:];p.write_text(s)
(app/'RecoverySaveTask.smali').write_text('''.class public final Lcom/aor/droidedit/RecoverySaveTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private owner:Lcom/aor/droidedit/DroidEditActivity;
.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;)V
 .locals 0
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 iput-object p1, p0, Lcom/aor/droidedit/RecoverySaveTask;->owner:Lcom/aor/droidedit/DroidEditActivity;
 return-void
.end method
.method public run()V
 .locals 1
 iget-object v0, p0, Lcom/aor/droidedit/RecoverySaveTask;->owner:Lcom/aor/droidedit/DroidEditActivity;
 invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->compatCheckpoint()V
 return-void
.end method
''')
p=app/'DroidEditActivity$9.smali';s=p.read_text();start=s.index('.method public onKey(');part=s[start:].replace('    .prologue','''    .prologue
    invoke-static {p1, p2, p3}, Lcom/code/ide/compat/EmmetFields;->key(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    move-result v0
    if-eqz v0, :compat_key_continue
    return v0
    :compat_key_continue''',1);p.write_text(s[:start]+part)
p=app/'DroidEditActivity$29.smali';s=p.read_text();start=s.index('.method public onText(');part=s[start:].replace('    .prologue','''    .prologue
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;
    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
    invoke-static {v0, p1}, Lcom/code/ide/compat/EmmetFields;->text(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :compat_text_continue
    return-void
    :compat_text_continue''',1);p.write_text(s[:start]+part)
for lang,text in [('values','Unable to save the recovery copy. Save your files manually.'),('values-pl','Nie udało się zapisać kopii odzyskiwania. Zapisz pliki ręcznie.')]:
 p=Path(f'decoded/res/{lang}/improvements_strings.xml');r=E.parse(p).getroot();E.SubElement(r,'string',name='recovery_write_failed').text=text;E.indent(r);E.ElementTree(r).write(p,encoding='utf-8',xml_declaration=True)
print('Recovery/menu/Tab hooks ready')
