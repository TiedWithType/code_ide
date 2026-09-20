.class public final Lcom/code/ide/compat/StorageAccess;
.super Ljava/lang/Object;

.method public static hasStorage(Landroid/content/Context;)Z
    .locals 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x1e
    if-lt v0, v1, :legacy
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z
    move-result v0
    return v0
    :legacy
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
    move-result v0
    if-nez v0, :no
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static hasLan(Landroid/content/Context;)Z
    .locals 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x25
    if-lt v0, v1, :yes
    const-string v0, "android.permission.ACCESS_LOCAL_NETWORK"
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :yes
    const/4 v0, 0x0
    return v0
    :yes
    const/4 v0, 0x1
    return v0
.end method

# Returns 1 for storage, 2 for FTP/SFTP LAN access, 0 when ready.
.method public static missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I
    .locals 1
    instance-of v0, p1, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;
    if-eqz v0, :network
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->hasStorage(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :network
    const/4 v0, 0x1
    return v0
    :network
    instance-of v0, p1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;
    if-nez v0, :check_lan
    instance-of v0, p1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;
    if-nez v0, :check_lan
    goto :ready
    :check_lan
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->hasLan(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :ready
    const/4 v0, 0x2
    return v0
    :ready
    const/4 v0, 0x0
    return v0
.end method

# Called on the UI thread, AFTER the listener has saved the pending action.
.method public static request(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)V
    .locals 5
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->activity(Landroid/content/Context;)Lcom/aor/droidedit/DroidEditActivity;
    move-result-object p0
    if-eqz p0, :done
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCompatAction()V
    invoke-static {p0, p1}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I
    move-result v4
    if-eqz v4, :resume
    const/4 v0, 0x2
    if-eq v4, v0, :lan
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x1e
    if-lt v0, v1, :legacy
    :try_app
    new-instance v0, Landroid/content/Intent;
    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const-string v1, "package"
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x0
    invoke-static {v1, v2, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    const/16 v1, 0x53a1
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_app_end
    .catch Landroid/content/ActivityNotFoundException; {:try_app .. :try_app_end} :fallback
    .catch Ljava/lang/SecurityException; {:try_app .. :try_app_end} :fallback
    return-void
    :fallback
    move-exception v0
    :try_fallback
    new-instance v0, Landroid/content/Intent;
    const-string v1, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const/16 v1, 0x53a1
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_fallback_end
    .catch Landroid/content/ActivityNotFoundException; {:try_fallback .. :try_fallback_end} :failed
    .catch Ljava/lang/SecurityException; {:try_fallback .. :try_fallback_end} :failed
    return-void
    :legacy
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"
    const/16 v3, 0x53a1
    goto :runtime
    :lan
    const-string v2, "android.permission.ACCESS_LOCAL_NETWORK"
    const/16 v3, 0x53a2
    :runtime
    const/4 v0, 0x1
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0x0
    aput-object v2, v0, v1
    :try_runtime
    invoke-virtual {p0, v0, v3}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
    :try_runtime_end
    .catch Ljava/lang/RuntimeException; {:try_runtime .. :try_runtime_end} :failed
    return-void
    :failed
    move-exception v0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->cancelCompatAction()V
    return-void
    :resume
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeCompatAction()V
    :done
    return-void
.end method

.method public static shareUri(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    .locals 2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    const-string v1, ".files"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {p0, v0, p1}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
    move-result-object v0
    return-object v0
.end method

# NIO closes both streams internally. Canonical identity prevents self-truncation.
.method public static copy(Ljava/io/File;Ljava/io/File;)V
    .locals 4
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    move-result-object p0
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    move-result-object p1
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :copy
    return-void
    :copy
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;
    move-result-object v0
    invoke-virtual {p1}, Ljava/io/File;->toPath()Ljava/nio/file/Path;
    move-result-object v1
    const/4 v2, 0x1
    new-array v2, v2, [Ljava/nio/file/CopyOption;
    sget-object v3, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;
    const/4 p0, 0x0
    aput-object v3, v2, p0
    invoke-static {v0, v1, v2}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    return-void
.end method

.method public static activity(Landroid/content/Context;)Lcom/aor/droidedit/DroidEditActivity;
    .locals 2
    const/16 v1, 0x10
    :loop
    if-eqz p0, :none
    instance-of v0, p0, Lcom/aor/droidedit/DroidEditActivity;
    if-eqz v0, :unwrap
    check-cast p0, Lcom/aor/droidedit/DroidEditActivity;
    return-object p0
    :unwrap
    add-int/lit8 v1, v1, -0x1
    if-lez v1, :none
    instance-of v0, p0, Landroid/content/ContextWrapper;
    if-eqz v0, :none
    check-cast p0, Landroid/content/ContextWrapper;
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v0
    if-eq p0, v0, :none
    move-object p0, v0
    goto :loop
    :none
    const/4 v0, 0x0
    return-object v0
.end method

.method public static readableDirectory(Ljava/io/File;)Z
    .locals 1
    :start
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :no
    invoke-virtual {p0}, Ljava/io/File;->canRead()Z
    move-result v0
    return v0
    :end
    .catch Ljava/lang/SecurityException; {:start .. :end} :denied
    :denied
    move-exception v0
    :no
    const/4 v0, 0x0
    return v0
.end method

.method public static requestNotifications(Landroid/content/Context;)V
    .locals 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v1, 0x21
    if-lt v0, v1, :done
    const-string v1, "android.permission.POST_NOTIFICATIONS"
    invoke-virtual {p0, v1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :done
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->activity(Landroid/content/Context;)Lcom/aor/droidedit/DroidEditActivity;
    move-result-object v0
    if-eqz v0, :done
    const/4 v2, 0x1
    new-array v2, v2, [Ljava/lang/String;
    const/4 v3, 0x0
    aput-object v1, v2, v3
    const/16 v1, 0x53a3
    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
    :done
    return-void
.end method
