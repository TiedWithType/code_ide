.class public Lcom/aor/droidedit/fs/tasks/RunLocalTask;
.super Landroid/os/AsyncTask;
.source "RunLocalTask.java"


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
    iput-object p1, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    .line 28
    iput-object p2, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->document:Lcom/aor/droidedit/document/Document;

    .line 29
    iput-object p4, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->action:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->command:Ljava/lang/String;

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

    iput-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->folder:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private runCommand()Z
    .locals 14

    .prologue
    .line 69
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v9

    .line 70
    .local v9, "rt":Ljava/lang/Runtime;
    const-string/jumbo v12, "sh"

    invoke-virtual {v9, v12}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    .line 71
    .local v6, "pr":Ljava/lang/Process;
    new-instance v4, Ljava/io/DataOutputStream;

    invoke-virtual {v6}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-direct {v4, v12}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 72
    .local v4, "os":Ljava/io/DataOutputStream;
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 73
    .local v8, "readerIn":Ljava/io/BufferedReader;
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 75
    .local v7, "readerErr":Ljava/io/BufferedReader;
    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "cd \""

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v13, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->folder:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "\"\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/io/DataOutputStream;->writeChars(Ljava/lang/String;)V

    .line 76
    new-instance v12, Ljava/lang/StringBuilder;

    iget-object v13, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->command:Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/io/DataOutputStream;->writeChars(Ljava/lang/String;)V

    .line 77
    const-string/jumbo v12, "exit\n"

    invoke-virtual {v4, v12}, Ljava/io/DataOutputStream;->writeChars(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v6}, Ljava/lang/Process;->waitFor()I

    move-result v2

    .line 81
    .local v2, "exitStatus":I
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    .line 82
    .local v11, "sbOut":Ljava/lang/StringBuffer;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 85
    .local v10, "sbErr":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_3

    .line 86
    :goto_1
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    .line 87
    invoke-virtual {v8}, Ljava/io/BufferedReader;->close()V

    .line 88
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V

    .line 90
    const-string/jumbo v12, ""

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 91
    if-eqz v2, :cond_0

    .line 92
    iget-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v12, "Exit Status = "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 94
    :cond_0
    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 95
    .local v5, "out":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "err":Ljava/lang/String;
    const-string/jumbo v12, ""

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    iget-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v12, "<Standard Output>\n"

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 98
    :cond_1
    iget-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 100
    const-string/jumbo v12, ""

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2

    iget-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v12, "<Standard Error>\n"

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 101
    :cond_2
    iget-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    .line 106
    const/4 v12, 0x1

    .end local v1    # "err":Ljava/lang/String;
    .end local v2    # "exitStatus":I
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "os":Ljava/io/DataOutputStream;
    .end local v5    # "out":Ljava/lang/String;
    .end local v6    # "pr":Ljava/lang/Process;
    .end local v7    # "readerErr":Ljava/io/BufferedReader;
    .end local v8    # "readerIn":Ljava/io/BufferedReader;
    .end local v9    # "rt":Ljava/lang/Runtime;
    .end local v10    # "sbErr":Ljava/lang/StringBuffer;
    .end local v11    # "sbOut":Ljava/lang/StringBuffer;
    :goto_2
    return v12

    .line 85
    .restart local v2    # "exitStatus":I
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v4    # "os":Ljava/io/DataOutputStream;
    .restart local v6    # "pr":Ljava/lang/Process;
    .restart local v7    # "readerErr":Ljava/io/BufferedReader;
    .restart local v8    # "readerIn":Ljava/io/BufferedReader;
    .restart local v9    # "rt":Ljava/lang/Runtime;
    .restart local v10    # "sbErr":Ljava/lang/StringBuffer;
    .restart local v11    # "sbOut":Ljava/lang/StringBuffer;
    :cond_3
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 102
    .end local v2    # "exitStatus":I
    .end local v3    # "line":Ljava/lang/String;
    .end local v4    # "os":Ljava/io/DataOutputStream;
    .end local v6    # "pr":Ljava/lang/Process;
    .end local v7    # "readerErr":Ljava/io/BufferedReader;
    .end local v8    # "readerIn":Ljava/io/BufferedReader;
    .end local v9    # "rt":Ljava/lang/Runtime;
    .end local v10    # "sbErr":Ljava/lang/StringBuffer;
    .end local v11    # "sbOut":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v12, "DroidEdit"

    const-string/jumbo v13, ""

    invoke-static {v12, v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    const/4 v12, 0x0

    goto :goto_2

    .line 86
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "exitStatus":I
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v4    # "os":Ljava/io/DataOutputStream;
    .restart local v6    # "pr":Ljava/lang/Process;
    .restart local v7    # "readerErr":Ljava/io/BufferedReader;
    .restart local v8    # "readerIn":Ljava/io/BufferedReader;
    .restart local v9    # "rt":Ljava/lang/Runtime;
    .restart local v10    # "sbErr":Ljava/lang/StringBuffer;
    .restart local v11    # "sbOut":Ljava/lang/StringBuffer;
    :cond_4
    :try_start_1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->runCommand()Z

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

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

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
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_no_output:I

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    .line 64
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 65
    return-void

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->SHOW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 52
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_output:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_close:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->REPLACE:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 55
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->document:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->replaceOrCreateDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    .line 57
    :cond_3
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->action:Ljava/lang/String;

    sget-object v1, Lcom/aor/droidedit/preferences/ExternalPreferences;->NEW:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/aor/droidedit/DroidEditActivity;

    iget-object v1, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->document:Lcom/aor/droidedit/document/Document;

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->output:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->createDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    goto :goto_0

    .line 62
    :cond_4
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

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

    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->mContext:Landroid/content/Context;

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_command_expression:I

    iget-object v2, p0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->command:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;ILjava/lang/String;)V

    .line 37
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 38
    return-void
.end method
