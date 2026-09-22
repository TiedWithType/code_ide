.class public Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
.super Landroid/app/Dialog;
.source "DroidEditFileDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;
    }
.end annotation


# instance fields
.field private mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

.field private mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

.field private mList:Landroid/widget/ListView;

.field private mListener:Lcom/aor/droidedit/filedialog/FileSelectedListener;

.field private mSuggestedName:Ljava/lang/String;

.field private mType:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;
    .param p3, "fileSystem"    # Lcom/aor/droidedit/fs/implementation/FileSystem;
    .param p4, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;

    .prologue
    .line 46
    sget v0, Lcom/aor/droidedit/lib/R$style;->FileDialog:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 48
    iput-object p2, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mType:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    .line 50
    iput-object p3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 52
    if-nez p4, :cond_0

    invoke-virtual {p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getLastFolder(Landroid/content/Context;)Lcom/aor/droidedit/fs/implementation/FSFolder;

    move-result-object p4

    .line 53
    :cond_0
    if-nez p4, :cond_1

    invoke-virtual {p3}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getDefaultFolder()Lcom/aor/droidedit/fs/implementation/FSFolder;

    move-result-object p4

    .line 54
    :cond_1
    iput-object p4, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    .line 55
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$1(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;Lcom/aor/droidedit/fs/implementation/FSFolder;)V
    .locals 0

    .prologue
    .line 177
    invoke-direct {p0, p1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->changeFolder(Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    return-void
.end method

.method static synthetic access$2(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Lcom/aor/droidedit/filedialog/FileSelectedListener;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mListener:Lcom/aor/droidedit/filedialog/FileSelectedListener;

    return-object v0
.end method

.method static synthetic access$3(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Lcom/aor/droidedit/fs/implementation/FileSystem;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-object v0
.end method

.method static synthetic access$4(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)Lcom/aor/droidedit/fs/implementation/FSFolder;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    return-object v0
.end method

.method private changeFolder(Lcom/aor/droidedit/fs/implementation/FSFolder;)V
    .locals 7
    .param p1, "folder"    # Lcom/aor/droidedit/fs/implementation/FSFolder;

    .prologue
    const/4 v6, 0x0

    .line 178
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    .line 180
    sget v1, Lcom/aor/droidedit/lib/R$id;->getfilesprogress:I

    invoke-virtual {p0, v1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 181
    .local v0, "progress":Landroid/widget/ImageView;
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 183
    new-instance v1, Lcom/aor/droidedit/fs/tasks/ListFilesTask;

    invoke-virtual {p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v4, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    new-instance v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;

    invoke-direct {v5, p0, v0, p1}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$6;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;Landroid/widget/ImageView;Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;Lcom/aor/droidedit/fs/tasks/listeners/FileListingListener;)V

    new-array v2, v6, [Ljava/lang/Void;

    .line 215
    invoke-virtual {v1, v2}, Lcom/aor/droidedit/fs/tasks/ListFilesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 216
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 224
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 225
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    invoke-virtual {v1, v6}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/FSElement;

    .line 226
    .local v0, "element":Lcom/aor/droidedit/fs/implementation/FSElement;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/aor/droidedit/fs/implementation/FSFolder;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSElement;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ".."

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 227
    iget-object v1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-interface {v2, v6, v3, v3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3, v6}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    invoke-virtual {v1, v2, v6, v4, v5}, Landroid/widget/ListView;->performItemClick(Landroid/view/View;IJ)Z

    .line 230
    .end local v0    # "element":Lcom/aor/droidedit/fs/implementation/FSElement;
    :goto_0
    return-void

    .line 228
    .restart local v0    # "element":Lcom/aor/droidedit/fs/implementation/FSElement;
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    goto :goto_0

    .line 229
    .end local v0    # "element":Lcom/aor/droidedit/fs/implementation/FSElement;
    :cond_1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    const/16 v7, 0x8

    .line 63
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 65
    sget v5, Lcom/aor/droidedit/lib/R$layout;->file_dialog:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setContentView(I)V

    .line 66
    invoke-virtual {p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 68
    sget v5, Lcom/aor/droidedit/lib/R$id;->file_list:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    iput-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    .line 70
    sget v5, Lcom/aor/droidedit/lib/R$id;->new_file_button:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 71
    .local v3, "newFileButton":Landroid/widget/Button;
    sget v5, Lcom/aor/droidedit/lib/R$id;->new_file_name:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 73
    .local v4, "newFileName":Landroid/widget/EditText;
    sget v5, Lcom/aor/droidedit/lib/R$id;->add_folder:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 74
    .local v0, "addFolder":Landroid/widget/ImageView;
    new-instance v5, Lcom/aor/droidedit/util/Buttonizer;

    invoke-direct {v5}, Lcom/aor/droidedit/util/Buttonizer;-><init>()V

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 76
    sget v5, Lcom/aor/droidedit/lib/R$id;->home_folder:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 77
    .local v1, "homeFolder":Landroid/widget/ImageView;
    new-instance v5, Lcom/aor/droidedit/util/Buttonizer;

    invoke-direct {v5}, Lcom/aor/droidedit/util/Buttonizer;-><init>()V

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 79
    sget v5, Lcom/aor/droidedit/lib/R$id;->home_up:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 80
    .local v2, "homeUp":Landroid/widget/ImageView;
    new-instance v5, Lcom/aor/droidedit/util/Buttonizer;

    invoke-direct {v5}, Lcom/aor/droidedit/util/Buttonizer;-><init>()V

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 82
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mType:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    sget-object v6, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;->OPEN:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    if-ne v5, v6, :cond_0

    .line 83
    sget v5, Lcom/aor/droidedit/lib/R$string;->file_management_open_file:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setTitle(I)V

    .line 84
    sget v5, Lcom/aor/droidedit/lib/R$id;->new_file_layout:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 85
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 86
    invoke-virtual {v4, v7}, Landroid/widget/EditText;->setVisibility(I)V

    .line 87
    invoke-virtual {v3, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 90
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mType:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    sget-object v6, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;->SAVE:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    if-ne v5, v6, :cond_1

    .line 91
    sget v5, Lcom/aor/droidedit/lib/R$string;->file_management_save_file:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setTitle(I)V

    .line 92
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mSuggestedName:Ljava/lang/String;

    if-nez v5, :cond_2

    invoke-static {}, Lcom/code/ide/compat/AppText;->untitled()Ljava/lang/String;
    move-result-object v5
    const-string v6, ".txt"
    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5

    :goto_0
    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 94
    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setVisibility(I)V

    .line 95
    invoke-virtual {v3, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 98
    :cond_1
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mList:Landroid/widget/ListView;

    new-instance v6, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$1;

    invoke-direct {v6, p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$1;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 117
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v5}, Lcom/aor/droidedit/fs/implementation/FileSystem;->hasDefaultFolder()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 118
    new-instance v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$2;

    invoke-direct {v5, p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$2;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)V

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    :goto_1
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v5}, Lcom/aor/droidedit/fs/implementation/FileSystem;->canCreateFolders()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 127
    new-instance v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;

    invoke-direct {v5, p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$3;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    :goto_2
    new-instance v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$4;

    invoke-direct {v5, p0, v4}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$4;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;Landroid/widget/EditText;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    new-instance v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$5;

    invoke-direct {v5, p0}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$5;-><init>(Lcom/aor/droidedit/filedialog/DroidEditFileDialog;)V

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mFolder:Lcom/aor/droidedit/fs/implementation/FSFolder;

    invoke-direct {p0, v5}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->changeFolder(Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    .line 175
    return-void

    .line 92
    :cond_2
    iget-object v5, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mSuggestedName:Ljava/lang/String;

    goto :goto_0

    .line 124
    :cond_3
    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 155
    :cond_4
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2
.end method

.method public setOnFileSelectedListener(Lcom/aor/droidedit/filedialog/FileSelectedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/aor/droidedit/filedialog/FileSelectedListener;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mListener:Lcom/aor/droidedit/filedialog/FileSelectedListener;

    .line 220
    return-void
.end method

.method public setSuggestedName(Ljava/lang/String;)V
    .locals 0
    .param p1, "suggestedName"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->mSuggestedName:Ljava/lang/String;

    .line 59
    return-void
.end method
