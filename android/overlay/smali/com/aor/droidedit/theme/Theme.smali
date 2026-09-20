.class public Lcom/aor/droidedit/theme/Theme;
.super Ljava/lang/Object;
.source "Theme.java"


# static fields
.field private static customThemes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/theme/Theme;",
            ">;"
        }
    .end annotation
.end field

.field private static themes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/theme/Theme;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private background:I

.field private final builtin:Z

.field private id:Ljava/lang/String;

.field private styles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/theme/Style;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "builtin"    # Z

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    .line 33
    iput-object p1, p0, Lcom/aor/droidedit/theme/Theme;->id:Ljava/lang/String;

    .line 34
    iput-boolean p2, p0, Lcom/aor/droidedit/theme/Theme;->builtin:Z

    .line 35
    return-void
.end method

.method private addStyle(Lcom/aor/droidedit/theme/Style;)V
    .locals 1
    .param p1, "style"    # Lcom/aor/droidedit/theme/Style;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    return-void
.end method

.method private static getBuiltinTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;
    .locals 1
    .param p0, "themeId"    # I
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 54
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadThemes(Landroid/content/Context;)V

    .line 55
    :cond_0
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadCustomThemes(Landroid/content/Context;)V

    .line 56
    :cond_1
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Theme;

    return-object v0
.end method

.method public static getColorResource(I)I
    .locals 1
    .param p0, "color"    # I

    .prologue
    .line 267
    if-nez p0, :cond_0

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_1:I

    .line 277
    :goto_0
    return v0

    .line 268
    :cond_0
    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_2:I

    goto :goto_0

    .line 269
    :cond_1
    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_3:I

    goto :goto_0

    .line 270
    :cond_2
    const/4 v0, 0x3

    if-ne p0, v0, :cond_3

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_4:I

    goto :goto_0

    .line 271
    :cond_3
    const/4 v0, 0x4

    if-ne p0, v0, :cond_4

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_5:I

    goto :goto_0

    .line 272
    :cond_4
    const/4 v0, 0x5

    if-ne p0, v0, :cond_5

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_6:I

    goto :goto_0

    .line 273
    :cond_5
    const/4 v0, 0x6

    if-ne p0, v0, :cond_6

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_7:I

    goto :goto_0

    .line 274
    :cond_6
    const/4 v0, 0x7

    if-ne p0, v0, :cond_7

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_8:I

    goto :goto_0

    .line 275
    :cond_7
    const/16 v0, 0x8

    if-ne p0, v0, :cond_8

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_9:I

    goto :goto_0

    .line 276
    :cond_8
    const/16 v0, 0x9

    if-ne p0, v0, :cond_9

    sget v0, Lcom/aor/droidedit/lib/R$id;->theme_color_10:I

    goto :goto_0

    .line 277
    :cond_9
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getCustomTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;
    .locals 1
    .param p0, "themeId"    # I
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 60
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadThemes(Landroid/content/Context;)V

    .line 61
    :cond_0
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadCustomThemes(Landroid/content/Context;)V

    .line 62
    :cond_1
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Theme;

    return-object v0
.end method

.method public static getCustomThemes(Landroid/content/Context;)[Ljava/lang/CharSequence;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 229
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadThemes(Landroid/content/Context;)V

    .line 230
    :cond_0
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v2, :cond_1

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadCustomThemes(Landroid/content/Context;)V

    .line 231
    :cond_1
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/CharSequence;

    .line 232
    .local v1, "ret":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_2

    .line 233
    return-object v1

    .line 232
    :cond_2
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getModeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static getSyntaxNames(Landroid/content/Context;)[Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 292
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v5, v5

    if-nez v5, :cond_0

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadModeCatalog(Landroid/content/Context;)V

    .line 293
    :cond_0
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v5, v5

    add-int/lit8 v5, v5, 0x1

    new-array v3, v5, [Ljava/lang/String;

    .line 294
    .local v3, "names":[Ljava/lang/String;
    sget v5, Lcom/aor/droidedit/lib/R$string;->syntax_default:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 295
    const/4 v0, 0x1

    .line 296
    .local v0, "index":I
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v6, v5

    move v1, v0

    .end local v0    # "index":I
    .local v1, "index":I
    :goto_0
    if-lt v4, v6, :cond_1

    .line 299
    return-object v3

    .line 296
    :cond_1
    aget-object v2, v5, v4

    .line 297
    .local v2, "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    invoke-virtual {v2}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/aor/droidedit/theme/Theme;->getModeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v1

    .line 296
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    .end local v0    # "index":I
    .restart local v1    # "index":I
    goto :goto_0
.end method

.method public static getSyntaxTypes(Landroid/content/Context;)[Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 281
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v5, v5

    if-nez v5, :cond_0

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadModeCatalog(Landroid/content/Context;)V

    .line 282
    :cond_0
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v5, v5

    add-int/lit8 v5, v5, 0x1

    new-array v3, v5, [Ljava/lang/String;

    .line 283
    .local v3, "types":[Ljava/lang/String;
    const/4 v5, 0x0

    aput-object v5, v3, v4

    .line 284
    const/4 v0, 0x1

    .line 285
    .local v0, "index":I
    sget-object v5, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v5}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v5

    array-length v6, v5

    move v1, v0

    .end local v0    # "index":I
    .local v1, "index":I
    :goto_0
    if-lt v4, v6, :cond_1

    .line 288
    return-object v3

    .line 285
    :cond_1
    aget-object v2, v5, v4

    .line 286
    .local v2, "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    invoke-virtual {v2}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v1

    .line 285
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    .end local v0    # "index":I
    .restart local v1    # "index":I
    goto :goto_0
.end method

.method public static getTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;
    .locals 2
    .param p0, "themeId"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadThemes(Landroid/content/Context;)V

    .line 47
    :cond_0
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadCustomThemes(Landroid/content/Context;)V

    .line 48
    :cond_1
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p0, v0, :cond_2

    invoke-static {p0, p1}, Lcom/aor/droidedit/theme/Theme;->getBuiltinTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;

    move-result-object v0

    .line 50
    :goto_0
    return-object v0

    .line 49
    :cond_2
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int v0, p0, v0

    sget-object v1, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    sget-object v0, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int v0, p0, v0

    invoke-static {v0, p1}, Lcom/aor/droidedit/theme/Theme;->getCustomTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;

    move-result-object v0

    goto :goto_0

    .line 50
    :cond_3
    const/4 v0, 0x0

    invoke-static {v0, p1}, Lcom/aor/droidedit/theme/Theme;->getBuiltinTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;

    move-result-object v0

    goto :goto_0
.end method

.method public static getThemes(Landroid/content/Context;)[Ljava/lang/CharSequence;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 220
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadThemes(Landroid/content/Context;)V

    .line 221
    :cond_0
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v2, :cond_1

    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->loadCustomThemes(Landroid/content/Context;)V

    .line 222
    :cond_1
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sget-object v3, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v2, v3

    new-array v1, v2, [Ljava/lang/CharSequence;

    .line 223
    .local v1, "ret":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_2

    .line 224
    const/4 v0, 0x0

    :goto_1
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_3

    .line 225
    return-object v1

    .line 223
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 224
    :cond_3
    sget-object v2, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v2, v0

    sget-object v3, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static loadColor(Ljava/util/Properties;ILjava/lang/String;)I
    .locals 3
    .param p0, "properties"    # Ljava/util/Properties;
    .param p1, "themeid"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "line":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string/jumbo v1, "function"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 150
    :cond_0
    if-nez v0, :cond_1

    const-string/jumbo v1, "operator"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 151
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private static loadCustomColor(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "#FF000000"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "line":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private static loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;
    .locals 3
    .param p0, "prefs"    # Landroid/content/SharedPreferences;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "#FFFFFFFF"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "line":Ljava/lang/String;
    new-instance v1, Lcom/aor/droidedit/theme/Style;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/aor/droidedit/theme/Style;-><init>(I)V

    return-object v1
.end method

.method private static loadCustomTheme(Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .locals 2
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 84
    :try_start_0
    new-instance v0, Lcom/aor/droidedit/theme/Theme;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/aor/droidedit/theme/Theme;-><init>(Ljava/lang/String;Z)V

    .line 85
    .local v0, "theme":Lcom/aor/droidedit/theme/Theme;
    const-string/jumbo v1, "background"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomColor(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/theme/Theme;->setBackground(I)V

    .line 86
    const-string/jumbo v1, "normal"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 87
    const-string/jumbo v1, "reserved"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 88
    const-string/jumbo v1, "type"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 89
    const-string/jumbo v1, "literal"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 90
    const-string/jumbo v1, "identifier"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 91
    const-string/jumbo v1, "preprocessor"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 92
    const-string/jumbo v1, "comment"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 93
    const-string/jumbo v1, "error"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 94
    const-string/jumbo v1, "function"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 95
    const-string/jumbo v1, "operator"

    invoke-static {p1, p0, v1}, Lcom/aor/droidedit/theme/Theme;->loadCustomStyle(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 96
    sget-object v1, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v0    # "theme":Lcom/aor/droidedit/theme/Theme;
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static loadCustomThemes(Landroid/content/Context;)V
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/16 v11, 0x2e

    const/4 v8, 0x0

    .line 66
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    sput-object v7, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    .line 67
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 68
    .local v6, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 69
    .local v4, "keyPrefs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v7

    new-array v0, v7, [Ljava/lang/String;

    .line 70
    .local v0, "allPrefs":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 71
    .local v1, "i":I
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_0

    .line 72
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 73
    array-length v9, v0

    move v7, v8

    :goto_1
    if-lt v7, v9, :cond_1

    .line 80
    return-void

    .line 71
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .local v5, "p":Ljava/lang/String;
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aput-object v5, v0, v1

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 73
    .end local v5    # "p":Ljava/lang/String;
    :cond_1
    aget-object v5, v0, v7

    .line 74
    .restart local v5    # "p":Ljava/lang/String;
    const-string/jumbo v10, "theme."

    invoke-virtual {v5, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string/jumbo v10, ".background"

    invoke-virtual {v5, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 75
    invoke-virtual {v5, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 76
    .local v3, "id":Ljava/lang/String;
    invoke-virtual {v3, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    invoke-virtual {v3, v8, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 77
    invoke-static {v3, v6}, Lcom/aor/droidedit/theme/Theme;->loadCustomTheme(Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 73
    .end local v3    # "id":Ljava/lang/String;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1
.end method

.method public static loadModeCatalog(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 522
    new-instance v2, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;

    const-string/jumbo v3, "modes"

    invoke-direct {v2, v3}, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;-><init>(Ljava/lang/String;)V

    .line 525
    .local v2, "handler":Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string/jumbo v4, "syntax/modes/catalog"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 526
    .local v0, "_in":Ljava/io/InputStream;
    invoke-static {v0, v2}, Lcom/aor/droidedit/highlighting/util/XMLUtilities;->parseXML(Ljava/io/InputStream;Lorg/xml/sax/helpers/DefaultHandler;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 532
    .end local v0    # "_in":Ljava/io/InputStream;
    :goto_0
    return-void

    .line 528
    :catch_0
    move-exception v1

    .line 530
    .local v1, "e":Ljava/io/IOException;
    const-string/jumbo v3, "DroidEdit"

    const-string/jumbo v4, ""

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;
    .locals 3
    .param p0, "properties"    # Ljava/util/Properties;
    .param p1, "themeid"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "line":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string/jumbo v1, "function"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    :cond_0
    if-nez v0, :cond_1

    const-string/jumbo v1, "operator"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "theme."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".literal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    :cond_1
    new-instance v1, Lcom/aor/droidedit/theme/Style;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/aor/droidedit/theme/Style;-><init>(I)V

    return-object v1
.end method

.method private static loadThemes(Landroid/content/Context;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 111
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sput-object v4, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    .line 113
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string/jumbo v5, "themes/themes.properties"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 114
    .local v0, "is":Ljava/io/InputStream;
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 115
    .local v1, "properties":Ljava/util/Properties;
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    const/4 v3, 0x1

    .line 119
    .local v3, "themeid":I
    :goto_0
    :try_start_1
    new-instance v2, Lcom/aor/droidedit/theme/Theme;

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Lcom/aor/droidedit/theme/Theme;-><init>(Ljava/lang/String;Z)V

    .line 120
    .local v2, "theme":Lcom/aor/droidedit/theme/Theme;
    const-string/jumbo v4, "background"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadColor(Ljava/util/Properties;ILjava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/aor/droidedit/theme/Theme;->setBackground(I)V

    .line 122
    const-string/jumbo v4, "normal"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 123
    const-string/jumbo v4, "reserved"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 124
    const-string/jumbo v4, "type"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 125
    const-string/jumbo v4, "literal"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 126
    const-string/jumbo v4, "identifier"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 127
    const-string/jumbo v4, "preprocessor"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 128
    const-string/jumbo v4, "comment"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 129
    const-string/jumbo v4, "error"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 130
    const-string/jumbo v4, "function"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 131
    const-string/jumbo v4, "operator"

    invoke-static {v1, v3, v4}, Lcom/aor/droidedit/theme/Theme;->loadStyle(Ljava/util/Properties;ILjava/lang/String;)Lcom/aor/droidedit/theme/Style;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/aor/droidedit/theme/Theme;->addStyle(Lcom/aor/droidedit/theme/Style;)V

    .line 132
    sget-object v4, Lcom/aor/droidedit/theme/Theme;->themes:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 136
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "properties":Ljava/util/Properties;
    .end local v2    # "theme":Lcom/aor/droidedit/theme/Theme;
    .end local v3    # "themeid":I
    :catch_0
    move-exception v4

    .line 138
    :goto_1
    return-void

    .line 134
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v1    # "properties":Ljava/util/Properties;
    .restart local v3    # "themeid":I
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method public static reloadCustomThemes()V
    .locals 1

    .prologue
    .line 245
    const/4 v0, 0x0

    sput-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    .line 246
    return-void
.end method

.method public static reloaded()Z
    .locals 1

    .prologue
    .line 249
    sget-object v0, Lcom/aor/droidedit/theme/Theme;->customThemes:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getBackground()I
    .locals 1

    .prologue
    .line 237
    iget v0, p0, Lcom/aor/droidedit/theme/Theme;->background:I

    return v0
.end method

.method public getBackgroundHex()Ljava/lang/String;
    .locals 4

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v0

    .line 258
    .local v0, "color":I
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "#FF"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getColor(I)I
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 169
    iget-object v1, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Style;

    .line 170
    .local v0, "style":Lcom/aor/droidedit/theme/Style;
    invoke-virtual {v0}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v1

    return v1
.end method

.method public getColorHex(I)Ljava/lang/String;
    .locals 4
    .param p1, "style"    # I

    .prologue
    .line 262
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/theme/Theme;->getColor(I)I

    move-result v0

    .line 263
    .local v0, "color":I
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "#FF"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDefaultStyle()Lcom/aor/droidedit/theme/Style;
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Style;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/aor/droidedit/theme/Theme;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getStyle(I)Lcom/aor/droidedit/theme/Style;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 163
    iget-object v1, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Style;

    .line 164
    .local v0, "style":Lcom/aor/droidedit/theme/Style;
    invoke-virtual {v0}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v1

    invoke-virtual {p0}, Lcom/aor/droidedit/theme/Theme;->getDefaultStyle()Lcom/aor/droidedit/theme/Style;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x0

    .line 165
    .end local v0    # "style":Lcom/aor/droidedit/theme/Style;
    :cond_0
    return-object v0
.end method

.method public getStyleForToken(I)Lcom/aor/droidedit/theme/Style;
    .locals 3
    .param p1, "type"    # I

    .prologue
    const/4 v2, 0x6

    const/4 v1, 0x3

    const/4 v0, 0x1

    .line 174
    packed-switch p1, :pswitch_data_0

    .line 211
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 176
    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 177
    :pswitch_1
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 178
    :pswitch_2
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 179
    :pswitch_3
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 182
    :pswitch_4
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 185
    :pswitch_5
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 186
    :pswitch_6
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 187
    :pswitch_7
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 188
    :pswitch_8
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 191
    :pswitch_9
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 194
    :pswitch_a
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 197
    :pswitch_b
    invoke-virtual {p0, v2}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 198
    :pswitch_c
    invoke-virtual {p0, v2}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 199
    :pswitch_d
    invoke-virtual {p0, v2}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 200
    :pswitch_e
    invoke-virtual {p0, v2}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 203
    :pswitch_f
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 206
    :pswitch_10
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 209
    :pswitch_11
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/theme/Theme;->getStyle(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    goto :goto_0

    .line 174
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_4
        :pswitch_10
        :pswitch_f
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_9
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_a
        :pswitch_11
    .end packed-switch
.end method

.method public getStyles()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/theme/Style;",
            ">;"
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isBuiltin()Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/aor/droidedit/theme/Theme;->builtin:Z

    return v0
.end method

.method public setBackground(I)V
    .locals 0
    .param p1, "background"    # I

    .prologue
    .line 241
    iput p1, p0, Lcom/aor/droidedit/theme/Theme;->background:I

    .line 242
    return-void
.end method

.method public setColor(II)V
    .locals 1
    .param p1, "style"    # I
    .param p2, "foreground"    # I

    .prologue
    .line 253
    iget-object v0, p0, Lcom/aor/droidedit/theme/Theme;->styles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/theme/Style;

    invoke-virtual {v0, p2}, Lcom/aor/droidedit/theme/Style;->setForeground(I)V

    .line 254
    return-void
.end method
