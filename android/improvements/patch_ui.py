from pathlib import Path
import re,xml.etree.ElementTree as E
b=Path('decoded'); app=b/'smali/com/aor/droidedit'; A='Lcom/aor/droidedit/DroidEditActivity;'; S='Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;'; D='Lcom/aor/droidedit/document/Document;'
def method(s,name,body):
 p=re.compile(r'\.method '+re.escape(name)+r'\n[\s\S]*?\.end method');s,n=p.subn(lambda _:'.method '+name+'\n'+body+'\n.end method',s);assert n==1,name;return s
p=b/'res/values/public.xml';r=E.parse(p).getroot();ids={}
for kind,name in [('layout','warning_dialog_title'),('string','save_and_close'),('string','close_without_saving')]:
 n=max(int(x.get('id'),16) for x in r if x.get('type')==kind)+1;ids[name]=f'0x{n:08x}';E.SubElement(r,'public',type=kind,name=name,id=ids[name])
E.indent(r);E.ElementTree(r).write(p,encoding='utf-8',xml_declaration=True)
for folder,values,plurals in [
('values',{'save_and_close':'Save and close','close_without_saving':'Discard','file_untitled':'untitled','time_just_now':'just now','time_yesterday':'yesterday'}, {'time_minutes':{'one':'%d minute ago','other':'%d minutes ago'},'time_hours':{'one':'%d hour ago','other':'%d hours ago'},'time_days':{'one':'%d day ago','other':'%d days ago'}}),
('values-pl',{'save_and_close':'Zapisz i zamknij','close_without_saving':'Odrzuć zmiany','file_untitled':'Bez nazwy','time_just_now':'przed chwilą','time_yesterday':'wczoraj'}, {'time_minutes':{'one':'%d minutę temu','few':'%d minuty temu','many':'%d minut temu','other':'%d minuty temu'},'time_hours':{'one':'%d godzinę temu','few':'%d godziny temu','many':'%d godzin temu','other':'%d godziny temu'},'time_days':{'one':'%d dzień temu','other':'%d dni temu'}})]:
 root=E.Element('resources')
 for name,text in values.items():E.SubElement(root,'string',name=name).text=text
 for name,forms in plurals.items():
  node=E.SubElement(root,'plurals',name=name)
  for q,text in forms.items():E.SubElement(node,'item',quantity=q).text=text
 E.indent(root);E.ElementTree(root).write(b/f'res/{folder}/improvements_strings.xml',encoding='utf-8',xml_declaration=True)
# Fonts after showing all native application alerts, without changing app theme.
count=0
for p in app.rglob('*.smali'):
 s=p.read_text();s,n=re.subn(r'invoke-virtual \{(\w+)\}, Landroid/app/AlertDialog\$Builder;->show\(\)Landroid/app/AlertDialog;',r'invoke-static {\1}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;',s);count+=n
 if n:p.write_text(s)
# Existing close title delegates to shared warning layout.
p=b/'smali/com/code/ide/compat/CloseFileDialogUi.smali';p.write_text('''.class public final Lcom/code/ide/compat/CloseFileDialogUi;
.super Ljava/lang/Object;
.method public static setTitle(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog$Builder;
 .locals 1
 sget v0, Lcom/aor/droidedit/lib/R$string;->file_management_close_file:I
 invoke-static {p0, v0}, Lcom/code/ide/compat/AppUi;->title(Landroid/app/AlertDialog$Builder;I)Landroid/app/AlertDialog$Builder;
 move-result-object v0
 return-object v0
.end method
''')
# Warning titles: overwrite, external modification, common error alerts.
for path in ['DroidEditActivity$GenericSaveAction$4.smali','DroidEditActivity$GenericVerifyChanges$1.smali','util/Alert.smali']:
 p=app/path;s=p.read_text();s=re.sub(r'invoke-virtual \{(\w+), (\w+)\}, Landroid/app/AlertDialog\$Builder;->setTitle\((I|Ljava/lang/CharSequence;)\)Landroid/app/AlertDialog\$Builder;',r'invoke-static {\1, \2}, Lcom/code/ide/compat/AppUi;->title(Landroid/app/AlertDialog$Builder;\3)Landroid/app/AlertDialog$Builder;',s);p.write_text(s)
p=app/'DroidEditActivity.smali';s=p.read_text();s=s.replace('invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V','invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V\n\n    invoke-static {p0}, Lcom/code/ide/compat/AppText;->init(Landroid/content/Context;)V',1)
start=s.index('.method private closeDocument(I)V');end=s.index('.end method',start);part=s[start:end]
# Existing destructive action becomes neutral, save action positive.
part=part.replace('sget v1, Lcom/aor/droidedit/lib/R$string;->file_management_close_file:I',f'const v1, {ids["close_without_saving"]}').replace('->setPositiveButton(','->setNeutralButton(')
needle='    .line 2202'
part=part.replace(needle,f'''    const v1, {ids['save_and_close']}
    new-instance v2, Lcom/aor/droidedit/SaveCloseClick;
    invoke-direct {{v2, p0, p1}}, Lcom/aor/droidedit/SaveCloseClick;-><init>(Lcom/aor/droidedit/DroidEditActivity;I)V
    invoke-virtual {{v0, v1, v2}}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v0

'''+needle)
s=s[:start]+part+s[end:]
s+='''
.method public compatSaveAndClose(I)V
 .locals 5
 invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->getDocument(I)Lcom/aor/droidedit/document/Document;
 move-result-object v0
 if-eqz v0, :done
 invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;
 move-result-object v1
 const/4 v2, 0x0
 if-eqz v1, :create
 invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;
 move-result-object v2
 :create
 new-instance v3, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;
 invoke-direct {v3, p0, v0, v2, v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V
 const/4 v4, 0x1
 iput-boolean v4, v3, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatCloseAfterSave:Z
 invoke-virtual {v3}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V
 :done
 return-void
.end method

.method public compatCloseSaved(Lcom/aor/droidedit/document/Document;)V
 .locals 2
 invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->changed()Z
 move-result v0
 if-nez v0, :done
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;
 invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I
 move-result v1
 if-ltz v1, :done
 invoke-direct {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->reallyCloseDocument(I)V
 invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V
 :done
 return-void
.end method
''';p.write_text(s)
p=app/'SaveCloseClick.smali';p.write_text((app/'DroidEditActivity$58.smali').read_text().replace('DroidEditActivity$58','SaveCloseClick').replace('invoke-static {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->access$66(Lcom/aor/droidedit/DroidEditActivity;I)V','invoke-virtual {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->compatSaveAndClose(I)V'))
p=app/'DroidEditActivity$GenericSaveAction.smali';s=p.read_text().replace('# instance fields','# instance fields\n.field public compatCloseAfterSave:Z\n.field private compatSavedText:Ljava/lang/String;');needle='    invoke-virtual {v4, v5, v6}, '+D+'->save(Landroid/content/Context;Z)V';s=s.replace(needle,'    invoke-virtual {v4}, '+D+'->getText()Ljava/lang/String;\n    move-result-object v9\n    iput-object v9, p0, '+S+'->compatSavedText:Ljava/lang/String;\n\n'+needle)
s+='''
.method public compatApplySavedState()V
 .locals 3
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;
 invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;
 move-result-object v1
 iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatSavedText:Ljava/lang/String;
 invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
 move-result v1
 xor-int/lit8 v1, v1, 0x1
 invoke-virtual {v0, v1}, Lcom/aor/droidedit/document/Document;->setChanged(Z)V
 return-void
.end method
.method public compatFinishSave()V
 .locals 2
 iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatCloseAfterSave:Z
 if-eqz v0, :done
 const/4 v0, 0x0
 iput-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatCloseAfterSave:Z
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;
 iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;
 invoke-virtual {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->compatCloseSaved(Lcom/aor/droidedit/document/Document;)V
 :done
 return-void
.end method
''';p.write_text(s)
p=app/'DroidEditActivity$GenericSaveAction$5.smali';s=p.read_text();old=f'    invoke-static {{v0}}, {S}->access$3({S}){D}\n\n    move-result-object v0\n\n    invoke-virtual {{v0, v2}}, {D}->setChanged(Z)V';assert old in s;s=s.replace(old,f'    invoke-virtual {{v0}}, {S}->compatApplySavedState()V',1);s=s.replace('    .line 3487\n    return-void',f'    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:{S}\n    invoke-virtual {{v0}}, {S}->compatFinishSave()V\n    .line 3487\n    return-void');p.write_text(s)
p=app/'document/Document.smali';s=p.read_text().replace('const-string/jumbo v0, "untitled"','invoke-static {}, Lcom/code/ide/compat/AppText;->untitled()Ljava/lang/String;\n    move-result-object v0');p.write_text(s)
p=app/'filedialog/DroidEditFileDialog.smali';s=p.read_text().replace('const-string/jumbo v5, "untitled.txt"','invoke-static {}, Lcom/code/ide/compat/AppText;->untitled()Ljava/lang/String;\n    move-result-object v5\n    const-string v6, ".txt"\n    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;\n    move-result-object v5');p.write_text(s)
p=app/'util/StringFormatter.smali';p.write_text(method(p.read_text(),'public static getTimeAgo(J)Ljava/lang/String;',''' .locals 1
 invoke-static {p0, p1}, Lcom/code/ide/compat/AppText;->timeAgo(J)Ljava/lang/String;
 move-result-object v0
 return-object v0'''))
print('Patched',count,'alert show calls;',ids)
