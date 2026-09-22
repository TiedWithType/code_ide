.class Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;
.super Ljava/lang/Object;
.source "DroidEditFileDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;)Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 131
    .local v0, "addFolderText":Landroid/widget/EditText;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v2}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 132
    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_add_folder:I

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 133
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 134
    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_create:I

    new-instance v3, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3$1;

    invoke-direct {v3, p0, v0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3$1;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 150
    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 151
    invoke-static {v1}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 152
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 153
    return-void
.end method
