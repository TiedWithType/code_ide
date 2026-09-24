from pathlib import Path
p=Path('decoded/smali/com/aor/droidedit/DroidEditActivity.smali');s=p.read_text();needle=' invoke-static {p0, v0, v1}, Lcom/code/ide/compat/RecoveryTicker;->start(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V';assert s.count(needle)==1;s=s.replace(needle,needle+'\n invoke-static {p0, v0}, Lcom/code/ide/compat/EditorAssist;->start(Landroid/app/Activity;Landroid/widget/EditText;)V');s=s.replace('    invoke-static {p0}, Lcom/code/ide/compat/RecoveryTicker;->stop(Landroid/app/Activity;)V','    invoke-static {p0}, Lcom/code/ide/compat/EditorAssist;->stop(Landroid/app/Activity;)V\n    invoke-static {p0}, Lcom/code/ide/compat/RecoveryTicker;->stop(Landroid/app/Activity;)V');needle='.method protected onActivityResult(IILandroid/content/Intent;)V\n    .locals 9';s=s.replace(needle,needle+'\n    invoke-static {p0, p1, p2, p3}, Lcom/code/ide/compat/EmmetSnippets;->result(Landroid/app/Activity;IILandroid/content/Intent;)Z\n    move-result v0\n    if-eqz v0, :assist_result_continue\n    return-void\n    :assist_result_continue');s+='''
.method public compatAutomaticEdit()Z
 .locals 1
 iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z
 return v0
.end method
''';p.write_text(s)
p=Path('decoded/smali/com/aor/droidedit/custom/ObservableEditText.smali');s=p.read_text();a=s.index('.method public onCreateInputConnection(');b=s.index('.end method',a);block=s[a:b].replace('    return-object v0','    invoke-static {p0, v0}, Lcom/code/ide/compat/EditorAssist;->wrap(Landroid/widget/EditText;Landroid/view/inputmethod/InputConnection;)Landroid/view/inputmethod/InputConnection;\n    move-result-object v0\n    return-object v0');s=s[:a]+block+s[b:];a=s.index('.method protected onSelectionChanged(');b=s.index('    .prologue',a)+len('    .prologue');s=s[:b]+'\n    invoke-static {p0}, Lcom/code/ide/compat/EditorAssist;->selection(Landroid/widget/EditText;)V'+s[b:];p.write_text(s)
p=Path('decoded/smali/com/aor/droidedit/DroidEditActivity$29.smali');s=p.read_text();needle='    invoke-static {v0, p1}, Lcom/code/ide/compat/EmmetFields;->text';idx=s.index(needle);s=s[:idx]+'''    invoke-static {v0, p1}, Lcom/code/ide/compat/EditorAssist;->type(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :assist_text_next
    return-void
    :assist_text_next
'''+s[idx:];p.write_text(s)
p=Path('decoded/smali/com/aor/droidedit/DroidEditActivity$9.smali');s=p.read_text();needle='    invoke-static {p1, p2, p3}, Lcom/code/ide/compat/EmmetFields;->key';idx=s.index(needle);s=s[:idx]+'''    move-object v0, p1
    check-cast v0, Landroid/widget/EditText;
    invoke-static {v0, p3}, Lcom/code/ide/compat/EditorAssist;->key(Landroid/widget/EditText;Landroid/view/KeyEvent;)Z
    move-result v0
    if-eqz v0, :assist_key_next
    return v0
    :assist_key_next
'''+s[idx:];p.write_text(s)
p=Path('decoded/apktool.yml');s=p.read_text().replace('versionCode: 20260925','versionCode: 20260926').replace('Expressive You - Editor 20260922','Expressive You - Assist 20260922');p.write_text(s)
