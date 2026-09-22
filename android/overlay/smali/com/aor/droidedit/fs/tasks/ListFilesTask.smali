.class public Lcom/aor/droidedit/fs/tasks/ListFilesTask;
.super Landroid/os/AsyncTask;
.source "ListFilesTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/util/List",
        "<",
        "Lcom/aor/droidedit/fs/implementation/FSElement;",
        ">;>;"
    }
.end annotation


# instance fields
.field private compatFailure:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

.field private mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

.field private mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileSystem"    # Lcom/aor/droidedit/fs/implementation/FileSystem;
    .param p3, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p4, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mContext:Landroid/content/Context;

    .line 22
    iput-object p2, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 23
    iput-object p3, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    .line 24
    iput-object p4, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    .line 25
    return-void
.end method


# virtual methods
.method public cancelCompat()V
    .locals 1

    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    invoke-interface {v0}, Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;->listingFailed()V

    return-void
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    :try_start_0
    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v3, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    invoke-virtual {v2, v3, v4}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getFiles(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;)Ljava/util/List;

    move-result-object v1

    .line 32
    .local v1, "files":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v2, v1}, Lcom/aor/droidedit/fs/implementation/FileSystem;->sortFiles(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v1    # "files":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    :goto_0
    return-object v1

    .line 34
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->compatFailure:Ljava/lang/String;

    .line 35
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 37
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-static {v0, v1}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/code/ide/compat/StorageAccess;->activity(Landroid/content/Context;)Lcom/aor/droidedit/DroidEditActivity;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v3, Lcom/code/ide/compat/RetryListing;

    invoke-direct {v3, p0}, Lcom/code/ide/compat/RetryListing;-><init>(Lcom/aor/droidedit/fs/tasks/ListFilesTask;)V

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/DroidEditActivity;->setCompatAction(Lcom/aor/droidedit/DroidEditActivity$Action;)V

    invoke-static {v0, v1}, Lcom/code/ide/compat/StorageAccess;->request(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->compatFailure:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mContext:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    invoke-interface {v0}, Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;->listingFailed()V

    .line 44
    :goto_0
    return-void

    .line 43
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    invoke-interface {v0, p1}, Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;->listingComplete(Ljava/util/List;)V

    goto :goto_0
.end method

.method public retryCompat()V
    .locals 5

    new-instance v0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v3, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    iget-object v4, p0, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
