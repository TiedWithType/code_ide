.class Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;
.super Ljava/lang/Object;
.source "FTPFileSystem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->askForPassword(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FileSystem$INIT;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->this$0:Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;

    iput-object p2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;)Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->this$0:Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 145
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 146
    .local v0, "passwordEditText":Landroid/widget/EditText;
    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 147
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 148
    sget v2, Lcom/aor/droidedit/lib/R$string;->pref_sftp_server_password:I

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 149
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 150
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1$1;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    invoke-direct {v3, p0, v0, v4}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1$1;-><init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;Landroid/widget/EditText;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 158
    iget-object v2, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1$2;

    iget-object v4, p0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;->val$context:Landroid/content/Context;

    invoke-direct {v3, p0, v4}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1$2;-><init>(Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem$1;Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 165
    invoke-static {v1}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 166
    return-void
.end method
