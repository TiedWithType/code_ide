.class public Lcom/aor/droidedit/filedialog/FileAdapter;
.super Landroid/widget/BaseAdapter;
.source "FileAdapter.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/aor/droidedit/fs/implementation/FSElement;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FSElement;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mContext:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mFiles:Ljava/util/List;

    .line 27
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 28
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mFiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "pos"    # I

    .prologue
    .line 46
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemName(I)Ljava/lang/String;
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mFiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/FSElement;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSElement;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 51
    if-nez p2, :cond_0

    .line 52
    iget-object v7, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mInflater:Landroid/view/LayoutInflater;

    sget v8, Lcom/aor/droidedit/lib/R$layout;->file_row:I

    const/4 v9, 0x0

    invoke-virtual {v7, v8, p3, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 54
    :cond_0
    sget v7, Lcom/aor/droidedit/lib/R$id;->file_name:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 55
    .local v4, "filename":Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItemName(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    sget v7, Lcom/aor/droidedit/lib/R$id;->file_image:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 58
    .local v3, "fileimage":Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/aor/droidedit/fs/implementation/FSElement;

    invoke-virtual {v7}, Lcom/aor/droidedit/fs/implementation/FSElement;->getIcon()I

    move-result v7

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 60
    sget v7, Lcom/aor/droidedit/lib/R$id;->file_data:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 61
    .local v0, "dataLayout":Landroid/widget/LinearLayout;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/aor/droidedit/fs/implementation/FSElement;

    invoke-virtual {v7}, Lcom/aor/droidedit/fs/implementation/FSElement;->getSize()Ljava/lang/String;

    move-result-object v6

    .line 62
    .local v6, "size":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/aor/droidedit/fs/implementation/FSElement;

    iget-object v8, p0, Lcom/aor/droidedit/filedialog/FileAdapter;->mContext:Landroid/content/Context;

    invoke-static {v8}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/aor/droidedit/fs/implementation/FSElement;->getLastModified(Ljava/text/DateFormat;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "date":Ljava/lang/String;
    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string/jumbo v7, ""

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 65
    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 67
    sget v7, Lcom/aor/droidedit/lib/R$id;->file_date:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 68
    .local v2, "filedate":Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/aor/droidedit/fs/implementation/FSElement;

    invoke-virtual {v7}, Lcom/aor/droidedit/fs/implementation/FSElement;->getLastModified()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/aor/droidedit/util/StringFormatter;->getTimeAgo(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    sget v7, Lcom/aor/droidedit/lib/R$id;->file_size:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 71
    .local v5, "filesize":Landroid/widget/TextView;
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/filedialog/FileAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/aor/droidedit/fs/implementation/FSElement;

    invoke-virtual {v7}, Lcom/aor/droidedit/fs/implementation/FSElement;->getSize()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .end local v2    # "filedate":Landroid/widget/TextView;
    .end local v5    # "filesize":Landroid/widget/TextView;
    :goto_0
    return-object p2

    .line 73
    :cond_2
    const/16 v7, 0x8

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method
