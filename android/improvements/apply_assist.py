#!/usr/bin/env python3
from pathlib import Path
import re
import sys

root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path('android/build/project')


def patch(path, transform):
    p = root / path
    text = p.read_text(encoding='utf-8')
    new = transform(text)
    if new != text:
        p.write_text(new, encoding='utf-8')


def activity(s):
    start = ' invoke-static {p0, v0, v1}, Lcom/code/ide/compat/RecoveryTicker;->start(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V'
    assist_start = ' invoke-static {p0, v0}, Lcom/code/ide/compat/EditorAssist;->start(Landroid/app/Activity;Landroid/widget/EditText;)V'
    if assist_start not in s:
        if s.count(start) != 1:
            raise RuntimeError('RecoveryTicker start hook not found exactly once')
        s = s.replace(start, start + '\n' + assist_start)

    stop = '    invoke-static {p0}, Lcom/code/ide/compat/RecoveryTicker;->stop(Landroid/app/Activity;)V'
    assist_stop = '    invoke-static {p0}, Lcom/code/ide/compat/EditorAssist;->stop(Landroid/app/Activity;)V'
    if assist_stop not in s:
        if s.count(stop) < 1:
            raise RuntimeError('RecoveryTicker stop hook not found')
        s = s.replace(stop, assist_stop + '\n' + stop)

    marker = '.method protected onActivityResult(IILandroid/content/Intent;)V\n    .locals 9'
    result_hook = '    invoke-static {p0, p1, p2, p3}, Lcom/code/ide/compat/EmmetSnippets;->result(Landroid/app/Activity;IILandroid/content/Intent;)Z'
    if result_hook not in s:
        if s.count(marker) != 1:
            raise RuntimeError('onActivityResult marker not found exactly once')
        s = s.replace(marker, marker + '\n' + result_hook + '''
    move-result v0
    if-eqz v0, :assist_result_continue
    return-void
    :assist_result_continue''')

    method = '''.method public compatAutomaticEdit()Z
 .locals 1
 iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z
 return v0
.end method
'''
    if '.method public compatAutomaticEdit()Z' not in s:
        s = s.rstrip() + '\n\n' + method
    return s


def observable(s):
    wrap = '    invoke-static {p0, v0}, Lcom/code/ide/compat/EditorAssist;->wrap(Landroid/widget/EditText;Landroid/view/inputmethod/InputConnection;)Landroid/view/inputmethod/InputConnection;'
    if wrap not in s:
        a = s.index('.method public onCreateInputConnection(')
        b = s.index('.end method', a)
        block = s[a:b]
        needle = '    return-object v0'
        if block.count(needle) != 1:
            raise RuntimeError('InputConnection return not found exactly once')
        block = block.replace(needle, wrap + '\n    move-result-object v0\n' + needle)
        s = s[:a] + block + s[b:]

    selection = '    invoke-static {p0}, Lcom/code/ide/compat/EditorAssist;->selection(Landroid/widget/EditText;)V'
    if selection not in s:
        a = s.index('.method protected onSelectionChanged(')
        b = s.index('    .prologue', a) + len('    .prologue')
        s = s[:b] + '\n' + selection + s[b:]
    return s


def text_listener(s):
    hook = '    invoke-static {v0, p1}, Lcom/code/ide/compat/EditorAssist;->type(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z'
    if hook in s:
        return s
    needle = '    invoke-static {v0, p1}, Lcom/code/ide/compat/EmmetFields;->text'
    if s.count(needle) != 1:
        raise RuntimeError('EmmetFields text hook not found exactly once')
    i = s.index(needle)
    return s[:i] + '''    invoke-static {v0, p1}, Lcom/code/ide/compat/EditorAssist;->type(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z
    move-result v1
    if-eqz v1, :assist_text_next
    return-void
    :assist_text_next
''' + s[i:]


def key_listener(s):
    hook = '    invoke-static {v0, p3}, Lcom/code/ide/compat/EditorAssist;->key(Landroid/widget/EditText;Landroid/view/KeyEvent;)Z'
    if hook in s:
        return s
    needle = '    invoke-static {p1, p2, p3}, Lcom/code/ide/compat/EmmetFields;->key'
    if s.count(needle) != 1:
        raise RuntimeError('EmmetFields key hook not found exactly once')
    i = s.index(needle)
    return s[:i] + '''    move-object v0, p1
    check-cast v0, Landroid/widget/EditText;
    invoke-static {v0, p3}, Lcom/code/ide/compat/EditorAssist;->key(Landroid/widget/EditText;Landroid/view/KeyEvent;)Z
    move-result v0
    if-eqz v0, :assist_key_next
    return v0
    :assist_key_next
''' + s[i:]


def version(s):
    s = re.sub(r'(?m)^  versionCode: .*$', '  versionCode: 20260926', s)
    s = re.sub(r'(?m)^  versionName: .*$', '  versionName: Expressive You - Assist 20260922', s)
    return s

patch('smali/com/aor/droidedit/DroidEditActivity.smali', activity)
patch('smali/com/aor/droidedit/custom/ObservableEditText.smali', observable)
patch('smali/com/aor/droidedit/DroidEditActivity$29.smali', text_listener)
patch('smali/com/aor/droidedit/DroidEditActivity$9.smali', key_listener)
patch('apktool.yml', version)
print('Assist hooks applied:', root)
