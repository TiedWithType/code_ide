.class Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;
.super Ljava/lang/Object;
.source "DroidEditFileDialog.java"

# interfaces
.implements Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->changeFolder(Lcom/aor/droidedit/fs/implementation/FSFolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

.field private final synthetic val$folder:Lcom/aor/droidedit/fs/implementation/FSFolder;

.field private final synthetic val$progress:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;Landroid/widget/ImageView;Lcom/aor/droidedit/fs/implementation/FSFolder;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    iput-object p2, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$progress:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$folder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;)Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    return-object v0
.end method


# virtual methods
.method public listingComplete(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-static {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->access$0(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Landroid/widget/ListView;

    move-result-object v1

    new-instance v2, Lcom/aor/droidedit/filedialog/FileAdapter;

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v3}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 187
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$progress:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 189
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    sget v2, Lcom/aor/droidedit/lib/R$id;->current_path:I

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 190
    .local v0, "currentPath":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$folder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFolder;->getDisplayPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-static {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->access$3(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v2}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$folder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    invoke-virtual {v1, v2, v3}, Lcom/aor/droidedit/fs/implementation/FileSystem;->saveLastFolder(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    .line 194
    :cond_0
    return-void
.end method

.method public listingFailed()V
    .locals 4

    .prologue
    .line 198
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-static {v0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->access$3(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/implementation/FileSystem;->forgetLastFolder(Landroid/content/Context;)V

    .line 199
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 200
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->error_failed_getting_files:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 201
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_retry:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6$1;

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$folder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    invoke-direct {v2, p0, v3}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6$1;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 207
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->this$0:Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    invoke-virtual {v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6$2;

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;->val$progress:Landroid/widget/ImageView;

    invoke-direct {v2, p0, v3}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6$2;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 213
    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 214
    :cond_0
    return-void
.end method
