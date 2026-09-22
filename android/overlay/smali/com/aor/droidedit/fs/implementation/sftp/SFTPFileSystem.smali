.class public Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;
.super Lcom/aor/droidedit/fs/implementation/FileSystem;
.source "SFTPFileSystem.java"


# static fields
.field private static mSavedConnections:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0xe2dc1f8ab90538fL


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private transient mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

.field private final mHomeFolder:Ljava/lang/String;

.field private final mId:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private final transient mPassword:Ljava/lang/String;

.field private final mPort:Ljava/lang/String;

.field private final mPrivateKey:Ljava/lang/String;

.field private final mUsername:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 51
    invoke-direct {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;-><init>()V

    .line 52
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 53
    .local v6, "prefs":Landroid/content/SharedPreferences;
    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mId:Ljava/lang/String;

    .line 54
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mName:Ljava/lang/String;

    .line 55
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    .line 56
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    .line 57
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPassword:Ljava/lang/String;

    .line 58
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    .line 59
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

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mHomeFolder:Ljava/lang/String;

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".use_global_private_key"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v6, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    const-string/jumbo v0, "sftpPrivateKey"

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    .line 65
    :goto_0
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 67
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPassword:Ljava/lang/String;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    iget-object v5, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 69
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    :cond_0
    return-void

    .line 63
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "server."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".private_key"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v6, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "port"    # Ljava/lang/String;
    .param p6, "privateKey"    # Ljava/lang/String;
    .param p7, "homeFolder"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;-><init>()V

    .line 74
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mName:Ljava/lang/String;

    .line 75
    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    .line 76
    iput-object p3, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    .line 77
    iput-object p4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPassword:Ljava/lang/String;

    .line 78
    iput-object p5, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    .line 79
    iput-object p6, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    .line 80
    iput-object p7, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mHomeFolder:Ljava/lang/String;

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mId:Ljava/lang/String;

    .line 82
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    return-void
.end method

.method static synthetic access$5()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$6(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    return-object v0
.end method

.method static synthetic access$7(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPassword:Ljava/lang/String;

    return-object v0
.end method

.method private askForPassphrase(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 168
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 169
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;

    invoke-direct {v1, p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 196
    sget-object v1, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v1
.end method

.method private askForPassword(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 137
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 138
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$1;

    invoke-direct {v1, p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$1;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 164
    sget-object v1, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v1
.end method

.method public static forgetSavedConnection(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 390
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    new-instance v1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    invoke-direct {v1, p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    return-void
.end method

.method public static forgetSavedConnection(Ljava/lang/String;)V
    .locals 1
    .param p0, "uid"    # Ljava/lang/String;

    .prologue
    .line 386
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    return-void
.end method

.method public static forgetSavedConnections()V
    .locals 1

    .prologue
    .line 382
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 383
    return-void
.end method


# virtual methods
.method public createFile(Lcom/aor/droidedit/fs/implementation/FSFolder;Ljava/lang/String;)Lcom/aor/droidedit/fs/implementation/FSFile;
    .locals 8
    .param p1, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 373
    new-instance v1, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;

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

    const-wide/16 v4, -0x1

    const-wide/16 v6, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
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
    .line 362
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

    move-result-object v1

    .line 364
    .local v1, "path":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/ChannelSftp;->mkdir(Ljava/lang/String;)V

    .line 365
    new-instance v2, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    invoke-direct {v2, v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    :goto_0
    return-object v2

    .line 366
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public download(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 271
    :try_start_0
    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v1

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$3;

    invoke-direct {v4, p0, p3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$3;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/jcraft/jsch/ChannelSftp;->get(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V

    .line 292
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J

    move-result-wide v2

    invoke-virtual {p2, v2, v3}, Lcom/aor/droidedit/fs/implementation/FSFile;->setLastModified(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    return-void

    .line 293
    :catch_0
    move-exception v0

    .line 294
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "DroidEdit"

    const-string/jumbo v2, ""

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 295
    new-instance v1, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v2, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v1, v2}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v1
.end method

.method public fileExists(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 353
    :try_start_0
    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v1

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 354
    :catch_0
    move-exception v0

    .line 355
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getDefaultFolder()Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 6

    .prologue
    .line 207
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mHomeFolder:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mHomeFolder:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 209
    :try_start_0
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mHomeFolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 210
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v1

    .line 211
    .local v1, "pwd":Ljava/lang/String;
    new-instance v2, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    invoke-direct {v2, v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .end local v1    # "pwd":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 212
    :catch_0
    move-exception v2

    .line 215
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp;->getHome()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 216
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v1

    .line 217
    .restart local v1    # "pwd":Ljava/lang/String;
    new-instance v2, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    invoke-direct {v2, v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 218
    .end local v1    # "pwd":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 219
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 221
    new-instance v2, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    const-wide/16 v4, -0x1

    invoke-direct {v2, v4, v5}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(J)V

    goto :goto_0
.end method

.method public getExec()Lcom/jcraft/jsch/ChannelExec;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 394
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getExec()Lcom/jcraft/jsch/ChannelExec;

    move-result-object v0

    return-object v0
.end method

.method public getFiles(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;)Ljava/util/List;
    .locals 18
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
    .line 226
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v12, "files":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 229
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/jcraft/jsch/ChannelSftp;->cd(Ljava/lang/String;)V

    .line 231
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/ChannelSftp;->pwd()Ljava/lang/String;

    move-result-object v14

    .line 233
    .local v14, "pwd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    const-string/jumbo v5, "."

    invoke-virtual {v3, v5}, Lcom/jcraft/jsch/ChannelSftp;->ls(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v10

    .line 235
    .local v10, "entries":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    invoke-virtual {v10}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_1
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3

    .line 256
    const-string/jumbo v3, "/"

    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 257
    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    const/4 v5, 0x0

    const-string/jumbo v8, "/"

    invoke-virtual {v14, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v14, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v8, ".."

    const-wide/16 v16, -0x1

    move-wide/from16 v0, v16

    invoke-direct {v3, v5, v8, v0, v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    :cond_2
    return-object v12

    .line 235
    :cond_3
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/jcraft/jsch/ChannelSftp$LsEntry;

    .line 236
    .local v11, "entry":Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v3

    if-nez v3, :cond_6

    .line 237
    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->isLink()Z

    move-result v3

    if-nez v3, :cond_4

    .line 238
    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;

    invoke-direct {v3, v14, v11}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;-><init>(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntry;)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 258
    .end local v10    # "entries":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .end local v11    # "entry":Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v14    # "pwd":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 259
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "Auth fail"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v5, Lcom/aor/droidedit/fs/exception/FSException$REASON;->AUTH:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v5}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3

    .line 240
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v10    # "entries":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .restart local v11    # "entry":Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .restart local v14    # "pwd":Ljava/lang/String;
    :cond_4
    :try_start_1
    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->isLink()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    if-eqz v3, :cond_1

    .line 242
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "/"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/jcraft/jsch/ChannelSftp;->realpath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 243
    .local v4, "realPath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/jcraft/jsch/ChannelSftp;->stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->isDir()Z

    move-result v13

    .line 244
    .local v13, "isDir":Z
    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/SftpATTRS;->getMTime()I

    move-result v3

    int-to-long v8, v3

    const-wide/16 v16, 0x3e8

    mul-long v6, v8, v16

    .line 245
    .local v6, "lastModified":J
    if-eqz v13, :cond_5

    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 247
    .end local v4    # "realPath":Ljava/lang/String;
    .end local v6    # "lastModified":J
    .end local v13    # "isDir":Z
    :catch_1
    move-exception v3

    goto/16 :goto_0

    .line 246
    .restart local v4    # "realPath":Ljava/lang/String;
    .restart local v6    # "lastModified":J
    .restart local v13    # "isDir":Z
    :cond_5
    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;

    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getAttrs()Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v8

    invoke-virtual {v8}, Lcom/jcraft/jsch/SftpATTRS;->getSize()J

    move-result-wide v8

    invoke-direct/range {v3 .. v9}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFile;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 251
    .end local v4    # "realPath":Ljava/lang/String;
    .end local v6    # "lastModified":J
    .end local v13    # "isDir":Z
    :cond_6
    :try_start_3
    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v11}, Lcom/jcraft/jsch/ChannelSftp$LsEntry;->getFilename()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, ".."

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 252
    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;

    invoke-direct {v3, v14, v11}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFolder;-><init>(Ljava/lang/String;Lcom/jcraft/jsch/ChannelSftp$LsEntry;)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 261
    .end local v10    # "entries":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/jcraft/jsch/ChannelSftp$LsEntry;>;"
    .end local v11    # "entry":Lcom/jcraft/jsch/ChannelSftp$LsEntry;
    .end local v14    # "pwd":Ljava/lang/String;
    .restart local v2    # "e":Ljava/lang/Exception;
    :cond_7
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "2: No such file"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v5, Lcom/aor/droidedit/fs/exception/FSException$REASON;->NOTFOUND:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v5}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3

    .line 262
    :cond_8
    const-string/jumbo v3, "DroidEdit"

    const-string/jumbo v5, ""

    invoke-static {v3, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 263
    new-instance v3, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v5, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v3, v5}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v3
.end method

.method public getIcon()I
    .locals 1

    .prologue
    .line 91
    sget v0, Lcom/aor/droidedit/lib/R$drawable;->remote:I

    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getUID()Ljava/lang/String;
    .locals 2

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "SFTP_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public initialize(Landroid/content/Context;Z)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "startAuthProcess"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    invoke-static {p1, p0}, Lcom/code/ide/compat/StorageAccess;->missing(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;)I

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->WAIT:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v0

    :cond_0
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    return-object v0

    .prologue
    .line 101
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    if-nez v0, :cond_2

    .line 102
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 103
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    if-nez v0, :cond_2

    .line 104
    new-instance v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mUsername:Ljava/lang/String;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mAddress:Ljava/lang/String;

    iget-object v3, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPassword:Ljava/lang/String;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPort:Ljava/lang/String;

    iget-object v5, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 105
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    :cond_2
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    .line 133
    :goto_0
    return-object v0

    .line 112
    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/jcraft/jsch/ChannelSftp;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 113
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->setTested(Z)V

    .line 114
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 115
    :cond_4
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->SUCCESS:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    :catch_0
    move-exception v6

    .line 118
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Auth fail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    if-eqz p2, :cond_7

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 119
    :cond_5
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 120
    :cond_6
    invoke-direct {p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->askForPassword(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    move-result-object v0

    goto :goto_0

    .line 122
    :cond_7
    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Auth fail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    if-eqz p2, :cond_9

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mPrivateKey:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 123
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto :goto_0

    .line 124
    :cond_8
    invoke-direct {p0, p1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->askForPassphrase(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    move-result-object v0

    goto :goto_0

    .line 126
    :cond_9
    const-string/jumbo v0, "DroidEdit"

    const-string/jumbo v1, ""

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 129
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 130
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->isInitializationCanceled()Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->CANCELED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto/16 :goto_0

    .line 133
    :cond_b
    sget-object v0, Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;->FAILED:Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;

    goto/16 :goto_0
.end method

.method public isInitialized(Landroid/content/Context;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    invoke-static {p1}, Lcom/code/ide/compat/StorageAccess;->hasLan(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return v0

    .prologue
    .line 96
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->isTested()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 344
    :try_start_0
    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v1

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/ChannelSftp;->stat(Ljava/lang/String;)Lcom/jcraft/jsch/SftpATTRS;

    move-result-object v1

    invoke-virtual {v1}, Lcom/jcraft/jsch/SftpATTRS;->getMTime()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    .line 346
    :goto_0
    return-wide v2

    .line 345
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 378
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public unlink(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    .line 202
    sget-object v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mSavedConnections:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    return-void
.end method

.method public upload(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "listener"    # Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/aor/droidedit/fs/exception/FSException;
        }
    .end annotation

    .prologue
    .line 302
    :try_start_0
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 303
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v4, "saveTemp"

    const/4 v5, 0x0

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 304
    .local v3, "saveTemp":Z
    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 305
    .local v0, "dst":Ljava/lang/String;
    if-eqz v3, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, ".part"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    :cond_0
    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v4}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v4

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$4;

    invoke-direct {v6, p0, p3}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$4;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;)V

    invoke-virtual {v4, v5, v0, v6}, Lcom/jcraft/jsch/ChannelSftp;->put(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/SftpProgressMonitor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    if-eqz v3, :cond_1

    .line 329
    :try_start_1
    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v4}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v4

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/ChannelSftp;->rm(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 332
    :goto_0
    :try_start_2
    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->mConnection:Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;

    invoke-virtual {v4}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPConnection;->getChannel()Lcom/jcraft/jsch/ChannelSftp;

    move-result-object v4

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Lcom/jcraft/jsch/ChannelSftp;->rename(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->lastModified(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)J

    move-result-wide v4

    invoke-virtual {p2, v4, v5}, Lcom/aor/droidedit/fs/implementation/FSFile;->setLastModified(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 339
    return-void

    .line 335
    .end local v0    # "dst":Ljava/lang/String;
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    .end local v3    # "saveTemp":Z
    :catch_0
    move-exception v1

    .line 336
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "DroidEdit"

    const-string/jumbo v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 337
    new-instance v4, Lcom/aor/droidedit/fs/exception/FSException;

    sget-object v5, Lcom/aor/droidedit/fs/exception/FSException$REASON;->UNKNOWN:Lcom/aor/droidedit/fs/exception/FSException$REASON;

    invoke-direct {v4, v5}, Lcom/aor/droidedit/fs/exception/FSException;-><init>(Lcom/aor/droidedit/fs/exception/FSException$REASON;)V

    throw v4

    .line 330
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "dst":Ljava/lang/String;
    .restart local v2    # "prefs":Landroid/content/SharedPreferences;
    .restart local v3    # "saveTemp":Z
    :catch_1
    move-exception v4

    goto :goto_0
.end method
