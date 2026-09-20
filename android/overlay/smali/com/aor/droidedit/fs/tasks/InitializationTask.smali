.class public Lcom/aor/droidedit/fs/tasks/InitializationTask;
.super Landroid/os/AsyncTask;
.source "InitializationTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/AlertDialog;

.field private mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

.field private mListener:Lcom/aor/droidedit/fs/tasks/listeners/InitializationListener;

.field private mStartAuthProcess:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;ZLcom/aor/droidedit/fs/tasks/listeners/InitializationListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileSystem"    # Lcom/aor/droidedit/fs/implementation/FileSystem;
    .param p3, "startAuthProcess"    # Z
    .param p4, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/InitializationListener;

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mContext:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 25
    iput-boolean p3, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mStartAuthProcess:Z

    .line 26
    iput-object p4, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/InitializationListener;

    .line 27
    return-void
.end method

.method static synthetic access$2(Lcom/aor/droidedit/fs/tasks/InitializationTask;)Lcom/aor/droidedit/fs/implementation/FileSystem;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 47
    :try_start_0
    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mContext:Landroid/content/Context;

    iget-boolean v3, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mStartAuthProcess:Z

    invoke-virtual {v1, v2, v3}, Lcom/aor/droidedit/fs/implementation/FileSystem;->initialize(Landroid/content/Context;Z)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 51
    :goto_0
    return-object v1

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "DroidEdit"

    const-string/jumbo v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    sget-object v1, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/InitializationTask;->doInBackground([Ljava/lang/Void;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;)V
    .locals 2
    .param p1, "result"    # Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    .prologue
    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mListener:Lcom/aor/droidedit/fs/tasks/listeners/InitializationListener;

    invoke-interface {v0, p1}, Lcom/aor/droidedit/fs/tasks/listeners/InitializationListener;->initializationResult(Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;)V
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    if-ne p1, v0, :compat_done
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mContext:Landroid/content/Context;
    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;
    invoke-static {v0, v1}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I
    move-result v1
    if-eqz v1, :compat_done
    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;
    invoke-static {v0, v1}, Lcom/code/ide/compat/StorageAccess;->request(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)V
    :compat_done


    .line 60
    return-void

    .line 58
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/InitializationTask;->onPostExecute(Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 31
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->remote_connecting:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/aor/droidedit/fs/tasks/InitializationTask$1;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/fs/tasks/InitializationTask$1;-><init>(Lcom/aor/droidedit/fs/tasks/InitializationTask;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 36
    sget v1, Lcom/aor/droidedit/lib/R$string;->remote_establishing_connection:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    new-instance v2, Lcom/aor/droidedit/fs/tasks/InitializationTask$2;

    invoke-direct {v2, p0}, Lcom/aor/droidedit/fs/tasks/InitializationTask$2;-><init>(Lcom/aor/droidedit/fs/tasks/InitializationTask;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/aor/droidedit/fs/tasks/InitializationTask;->mDialog:Landroid/app/AlertDialog;

    .line 42
    return-void
.end method
