.class Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Lcom/aor/droidedit/DroidEditActivity$Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/aor/droidedit/DroidEditActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GenericOpenAction"
.end annotation


# instance fields
.field private mEncoding:Lcom/aor/droidedit/document/Encoding;

.field private mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

.field private mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;


# direct methods
.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;)V
    .locals 1
    .param p2, "document"    # Lcom/aor/droidedit/document/Document;

    .prologue
    .line 3232
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3233
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getEncoding()Lcom/aor/droidedit/document/Encoding;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    .line 3234
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 3235
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 3236
    return-void
.end method

.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V
    .locals 0
    .param p2, "encoding"    # Lcom/aor/droidedit/document/Encoding;

    .prologue
    .line 3228
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3229
    iput-object p2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    .line 3230
    return-void
.end method

.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V
    .locals 1
    .param p2, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p3, "encoding"    # Lcom/aor/droidedit/document/Encoding;

    .prologue
    .line 3238
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3239
    iput-object p3, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    .line 3240
    iput-object p2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 3241
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 3242
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Lcom/aor/droidedit/document/Encoding;)V
    .locals 0

    .prologue
    .line 3224
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    return-void
.end method

.method static synthetic access$1(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Lcom/aor/droidedit/fs/implementation/FileSystem;)V
    .locals 0

    .prologue
    .line 3225
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-void
.end method

.method static synthetic access$2(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)Lcom/aor/droidedit/fs/implementation/FileSystem;
    .locals 1

    .prologue
    .line 3225
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-object v0
.end method

.method static synthetic access$3(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Lcom/aor/droidedit/fs/implementation/FSFile;)V
    .locals 0

    .prologue
    .line 3226
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    return-void
.end method

.method static synthetic access$4(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)Lcom/aor/droidedit/DroidEditActivity;
    .locals 1

    .prologue
    .line 3223
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    return-object v0
.end method


# virtual methods
.method public execute()V
    .locals 15

    .prologue
    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v14, 0x0

    .line 3246
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    if-nez v8, :cond_1

    .line 3247
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v7

    .line 3248
    .local v7, "selected":Lcom/aor/droidedit/document/Encoding;
    new-instance v8, Landroid/app/AlertDialog$Builder;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v8, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v9, Lcom/aor/droidedit/lib/R$string;->file_management_select_encoding:I

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    sget-object v9, Lcom/aor/droidedit/document/Encoding;->encodings:[Lcom/aor/droidedit/document/Encoding;

    new-instance v10, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$1;

    invoke-direct {v10, p0, v7}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$1;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v8, v9, v14, v10}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 3252
    sget v9, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    new-instance v10, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$2;

    invoke-direct {v10, p0, v7}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$2;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 3257
    sget v9, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    new-instance v10, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$3;

    invoke-direct {v10, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$3;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)V

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 3260
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 3382
    .end local v7    # "selected":Lcom/aor/droidedit/document/Encoding;
    :cond_0
    :goto_0
    return-void

    .line 3264
    :cond_1
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    if-nez v8, :cond_3

    .line 3265
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getFileSystems(Landroid/content/Context;)Ljava/util/List;

    move-result-object v5

    .line 3266
    .local v5, "fileSystems":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FileSystem;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v12, :cond_2

    .line 3267
    invoke-interface {v5, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/aor/droidedit/fs/implementation/FileSystem;

    iput-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 3268
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    goto :goto_0

    .line 3270
    :cond_2
    new-instance v8, Landroid/app/AlertDialog$Builder;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v8, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {v8}, Lcom/code/ide/compat/FileSystemDialogUi;->setTitle(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    new-instance v10, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;

    iget-object v11, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v12, Lcom/aor/droidedit/lib/R$layout;->item_row:I

    sget v13, Lcom/aor/droidedit/lib/R$id;->text1:I

    new-array v8, v14, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-interface {v5, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-direct {v10, v11, v12, v13, v8}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;-><init>(Landroid/content/Context;II[Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$4;

    invoke-direct {v8, p0, v5}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$4;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;Ljava/util/List;)V

    invoke-virtual {v9, v10, v8}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 3278
    invoke-static {v8}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    goto :goto_0

    .line 3282
    .end local v5    # "fileSystems":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FileSystem;>;"
    :cond_3
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/fs/implementation/FileSystem;->isInitialized(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 3283
    new-instance v8, Lcom/aor/droidedit/fs/tasks/InitializationTask;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v10, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    new-instance v11, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$5;

    invoke-direct {v11, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$5;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)V

    invoke-direct {v8, v9, v10, v12, v11}, Lcom/aor/droidedit/fs/tasks/InitializationTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;ZLcom/aor/droidedit/fs/tasks/listeners/InitializationListener;)V

    new-array v9, v14, [Ljava/lang/Void;

    .line 3293
    invoke-virtual {v8, v9}, Lcom/aor/droidedit/fs/tasks/InitializationTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 3297
    :cond_4
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-nez v8, :cond_5

    .line 3298
    new-instance v4, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget-object v9, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;->OPEN:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    iget-object v10, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-direct {v4, v8, v9, v10, v11}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;-><init>(Landroid/content/Context;Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    .line 3299
    .local v4, "fileDialog":Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$6;

    invoke-direct {v8, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$6;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)V

    invoke-virtual {v4, v8}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setOnFileSelectedListener(Lcom/aor/droidedit/filedialog/FileSelectedListener;)V

    .line 3306
    invoke-virtual {v4}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->show()V

    goto/16 :goto_0

    .line 3310
    .end local v4    # "fileDialog":Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    :cond_5
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v8}, Lcom/aor/droidedit/fs/implementation/FSFile;->isDownloaded()Z

    move-result v8

    if-nez v8, :cond_6

    .line 3311
    new-instance v8, Lcom/aor/droidedit/fs/tasks/DownloadFileTask;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v10, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v11, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    new-instance v12, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$7;

    invoke-direct {v12, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction$7;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;)V

    invoke-direct {v8, v9, v10, v11, v12}, Lcom/aor/droidedit/fs/tasks/DownloadFileTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/DownloadListener;)V

    new-array v9, v14, [Ljava/lang/Void;

    .line 3331
    invoke-virtual {v8, v9}, Lcom/aor/droidedit/fs/tasks/DownloadFileTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 3335
    :cond_6
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8, v9}, Lcom/aor/droidedit/fs/implementation/recent/RecentFileSystem;->addToRecentFiles(Lcom/aor/droidedit/fs/implementation/FSFile;Landroid/content/Context;)V

    .line 3338
    :try_start_0
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-static {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->access$20(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;)I

    move-result v1

    .line 3339
    .local v1, "alreadyOpen":I
    const/4 v8, -0x1

    if-eq v1, v8, :cond_7

    .line 3340
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8, v1}, Lcom/aor/droidedit/DroidEditActivity;->access$21(Lcom/aor/droidedit/DroidEditActivity;I)Lcom/aor/droidedit/document/Document;

    move-result-object v8

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/document/Document;->setEncoding(Lcom/aor/droidedit/document/Encoding;)V

    .line 3341
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8, v1}, Lcom/aor/droidedit/DroidEditActivity;->access$21(Lcom/aor/droidedit/DroidEditActivity;I)Lcom/aor/droidedit/document/Document;

    move-result-object v8

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lcom/aor/droidedit/document/Document;->load(Landroid/content/Context;Z)V

    .line 3342
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v9, 0x1

    invoke-virtual {v8, v1, v9}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 3378
    .end local v1    # "alreadyOpen":I
    :catch_0
    move-exception v3

    .line 3379
    .local v3, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "DroidEdit"

    const-string/jumbo v9, ""

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3380
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Lcom/aor/droidedit/lib/R$string;->error_opening:I

    invoke-static {v8, v9, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 3346
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "alreadyOpen":I
    :cond_7
    :try_start_1
    new-instance v2, Lcom/aor/droidedit/document/Document;

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    invoke-direct {v2, v8, v9}, Lcom/aor/droidedit/document/Document;-><init>(Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V

    .line 3347
    .local v2, "document":Lcom/aor/droidedit/document/Document;
    const/4 v6, 0x1

    .line 3349
    .local v6, "newDocument":Z
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v8

    if-nez v8, :cond_8

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v8

    if-nez v8, :cond_8

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 3350
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v2

    .line 3351
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v2, v8}, Lcom/aor/droidedit/document/Document;->setFile(Lcom/aor/droidedit/fs/implementation/FSFile;)V

    .line 3352
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->mEncoding:Lcom/aor/droidedit/document/Encoding;

    invoke-virtual {v2, v8}, Lcom/aor/droidedit/document/Document;->setEncoding(Lcom/aor/droidedit/document/Encoding;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 3353
    const/4 v6, 0x0

    .line 3357
    :cond_8
    :try_start_2
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v9, 0x0

    invoke-virtual {v2, v8, v9}, Lcom/aor/droidedit/document/Document;->load(Landroid/content/Context;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 3363
    if-eqz v6, :cond_a

    .line 3365
    :try_start_3
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$22(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ListView;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 3366
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 3367
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 3372
    .end local v0    # "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    :goto_1
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->notifyDocumentListChanged()V

    .line 3374
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v8}, Lcom/aor/droidedit/DroidEditActivity;->access$23(Lcom/aor/droidedit/DroidEditActivity;)V

    .line 3376
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xb

    if-lt v8, v9, :cond_0

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/ActionBar;->isShowing()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 3377
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->invalidateOptionsMenu()V

    goto/16 :goto_0

    .line 3358
    :catch_1
    move-exception v3

    .line 3359
    .restart local v3    # "e":Ljava/lang/Exception;
    if-nez v6, :cond_9

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Lcom/aor/droidedit/document/Document;->setFile(Lcom/aor/droidedit/fs/implementation/FSFile;)V

    .line 3360
    :cond_9
    throw v3

    .line 3369
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_a
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method
