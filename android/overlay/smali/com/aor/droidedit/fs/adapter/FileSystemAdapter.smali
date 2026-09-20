.class public Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;
.super Landroid/widget/ArrayAdapter;
.source "FileSystemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/aor/droidedit/fs/implementation/FileSystem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;II[Lcom/aor/droidedit/fs/implementation/FileSystem;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutResource"    # I
    .param p3, "textResource"    # I
    .param p4, "items"    # [Lcom/aor/droidedit/fs/implementation/FileSystem;

    .prologue
    .line 14
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    .line 15
    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 28
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 30
    .local v1, "v":Landroid/view/View;
    sget v2, Lcom/aor/droidedit/lib/R$id;->icon1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 32
    .local v0, "iv":Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getIcon()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 34
    invoke-direct {p0, v1, p1}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->bindLocalizedLabel(Landroid/view/View;I)V

    return-object v1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 18
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 19
    .local v1, "v":Landroid/view/View;
    sget v2, Lcom/aor/droidedit/lib/R$id;->icon1:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 21
    .local v0, "iv":Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-virtual {v2}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getIcon()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 23
    invoke-direct {p0, v1, p1}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->bindLocalizedLabel(Landroid/view/View;I)V

    return-object v1
.end method

# Resolve UI labels using the current Context locale; retain stable model names.
.method private bindLocalizedLabel(Landroid/view/View;I)V
    .locals 4
    invoke-virtual {p0, p2}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;
    if-eqz v1, :recent
    const v1, 0x7f050195
    goto :bind
    :recent
    instance-of v1, v0, Lcom/aor/droidedit/fs/implementation/recent/RecentFileSystem;
    if-eqz v1, :done
    const v1, 0x7f050196
    :bind
    invoke-virtual {p0}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v2
    sget v3, Lcom/aor/droidedit/lib/R$id;->text1:I
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
    check-cast v3, Landroid/widget/TextView;
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :done
    return-void
.end method
