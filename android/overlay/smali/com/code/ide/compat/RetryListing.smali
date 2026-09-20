.class public final Lcom/code/ide/compat/RetryListing;
.super Ljava/lang/Object;
.implements Lcom/aor/droidedit/DroidEditActivity$Action;
.field private final task:Lcom/aor/droidedit/fs/tasks/ListFilesTask;
.method public constructor <init>(Lcom/aor/droidedit/fs/tasks/ListFilesTask;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/code/ide/compat/RetryListing;->task:Lcom/aor/droidedit/fs/tasks/ListFilesTask;
    return-void
.end method
.method public execute()V
    .locals 1
    iget-object v0, p0, Lcom/code/ide/compat/RetryListing;->task:Lcom/aor/droidedit/fs/tasks/ListFilesTask;
    invoke-virtual {v0}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->retryCompat()V
    return-void
.end method
.method public cancel()V
    .locals 1
    iget-object v0, p0, Lcom/code/ide/compat/RetryListing;->task:Lcom/aor/droidedit/fs/tasks/ListFilesTask;
    invoke-virtual {v0}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->cancelCompat()V
    return-void
.end method
