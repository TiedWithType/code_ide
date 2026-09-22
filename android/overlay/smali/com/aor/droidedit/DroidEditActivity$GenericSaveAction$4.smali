.class Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Lcom/aor/droidedit/fs/tasks/listeners/FileExistsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    .line 3447
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;)Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;
    .locals 1

    .prologue
    .line 3447
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    return-object v0
.end method


# virtual methods
.method public fileExists()V
    .locals 3

    .prologue
    .line 3456
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_file_exists:I

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/code/ide/compat/AppUi;->title(Landroid/app/AlertDialog$Builder;Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_file_exists_msg:I

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->file_management_overwrite:I

    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4$1;

    invoke-direct {v2, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4$1;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 3462
    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 3463
    return-void
.end method

.method public noSuchFile()V
    .locals 2

    .prologue
    .line 3450
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mOverwrite:Z

    .line 3451
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    .line 3452
    return-void
.end method
