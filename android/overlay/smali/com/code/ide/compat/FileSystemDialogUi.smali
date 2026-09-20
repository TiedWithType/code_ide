.class public final Lcom/code/ide/compat/FileSystemDialogUi;
.super Ljava/lang/Object;

.method public static setTitle(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog$Builder;
    .locals 3
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v0
    const v1, 0x7f030021
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    move-result-object v0
    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;
    move-result-object v0
    return-object v0
.end method
