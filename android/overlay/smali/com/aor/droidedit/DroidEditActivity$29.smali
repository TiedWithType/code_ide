.class Lcom/aor/droidedit/DroidEditActivity$29;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    .line 1000
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(I[I)V
    .locals 0
    .param p1, "primaryCode"    # I
    .param p2, "keyCodes"    # [I

    .prologue
    .line 1045
    return-void
.end method

.method public onPress(I)V
    .locals 0
    .param p1, "primaryCode"    # I

    .prologue
    .line 1041
    return-void
.end method

.method public onRelease(I)V
    .locals 0
    .param p1, "primaryCode"    # I

    .prologue
    .line 1037
    return-void
.end method

.method public onText(Ljava/lang/CharSequence;)V
    .locals 10
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;
    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
    invoke-static {v0, p1}, Lcom/code/ide/compat/EmmetFields;->text(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :compat_text_continue
    return-void
    :compat_text_continue
    const/4 v9, -0x1

    const/4 v4, 0x0

    .line 1020
    const-string/jumbo v0, "\t"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, v1, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    invoke-static {v0, v1, v4}, Lcom/aor/droidedit/DroidEditActivity;->access$34(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Z)V

    .line 1033
    :cond_0
    :goto_0
    return-void

    .line 1022
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v0

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 1023
    .local v8, "start":I
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v0

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 1024
    .local v7, "end":I
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 1025
    .local v6, "cursor":I
    if-eq v6, v9, :cond_2

    .line 1026
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "X"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 1027
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1028
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    move-object v3, p1

    .line 1027
    invoke-interface/range {v0 .. v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;II)Landroid/text/Editable;

    .line 1029
    if-eq v6, v9, :cond_0

    .line 1030
    :try_start_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$29;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v0, v0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    add-int v1, v8, v6

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1031
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public swipeDown()V
    .locals 0

    .prologue
    .line 1016
    return-void
.end method

.method public swipeLeft()V
    .locals 0

    .prologue
    .line 1012
    return-void
.end method

.method public swipeRight()V
    .locals 0

    .prologue
    .line 1008
    return-void
.end method

.method public swipeUp()V
    .locals 0

    .prologue
    .line 1004
    return-void
.end method
