.class Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Lcom/aor/droidedit/fs/tasks/listeners/ModifiedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->execute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    .line 3521
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;)Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;
    .locals 1

    .prologue
    .line 3521
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    return-object v0
.end method


# virtual methods
.method public fileModified(J)V
    .locals 5
    .param p1, "lastModified"    # J

    .prologue
    .line 3524
    const-wide/16 v2, -0x1

    cmp-long v1, p1, v2

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$0(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/document/Document;

    move-result-object v1

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLastModified()J

    move-result-wide v2

    cmp-long v1, p1, v2

    if-lez v1, :cond_0

    .line 3525
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$1(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_file_changed_on_disk:I

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 3526
    .local v0, "message":Ljava/lang/CharSequence;
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "\\$file\\$"

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v3}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$0(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/document/Document;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3527
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$1(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/aor/droidedit/DroidEditActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$1(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x1080027

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_file_changed:I

    invoke-static {v1, v2}, Lcom/code/ide/compat/AppUi;->title(Landroid/app/AlertDialog$Builder;I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_reload:I

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1$1;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1$1;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 3533
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-static {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->access$1(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_ignore:I

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1$2;

    invoke-direct {v3, p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1$2;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges$1;J)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 3538
    invoke-static {v1}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 3540
    .end local v0    # "message":Ljava/lang/CharSequence;
    :cond_0
    return-void
.end method
