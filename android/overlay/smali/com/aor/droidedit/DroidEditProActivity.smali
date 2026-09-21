.class public Lcom/aor/droidedit/DroidEditProActivity;
.super Lcom/aor/droidedit/DroidEditActivity;
.source "DroidEditProActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;-><init>()V

    return-void
.end method



# virtual methods
.method protected canEmmetExpand()Z
    .locals 2
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditProActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getEmmetSyntaxName()Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Lcom/code/ide/compat/EmmetBridge;->canExpand(Landroid/widget/EditText;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method protected emmetExpand()V
    .locals 3
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditProActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getEmmetSyntaxName()Ljava/lang/String;
    move-result-object v1
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditProActivity;->tabCharacter:Ljava/lang/String;
    invoke-static {p0, v0, v1, v2}, Lcom/code/ide/compat/EmmetBridge;->expand(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method
