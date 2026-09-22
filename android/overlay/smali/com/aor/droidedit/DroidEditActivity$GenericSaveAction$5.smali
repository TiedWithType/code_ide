.class Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;


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

.field private final synthetic val$changedPath:Z


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    iput-boolean p2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->val$changedPath:Z

    .line 3472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public progress(JJ)V
    .locals 5
    .param p1, "total"    # J
    .param p3, "current"    # J

    .prologue
    .line 3500
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    const/4 v1, 0x1

    long-to-int v2, p1

    long-to-int v3, p3

    invoke-static {v0, v1, v2, v3}, Lcom/aor/droidedit/DroidEditActivity;->access$19(Lcom/aor/droidedit/DroidEditActivity;ZII)V

    .line 3501
    return-void
.end method

.method public uploadFailed(Lcom/aor/droidedit/fs/exception/FSException;)V
    .locals 3
    .param p1, "e"    # Lcom/aor/droidedit/fs/exception/FSException;

    .prologue
    const/4 v1, 0x0

    .line 3491
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-static {v0, v1, v1, v1}, Lcom/aor/droidedit/DroidEditActivity;->access$19(Lcom/aor/droidedit/DroidEditActivity;ZII)V

    .line 3492
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/aor/droidedit/fs/exception/FSException;->getReason()Lcom/aor/droidedit/fs/exception/FSException$REASON;

    move-result-object v0

    sget-object v1, Lcom/aor/droidedit/fs/exception/FSException$REASON;->PERMISSION:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    if-ne v0, v1, :cond_0

    .line 3493
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->error_save_failed:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->error_permission_denied_msg:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    .line 3496
    :goto_0
    return-void

    .line 3495
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->error_save_failed:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->error_save_failed_msg:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    goto :goto_0
.end method

.method public uploadSuccessful()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 3475
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatApplySavedState()V

    .line 3476
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-static {v0, v2, v2, v2}, Lcom/aor/droidedit/DroidEditActivity;->access$19(Lcom/aor/droidedit/DroidEditActivity;ZII)V

    .line 3477
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->updateSaveState()V

    .line 3478
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->updateFooter()V

    .line 3479
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->notifyDocumentListChanged()V

    .line 3480
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->val$changedPath:Z

    if-eqz v0, :cond_0

    .line 3481
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity;->access$24(Lcom/aor/droidedit/DroidEditActivity;)V

    .line 3482
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->length()I

    move-result v1

    invoke-virtual {v0, v2, v1, v3}, Lcom/aor/droidedit/DroidEditActivity;->syntaxHighlight(IIZ)V

    .line 3483
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$3(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/document/Document;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->access$25(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;)V

    .line 3484
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity;->access$26(Lcom/aor/droidedit/DroidEditActivity;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$3(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1, v3}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 3486
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_saved:I

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-static {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->access$4(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getDisplayPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;ILjava/lang/String;)V

    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;->this$1:Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;
    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatFinishSave()V
    .line 3487
    return-void
.end method
