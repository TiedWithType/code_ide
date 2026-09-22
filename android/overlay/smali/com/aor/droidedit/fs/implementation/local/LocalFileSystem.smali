.class public Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;
.super Lcom/aor/droidedit/fs/implementation/FileSystem;
.source "LocalFileSystem.java"


# static fields
.field private static final serialVersionUID:J = 0x170b0a4c43b7ab5bL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;-><init>()V

    .line 34
    return-void
.end method

.method private copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/code/ide/compat/StorageAccess;->copy(Ljava/io/File;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public createFile(Lcom/aor/droidedit/fs/implementation/FSFolder;Ljava/lang/String;)Lcom/aor/droidedit/fs/implementation/FSFile;
    .locals 4
    .param p1, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 124
    new-instance v0, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public createFolder(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;Ljava/lang/String;)Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 116
    .local v0, "newFolder":Lcom/aor/droidedit/fs/implementation/local/LocalFolder;
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    .end local v0    # "newFolder":Lcom/aor/droidedit/fs/implementation/local/LocalFolder;
    :goto_0
    return-object v0

    .restart local v0    # "newFolder":Lcom/aor/droidedit/fs/implementation/local/LocalFolder;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public download(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 69
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3, v4}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 70
    move-object v0, p2

    check-cast v0, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    move-object v3, v0

    new-instance v4, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->setLastModified(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    return-void

    .line 71
    :catch_0
    move-exception v2

    .line 72
    .local v2, "e":Ljava/io/IOException;
    const-string/jumbo v3, "DroidEdit"

    const-string/jumbo v4, ""

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 73
    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v4, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v4}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3
.end method

.method public fileExists(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)Z
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public getDefaultFolder()Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 2

    .prologue
    .line 54
    new-instance v0, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public getFiles(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;)Ljava/util/List;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/aor/droidedit/fs/implementation/FSFolder;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    move-object v3, p2

    check-cast v3, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    .line 39
    .local v3, "localFolder":Lcom/aor/droidedit/fs/implementation/local/LocalFolder;
    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 40
    .local v1, "files":[Ljava/io/File;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    if-nez v1, :cond_0

    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Nie mo\u017cna odczyta\u0107 katalogu: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    array-length v6, v1

    const/4 v5, 0x0

    :goto_0
    if-lt v5, v6, :cond_2

    .line 47
    check-cast p2, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    .end local p2    # "folder":Lcom/aor/droidedit/fs/implementation/FSFolder;
    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 48
    .local v4, "parentFile":Ljava/io/File;
    if-eqz v4, :cond_1

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v4}, Lcom/code/ide/compat/StorageAccess;->readableDirectory(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    const-string/jumbo v6, ".."

    invoke-direct {v5, v4, v6}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .end local v4    # "parentFile":Ljava/io/File;
    :cond_1
    return-object v2

    .line 41
    .restart local p2    # "folder":Lcom/aor/droidedit/fs/implementation/FSFolder;
    :cond_2
    aget-object v0, v1, v5

    .line 42
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 43
    new-instance v7, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    invoke-direct {v7, v0}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;-><init>(Ljava/io/File;)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 45
    :cond_3
    new-instance v7, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    invoke-direct {v7, v0}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;-><init>(Ljava/io/File;)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getIcon()I
    .locals 1

    .prologue
    .line 63
    sget v0, Lcom/aor/droidedit/lib/R$drawable;->local:I

    return v0
.end method

.method public getLastFolder(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 2

    invoke-super {p0, p1}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getLastFolder(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FSFolder;

    move-result-object v0

    instance-of v1, v0, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/local/LocalFolder;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/code/ide/compat/StorageAccess;->readableDirectory(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;->getDefaultFolder()Lcom/aor/droidedit/fs/implementation/FSFolder;

    move-result-object v0

    return-object v0
.end method

.method public getUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    const-string/jumbo v0, "LOCAL"

    return-object v0
.end method

.method public initialize(Landroid/content/Context;Z)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 1

    invoke-static {p1, p0}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v0

    :cond_0
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v0

    :cond_1
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->SUCCESS:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v0
.end method

.method public isInitialized(Landroid/content/Context;)Z
    .locals 1

    invoke-static {p1, p0}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J
    .locals 2
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const-string/jumbo v0, "Local"

    return-object v0
.end method

.method public unlink(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 129
    return-void
.end method

.method public upload(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 80
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3, v4}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 81
    move-object v0, p2

    check-cast v0, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    move-object v3, v0

    new-instance v4, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->setLastModified(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    return-void

    .line 82
    :catch_0
    move-exception v2

    .line 83
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v4, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v4}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3
.end method
