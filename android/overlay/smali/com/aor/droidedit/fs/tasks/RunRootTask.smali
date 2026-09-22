.class public Lcom/aor/droidedit/fs/tasks/RunRootTask;
.super Landroid/os/AsyncTask;
.source "RunRootTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private action:Ljava/lang/String;

.field private command:Ljava/lang/String;

.field private document:Lcom/aor/droidedit/document/Document;

.field private folder:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private output:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "document"    # Lcom/aor/droidedit/document/Document;
    .param p3, "command"    # Ljava/lang/String;
    .param p4, "action"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    .line 28
    iput-object p2, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->document:Lcom/aor/droidedit/document/Document;

    .line 29
    iput-object p4, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->action:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->command:Ljava/lang/String;

    .line 31
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->folder:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private runRootCommand()Z
    .locals 11

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 74
    const/4 v7, 0x2

    :try_start_0
    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "cd "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->folder:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->command:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x0

    const/16 v9, 0x3e8

    invoke-static {v7, v8, v9}, Lcom/stericson/RootTools/RootTools;->sendShell([Ljava/lang/String;II)Ljava/util/List;

    move-result-object v3

    .line 76
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget v1, Lcom/stericson/RootTools/RootTools;->lastExitCode:I

    .line 78
    .local v1, "exitStatus":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 80
    .local v4, "sbOut":Ljava/lang/StringBuffer;
    if-eqz v1, :cond_0

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "Exit Status = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_1

    .line 83
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->output:Ljava/lang/String;

    .line 88
    .end local v1    # "exitStatus":I
    .end local v3    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "sbOut":Ljava/lang/StringBuffer;
    :goto_1
    return v5

    .line 81
    .restart local v1    # "exitStatus":I
    .restart local v3    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "sbOut":Ljava/lang/StringBuffer;
    :cond_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .local v2, "line":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 84
    .end local v1    # "exitStatus":I
    .end local v2    # "line":Ljava/lang/String;
    .end local v3    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "sbOut":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "DroidEdit"

    const-string/jumbo v7, ""

    invoke-static {v5, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v6

    .line 86
    goto :goto_1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v2, 0x0

    .line 43
    :try_start_0
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->isAccessGiven()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/aor/droidedit/fs/tasks/RunRootTask;->runRootCommand()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 46
    :goto_0
    return-object v1

    .line 44
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/util/concurrent/TimeoutException;
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunRootTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 52
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 53
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->output:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 54
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_no_output:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    .line 69
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 70
    return-void

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->SHOW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_close:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->REPLACE:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 60
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->document:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->replaceOrCreateDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    .line 62
    :cond_3
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->NEW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->document:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->createDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    goto :goto_0

    .line 67
    :cond_4
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_command_error:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunRootTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_expression:I

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunRootTask;->command:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;ILjava/lang/String;)V

    .line 37
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 38
    return-void
.end method
