.class Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;
.super Ljava/lang/Object;
.source "SFTPFileSystem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->askForPassphrase(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->this$0:Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;)Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->this$0:Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 172
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 173
    .local v0, "passphraseEditText":Landroid/widget/EditText;
    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 174
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 175
    sget v2, Lcom/aor/droidedit/lib/R$string;->pref_sftp_server_passphrase:I

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 176
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 177
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2$1;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    invoke-direct {v3, p0, v0, v4}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2$1;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;Landroid/widget/EditText;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 186
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2$2;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;->val$context:Landroid/content/Context;

    invoke-direct {v3, p0, v4}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2$2;-><init>(Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem$2;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 193
    invoke-static {v1}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 194
    return-void
.end method
