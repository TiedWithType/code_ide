.class public Lcom/aor/droidedit/fs/tasks/RunExternalTask;
.super Landroid/os/AsyncTask;
.source "RunExternalTask.java"


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
.field private mAction:Ljava/lang/String;

.field private mCommand:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDocument:Lcom/aor/droidedit/document/Document;

.field private mFolder:Ljava/lang/String;

.field private mOutput:Ljava/lang/String;


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
    iput-object p1, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    .line 28
    iput-object p2, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mDocument:Lcom/aor/droidedit/document/Document;

    .line 29
    iput-object p4, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mAction:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mCommand:Ljava/lang/String;

    .line 31
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mFolder:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private runCommand()Z
    .locals 12

    .prologue
    .line 70
    :try_start_0
    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mDocument:Lcom/aor/droidedit/document/Document;

    invoke-virtual {v9}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v9

    invoke-virtual {v9}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v9

    check-cast v9, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    invoke-virtual {v9}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getExec()Lcom/jcraft/jsch/ChannelExec;

    move-result-object v2

    .line 71
    .local v2, "exec":Lcom/jcraft/jsch/ChannelExec;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "cd \""

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mFolder:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "\" && "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mCommand:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Lcom/jcraft/jsch/ChannelExec;->setCommand(Ljava/lang/String;)V

    .line 72
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 73
    .local v6, "readerIn":Ljava/io/BufferedReader;
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->getErrStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 74
    .local v5, "readerErr":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->connect()V

    .line 76
    :goto_0
    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->isClosed()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 79
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .line 80
    .local v8, "sbOut":Ljava/lang/StringBuffer;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 83
    .local v7, "sbErr":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_4

    .line 84
    :goto_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    .line 85
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V

    .line 86
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V

    .line 88
    const-string/jumbo v9, ""

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 89
    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->getExitStatus()I

    move-result v9

    if-eqz v9, :cond_0

    .line 90
    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "Exit Status = "

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->getExitStatus()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 92
    :cond_0
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "out":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "err":Ljava/lang/String;
    const-string/jumbo v9, ""

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "<Standard Output>\n"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 96
    :cond_1
    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 98
    const-string/jumbo v9, ""

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "<Standard Error>\n"

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 99
    :cond_2
    iget-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    .line 101
    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelExec;->disconnect()V

    .line 105
    const/4 v9, 0x1

    .end local v1    # "err":Ljava/lang/String;
    .end local v2    # "exec":Lcom/jcraft/jsch/ChannelExec;
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "out":Ljava/lang/String;
    .end local v5    # "readerErr":Ljava/io/BufferedReader;
    .end local v6    # "readerIn":Ljava/io/BufferedReader;
    .end local v7    # "sbErr":Ljava/lang/StringBuffer;
    .end local v8    # "sbOut":Ljava/lang/StringBuffer;
    :goto_3
    return v9

    .line 77
    .restart local v2    # "exec":Lcom/jcraft/jsch/ChannelExec;
    .restart local v5    # "readerErr":Ljava/io/BufferedReader;
    .restart local v6    # "readerIn":Ljava/io/BufferedReader;
    :cond_3
    const-wide/16 v10, 0x64

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_0

    .line 102
    .end local v2    # "exec":Lcom/jcraft/jsch/ChannelExec;
    .end local v5    # "readerErr":Ljava/io/BufferedReader;
    .end local v6    # "readerIn":Ljava/io/BufferedReader;
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Exception;
    const/4 v9, 0x0

    goto :goto_3

    .line 83
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "exec":Lcom/jcraft/jsch/ChannelExec;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "readerErr":Ljava/io/BufferedReader;
    .restart local v6    # "readerIn":Ljava/io/BufferedReader;
    .restart local v7    # "sbErr":Ljava/lang/StringBuffer;
    .restart local v8    # "sbOut":Ljava/lang/StringBuffer;
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_1

    .line 84
    :cond_5
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->runCommand()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 47
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 48
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_no_output:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    .line 65
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 66
    return-void

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mAction:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->SHOW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 52
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_close:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mAction:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->REPLACE:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 55
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mDocument:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->replaceOrCreateDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    .line 57
    :cond_3
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mAction:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->NEW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mDocument:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mOutput:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->createDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    goto :goto_0

    .line 62
    :cond_4
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_command_error:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    .line 63
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mDocument:Lcom/aor/droidedit/document/Document;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->forgetSavedConnection(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_expression:I

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->mCommand:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;ILjava/lang/String;)V

    .line 37
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 38
    return-void
.end method
