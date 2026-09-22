.class Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;
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
    name = "GenericSaveAction"
.end annotation


# instance fields
.field public compatCloseAfterSave:Z
.field private compatSavedText:Ljava/lang/String;
.field private mDocument:Lcom/aor/droidedit/document/Document;

.field private mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

.field private mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

.field protected mOverwrite:Z

.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;


# direct methods
.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V
    .locals 1
    .param p2, "document"    # Lcom/aor/droidedit/document/Document;
    .param p3, "fileSystem"    # Lcom/aor/droidedit/fs/implementation/FileSystem;
    .param p4, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;

    .prologue
    .line 3392
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3390
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mOverwrite:Z

    .line 3393
    iput-object p2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    .line 3394
    iput-object p3, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    .line 3395
    iput-object p4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 3396
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;Lcom/aor/droidedit/fs/implementation/FileSystem;)V
    .locals 0

    .prologue
    .line 3389
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-void
.end method

.method static synthetic access$1(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/fs/implementation/FileSystem;
    .locals 1

    .prologue
    .line 3389
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    return-object v0
.end method

.method static synthetic access$2(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;Lcom/aor/droidedit/fs/implementation/FSFile;)V
    .locals 0

    .prologue
    .line 3388
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    return-void
.end method

.method static synthetic access$3(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/document/Document;
    .locals 1

    .prologue
    .line 3387
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    return-object v0
.end method

.method static synthetic access$4(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/fs/implementation/FSFile;
    .locals 1

    .prologue
    .line 3388
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    return-object v0
.end method

.method static synthetic access$5(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)Lcom/aor/droidedit/DroidEditActivity;
    .locals 1

    .prologue
    .line 3386
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    return-object v0
.end method


# virtual methods
.method public execute()V
    .locals 10

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 3400
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    if-nez v5, :cond_0

    .line 3401
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getFileSystems(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    .line 3402
    .local v3, "fileSystems":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FileSystem;>;"
    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {v5}, Lcom/code/ide/compat/FileSystemDialogUi;->setTitle(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v8, Lcom/aor/droidedit/lib/R$layout;->item_row:I

    sget v9, Lcom/aor/droidedit/lib/R$id;->text1:I

    new-array v4, v4, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-direct {v6, v7, v8, v9, v4}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;-><init>(Landroid/content/Context;II[Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$1;

    invoke-direct {v4, p0, v3}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$1;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;Ljava/util/List;)V

    invoke-virtual {v5, v6, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 3410
    invoke-static {v4}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 3507
    .end local v3    # "fileSystems":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FileSystem;>;"
    :goto_0
    return-void

    .line 3414
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, v6}, Lcom/aor/droidedit/fs/implementation/FileSystem;->isInitialized(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 3415
    new-instance v5, Lcom/aor/droidedit/fs/tasks/InitializationTask;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$2;

    invoke-direct {v8, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$2;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)V

    invoke-direct {v5, v6, v7, v0, v8}, Lcom/aor/droidedit/fs/tasks/InitializationTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;ZLcom/aor/droidedit/fs/tasks/listeners/InitializationListener;)V

    new-array v4, v4, [Ljava/lang/Void;

    .line 3425
    invoke-virtual {v5, v4}, Lcom/aor/droidedit/fs/tasks/InitializationTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 3429
    :cond_1
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-nez v5, :cond_2

    .line 3430
    new-instance v2, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget-object v5, Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;->SAVE:Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    const/4 v7, 0x0

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;-><init>(Landroid/content/Context;Lcom/aor/droidedit/filedialog/DroidEditFileDialog$DialogType;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFolder;)V

    .line 3431
    .local v2, "fileDialog":Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    invoke-virtual {v4}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setSuggestedName(Ljava/lang/String;)V

    .line 3432
    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$3;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$3;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)V

    invoke-virtual {v2, v4}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->setOnFileSelectedListener(Lcom/aor/droidedit/filedialog/FileSelectedListener;)V

    .line 3440
    invoke-virtual {v2}, Lcom/aor/droidedit/filedialog/DroidEditFileDialog;->show()V

    goto :goto_0

    .line 3444
    .end local v2    # "fileDialog":Lcom/aor/droidedit/filedialog/DroidEditFileDialog;
    :cond_2
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    invoke-virtual {v5}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    invoke-virtual {v5}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v5

    invoke-virtual {v5}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v6}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    move v0, v4

    .line 3446
    .local v0, "changedPath":Z
    :cond_3
    iget-boolean v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mOverwrite:Z

    if-nez v5, :cond_4

    if-eqz v0, :cond_4

    .line 3447
    new-instance v5, Lcom/aor/droidedit/fs/tasks/FileExistsTask;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    new-instance v9, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;

    invoke-direct {v9, p0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$4;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;)V

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/aor/droidedit/fs/tasks/FileExistsTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/FileExistsListener;)V

    new-array v4, v4, [Ljava/lang/Void;

    .line 3464
    invoke-virtual {v5, v4}, Lcom/aor/droidedit/fs/tasks/FileExistsTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 3469
    :cond_4
    :try_start_0
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v4, v5}, Lcom/aor/droidedit/fs/implementation/FSFile;->setFileSystem(Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    .line 3470
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v4, v5}, Lcom/aor/droidedit/document/Document;->setFile(Lcom/aor/droidedit/fs/implementation/FSFile;)V

    .line 3471
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v6, 0x0

    invoke-virtual {v4}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;
    move-result-object v9
    iput-object v9, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatSavedText:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/aor/droidedit/document/Document;->save(Landroid/content/Context;Z)V

    .line 3472
    new-instance v4, Lcom/aor/droidedit/fs/tasks/UploadFileTask;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFileSystem:Lcom/aor/droidedit/fs/implementation/FileSystem;

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;

    invoke-direct {v8, p0, v0}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction$5;-><init>(Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;Z)V

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/aor/droidedit/fs/tasks/UploadFileTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/fs/tasks/listeners/UploadListener;)V

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    .line 3502
    invoke-virtual {v4, v5}, Lcom/aor/droidedit/fs/tasks/UploadFileTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 3503
    :catch_0
    move-exception v1

    .line 3504
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "DroidEdit"

    const-string/jumbo v5, ""

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3505
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v5, Lcom/aor/droidedit/lib/R$string;->error_save_failed:I

    sget v6, Lcom/aor/droidedit/lib/R$string;->error_save_failed_msg:I

    invoke-static {v4, v5, v6}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;II)V

    goto/16 :goto_0
.end method

.method public compatApplySavedState()V
 .locals 3
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;
 invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;
 move-result-object v1
 iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatSavedText:Ljava/lang/String;
 invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
 move-result v1
 xor-int/lit8 v1, v1, 0x1
 invoke-virtual {v0, v1}, Lcom/aor/droidedit/document/Document;->setChanged(Z)V
 return-void
.end method
.method public compatFinishSave()V
 .locals 2
 iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatCloseAfterSave:Z
 if-eqz v0, :done
 const/4 v0, 0x0
 iput-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->compatCloseAfterSave:Z
 iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->this$0:Lcom/aor/droidedit/DroidEditActivity;
 iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->mDocument:Lcom/aor/droidedit/document/Document;
 invoke-virtual {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->compatCloseSaved(Lcom/aor/droidedit/document/Document;)V
 :done
 return-void
.end method
