.class public Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;
.super Lcom/aor/droidedit/fs/implementation/FileSystem;
.source "FTPFileSystem.java"


# static fields
.field private static mSavedConnections:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x7f4c7ed2a6508ae3L


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private transient mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

.field private final mExplicit:Z

.field private final mHomeFolder:Ljava/lang/String;

.field private final mId:Ljava/lang/String;

.field private final mName:Ljava/lang/String;

.field private final mPassword:Ljava/lang/String;

.field private final mPort:Ljava/lang/String;

.field private final mSecure:Z

.field private final mUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 58
    invoke-direct {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;-><init>()V

    .line 59
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 61
    .local v7, "prefs":Landroid/content/SharedPreferences;
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".address"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".username"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".password"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPassword:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".port"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".secure"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSecure:Z

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".explicit"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mExplicit:Z

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".name"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mName:Ljava/lang/String;

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".path"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mHomeFolder:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mId:Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 73
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPassword:Ljava/lang/String;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSecure:Z

    iget-boolean v6, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mExplicit:Z

    invoke-direct/range {v0 .. v6}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 75
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "port"    # Ljava/lang/String;
    .param p6, "secure"    # Z
    .param p7, "explicit"    # Z
    .param p8, "homeFolder"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mName:Ljava/lang/String;

    .line 81
    iput-object p3, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    .line 82
    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    .line 83
    iput-object p4, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPassword:Ljava/lang/String;

    .line 84
    iput-object p5, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    .line 85
    iput-boolean p6, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSecure:Z

    .line 86
    iput-boolean p7, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mExplicit:Z

    .line 87
    iput-object p8, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mHomeFolder:Ljava/lang/String;

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mId:Ljava/lang/String;

    .line 89
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSecure:Z

    return v0
.end method

.method static synthetic access$4(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mExplicit:Z

    return v0
.end method

.method static synthetic access$5(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;)V
    .locals 0

    .prologue
    .line 54
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    return-void
.end method

.method static synthetic access$6()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$7(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;)Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    return-object v0
.end method

.method private askForPassword(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 142
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;

    invoke-direct {v1, p0, p1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;-><init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 168
    sget-object v1, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v1
.end method

.method public static forgetSavedConnection(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 338
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    new-instance v1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    invoke-direct {v1, p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    return-void
.end method

.method public static forgetSavedConnections()V
    .locals 1

    .prologue
    .line 334
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 335
    return-void
.end method


# virtual methods
.method public createFile(Lcom/aor/droidedit/fs/implementation/FSFolder;Ljava/lang/String;)Lcom/aor/droidedit/fs/implementation/FSFile;
    .locals 8
    .param p1, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 325
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0x0

    const-wide/16 v6, -0x1

    invoke-direct/range {v1 .. v7}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method public createFolder(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;Ljava/lang/String;)Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 314
    :try_start_0
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, -0x1

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 315
    .local v1, "newFolder":Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->makeDirectory(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 320
    .end local v1    # "newFolder":Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;
    :goto_0
    return-object v1

    .line 317
    :catch_0
    move-exception v0

    .line 318
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 320
    const/4 v1, 0x0

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
    .line 219
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    new-instance v3, Ljava/io/File;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 220
    .local v1, "os":Ljava/io/FileOutputStream;
    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v3

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$2;

    invoke-direct {v5, p0, v1, p3, p2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$2;-><init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;Ljava/io/OutputStream;Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v3, v4, v5}, Lorg/apache/commons/net/ftp/FTPClient;->retrieveFile(Ljava/lang/String;Ljava/io/OutputStream;)Z

    .line 230
    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v2

    .line 231
    .local v2, "replyCode":I
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 232
    const/16 v3, 0x226

    if-ne v2, v3, :cond_0

    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v4, Lcom/aor/droidedit/fs/exception/FSException$REASON;->PERMISSION:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v4}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3
    :try_end_0
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 235
    .end local v1    # "os":Ljava/io/FileOutputStream;
    .end local v2    # "replyCode":I
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Lcom/aor/droidedit/fs/exception/FSException;
    throw v0

    .line 233
    .end local v0    # "e":Lcom/aor/droidedit/fs/exception/FSException;
    .restart local v1    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "replyCode":I
    :cond_0
    const/16 v3, 0xe2

    if-eq v2, v3, :cond_1

    :try_start_1
    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v4, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v4}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3
    :try_end_1
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 237
    .end local v1    # "os":Ljava/io/FileOutputStream;
    .end local v2    # "replyCode":I
    :catch_1
    move-exception v0

    .line 238
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->unlink(Landroid/content/Context;)V

    .line 239
    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v4, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v4}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3

    .line 234
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "os":Ljava/io/FileOutputStream;
    .restart local v2    # "replyCode":I
    :cond_1
    :try_start_2
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J

    move-result-wide v4

    invoke-virtual {p2, v4, v5}, Lcom/aor/droidedit/fs/implementation/FSFile;->setLastModified(J)V
    :try_end_2
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 241
    return-void
.end method

.method public fileExists(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 306
    :try_start_0
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles(Ljava/lang/String;)[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v2

    array-length v2, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v2, v0, :cond_0

    .line 308
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 306
    goto :goto_0

    .line 307
    :catch_0
    move-exception v0

    move v0, v1

    .line 308
    goto :goto_0
.end method

.method public getDefaultFolder()Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 4

    .prologue
    .line 179
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mHomeFolder:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mHomeFolder:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 180
    new-instance v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mHomeFolder:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(Ljava/lang/String;)V

    .line 184
    :goto_0
    return-object v0

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getDefaultFolder()Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getDefaultFolder()Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    move-result-object v0

    goto :goto_0

    .line 184
    :cond_1
    new-instance v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    const-wide/16 v2, -0x1

    invoke-direct {v0, v2, v3}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(J)V

    goto :goto_0
.end method

.method public getFiles(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;)Ljava/util/List;
    .locals 13
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 189
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .local v10, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    :try_start_0
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->changeWorkingDirectory(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 213
    :cond_0
    return-object v10

    .line 194
    :cond_1
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->listFiles()[Lorg/apache/commons/net/ftp/FTPFile;

    move-result-object v0

    .line 195
    .local v0, "dFiles":[Lorg/apache/commons/net/ftp/FTPFile;
    array-length v12, v0

    move v11, v1

    :goto_0
    if-ge v11, v12, :cond_0

    aget-object v9, v0, v11

    .line 196
    .local v9, "entry":Lorg/apache/commons/net/ftp/FTPFile;
    if-nez v9, :cond_3

    .line 195
    :cond_2
    :goto_1
    add-int/lit8 v1, v11, 0x1

    move v11, v1

    goto :goto_0

    .line 197
    :cond_3
    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 198
    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 199
    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ".."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 200
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 207
    .end local v0    # "dFiles":[Lorg/apache/commons/net/ftp/FTPFile;
    .end local v9    # "entry":Lorg/apache/commons/net/ftp/FTPFile;
    :catch_0
    move-exception v8

    .line 208
    .local v8, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    const-string/jumbo v1, "DroidEdit"

    const-string/jumbo v2, ""

    invoke-static {v1, v2, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 210
    new-instance v1, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v2, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v1, v2}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v1

    .line 202
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v0    # "dFiles":[Lorg/apache/commons/net/ftp/FTPFile;
    .restart local v9    # "entry":Lorg/apache/commons/net/ftp/FTPFile;
    :cond_4
    :try_start_1
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 205
    :cond_5
    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getSize()J

    move-result-wide v4

    invoke-virtual {v9}, Lorg/apache/commons/net/ftp/FTPFile;->getTimestamp()Ljava/util/Calendar;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    invoke-direct/range {v1 .. v7}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1
.end method

.method public getIcon()I
    .locals 1

    .prologue
    .line 98
    sget v0, Lcom/aor/droidedit/lib/R$drawable;->remote:I

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getUID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "FTP_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public initialize(Landroid/content/Context;Z)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 8

    invoke-static {p1, p0}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I
    move-result v0
    if-eqz v0, :compat_ready
    if-eqz p2, :compat_failed
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    return-object v0
    :compat_failed
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    return-object v0
    :compat_ready
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "startAuthProcess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    if-nez v0, :cond_0

    .line 109
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 110
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mAddress:Ljava/lang/String;

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPassword:Ljava/lang/String;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mPort:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSecure:Z

    iget-boolean v6, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mExplicit:Z

    invoke-direct/range {v0 .. v6}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 112
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    .line 137
    :goto_0
    return-object v0

    .line 119
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 120
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    new-instance v1, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/net/ftp/FTPClient;->printWorkingDirectory()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->setDefaultFolder(Lcom/aor/droidedit/fs/implementation/ftp/FTPFolder;)V

    .line 121
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->setTested(Z)V

    .line 122
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 123
    :cond_2
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->SUCCESS:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 125
    :cond_3
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/net/ftp/FTPClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_5

    .line 126
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 127
    :cond_4
    invoke-direct {p0, p1}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->askForPassword(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 129
    :catch_0
    move-exception v7

    .line 130
    .local v7, "e":Ljava/lang/Exception;
    const-string/jumbo v0, "DroidEdit"

    const-string/jumbo v1, ""

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 133
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 134
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 137
    :cond_6
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0
.end method

.method public isInitialized(Landroid/content/Context;)Z
    .locals 1

    invoke-static {p1}, Lcom/code/ide/compat/StorageAccess;->hasLan(Landroid/content/Context;)Z
    move-result v0
    if-nez v0, :compat_ready
    return v0
    :compat_ready
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->isTested()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 292
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v5, "yyyyMMddHHmmss"

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 293
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    iget-object v5, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v5}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v5

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/commons/net/ftp/FTPClient;->getModificationTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 294
    .local v3, "time":Ljava/lang/String;
    const-string/jumbo v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v4, v5, v6

    .line 295
    .local v4, "timePart":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 296
    .local v2, "modificationTime":Ljava/util/Date;
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v6

    .line 300
    .end local v0    # "dateFormat":Ljava/text/SimpleDateFormat;
    .end local v2    # "modificationTime":Ljava/util/Date;
    .end local v3    # "time":Ljava/lang/String;
    .end local v4    # "timePart":Ljava/lang/String;
    :goto_0
    return-wide v6

    .line 297
    :catch_0
    move-exception v1

    .line 298
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "DroidEdit"

    const-string/jumbo v6, ""

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 300
    const-wide/16 v6, -0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public unlink(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 173
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    .line 174
    sget-object v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    return-void
.end method

.method public upload(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;)V
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 246
    .local v11, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "saveTemp"

    const/4 v3, 0x0

    invoke-interface {v11, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    .line 247
    .local v13, "saveTemp":Z
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPConnection;->getClient()Lorg/apache/commons/net/ftp/FTPClient;

    move-result-object v8

    .line 249
    .local v8, "client":Lorg/apache/commons/net/ftp/FTPClient;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v9

    .line 250
    .local v9, "dst":Ljava/lang/String;
    if-eqz v13, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, ".part"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 251
    :cond_0
    move-object/from16 v0, p2

    check-cast v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;

    move-object v2, v0

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFile;->getLength()J

    move-result-wide v6

    .line 252
    .local v6, "max":J
    new-instance v4, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 253
    .local v4, "is":Ljava/io/FileInputStream;
    new-instance v2, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$3;

    move-object v3, p0

    move-object/from16 v5, p3

    invoke-direct/range {v2 .. v7}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$3;-><init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;Ljava/io/InputStream;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;J)V

    invoke-virtual {v8, v9, v2}, Lorg/apache/commons/net/ftp/FTPClient;->storeFile(Ljava/lang/String;Ljava/io/InputStream;)Z

    .line 263
    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v12

    .line 264
    .local v12, "replyCode":I
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 265
    const/16 v2, 0x226

    if-ne v12, v2, :cond_1

    new-instance v2, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v3, Lcom/aor/droidedit/fs/exception/FSException$REASON;->PERMISSION:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v2, v3}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v2
    :try_end_0
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 278
    .end local v4    # "is":Ljava/io/FileInputStream;
    .end local v6    # "max":J
    .end local v9    # "dst":Ljava/lang/String;
    .end local v12    # "replyCode":I
    :catch_0
    move-exception v10

    .line 279
    .local v10, "e":Lcom/aor/droidedit/fs/exception/FSException;
    throw v10

    .line 266
    .end local v10    # "e":Lcom/aor/droidedit/fs/exception/FSException;
    .restart local v4    # "is":Ljava/io/FileInputStream;
    .restart local v6    # "max":J
    .restart local v9    # "dst":Ljava/lang/String;
    .restart local v12    # "replyCode":I
    :cond_1
    const/16 v2, 0xe2

    if-eq v12, v2, :cond_2

    :try_start_1
    new-instance v2, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v3, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v2, v3}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v2
    :try_end_1
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 280
    .end local v4    # "is":Ljava/io/FileInputStream;
    .end local v6    # "max":J
    .end local v9    # "dst":Ljava/lang/String;
    .end local v12    # "replyCode":I
    :catch_1
    move-exception v10

    .line 282
    .local v10, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, ".part"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Lorg/apache/commons/net/ftp/FTPClient;->deleteFile(Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 284
    :goto_0
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 285
    new-instance v2, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v3, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v2, v3}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v2

    .line 267
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v4    # "is":Ljava/io/FileInputStream;
    .restart local v6    # "max":J
    .restart local v9    # "dst":Ljava/lang/String;
    .restart local v12    # "replyCode":I
    :cond_2
    if-eqz v13, :cond_4

    .line 269
    :try_start_3
    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Lorg/apache/commons/net/ftp/FTPClient;->deleteFile(Ljava/lang/String;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_3 .. :try_end_3} :catch_0

    .line 271
    :goto_1
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, ".part"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v8, v2, v3}, Lorg/apache/commons/net/ftp/FTPClient;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    .line 273
    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyCode()I

    move-result v12

    .line 274
    const/16 v2, 0x226

    if-ne v12, v2, :cond_3

    new-instance v2, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v3, Lcom/aor/droidedit/fs/exception/FSException$REASON;->PERMISSION:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v2, v3}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v2

    .line 275
    :cond_3
    const/16 v2, 0xe2

    if-eq v12, v2, :cond_4

    const/16 v2, 0xfa

    if-eq v12, v2, :cond_4

    new-instance v2, Lcom/aor/droidedit/fs/exception/FSException;

    invoke-virtual {v8}, Lorg/apache/commons/net/ftp/FTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v2, v3, v5}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Ljava/lang/String;Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v2

    .line 277
    :cond_4
    invoke-virtual/range {p0 .. p2}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J

    move-result-wide v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Lcom/aor/droidedit/fs/implementation/FSFile;->setLastModified(J)V
    :try_end_4
    .catch Lcom/aor/droidedit/fs/exception/FSException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 287
    return-void

    .line 283
    .end local v4    # "is":Ljava/io/FileInputStream;
    .end local v6    # "max":J
    .end local v9    # "dst":Ljava/lang/String;
    .end local v12    # "replyCode":I
    .restart local v10    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    goto :goto_0

    .line 270
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v4    # "is":Ljava/io/FileInputStream;
    .restart local v6    # "max":J
    .restart local v9    # "dst":Ljava/lang/String;
    .restart local v12    # "replyCode":I
    :catch_3
    move-exception v2

    goto :goto_1
.end method
