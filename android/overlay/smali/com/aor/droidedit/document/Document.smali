.class public Lcom/aor/droidedit/document/Document;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4f088a3f4ec94593L

.field private static undoLevel:I


# instance fields
.field private transient baseToken:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;",
            ">;"
        }
    .end annotation
.end field

.field private bom:Lcom/aor/droidedit/document/Encoding$BOM;

.field protected changed:Z

.field private clearNext:Z

.field protected encodingHumanName:Ljava/lang/String;

.field protected encodingJavaName:Ljava/lang/String;

.field private lastSHLineEnd:I

.field private lastSHLineStart:I

.field private mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

.field private transient mMode:Lcom/aor/droidedit/highlighting/base/Mode;

.field private transient mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

.field private redo:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/aor/droidedit/document/Change;",
            ">;"
        }
    .end annotation
.end field

.field private scrollPositionX:I

.field private scrollPositionY:I

.field private selectionEnd:I

.field private selectionStart:I

.field protected text:Ljava/lang/String;

.field private undo:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/aor/droidedit/document/Change;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    const/16 v0, 0x64

    sput v0, Lcom/aor/droidedit/document/Document;->undoLevel:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 49
    iput v1, p0, Lcom/aor/droidedit/document/Document;->scrollPositionX:I

    .line 50
    iput v1, p0, Lcom/aor/droidedit/document/Document;->scrollPositionY:I

    .line 51
    iput-boolean v1, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 58
    sget-object v0, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    .line 63
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    .line 64
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    .line 84
    invoke-static {p1}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Encoding;->getJavaName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    .line 85
    invoke-static {p1}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Encoding;->getHumanName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public constructor <init>(Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V
    .locals 2
    .param p1, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;
    .param p2, "encoding"    # Lcom/aor/droidedit/document/Encoding;

    .prologue
    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 49
    iput v1, p0, Lcom/aor/droidedit/document/Document;->scrollPositionX:I

    .line 50
    iput v1, p0, Lcom/aor/droidedit/document/Document;->scrollPositionY:I

    .line 51
    iput-boolean v1, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 58
    sget-object v0, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    .line 63
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    .line 64
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    .line 89
    iput-object p1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 90
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Encoding;->getJavaName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    .line 91
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Encoding;->getHumanName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 92
    invoke-virtual {p2}, Lcom/aor/droidedit/document/Encoding;->getBom()Lcom/aor/droidedit/document/Encoding$BOM;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    .line 93
    return-void
.end method

.method private consumeBOM(Ljava/io/FileInputStream;)V
    .locals 2
    .param p1, "fis"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/aor/droidedit/document/Document;->getBomSize()I

    move-result v1

    .line 201
    .local v1, "size":I
    new-array v0, v1, [B

    .line 202
    .local v0, "buffer":[B
    invoke-virtual {p1, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 203
    return-void
.end method

.method private correctEncoding()V
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_0

    const-string/jumbo v0, "UnicodeBigUnmarked"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    const-string/jumbo v0, "UTF-16-BE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_1

    const-string/jumbo v0, "UnicodeLittleUnmarked"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    const-string/jumbo v0, "UTF-16-LE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_2

    const-string/jumbo v0, "UTF_32BE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    const-string/jumbo v0, "UTF-32-BE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 195
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_3

    const-string/jumbo v0, "UTF_32LE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    const-string/jumbo v0, "UTF-32-LE"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 196
    :cond_3
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_8:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_4

    const-string/jumbo v0, "UTF8"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    const-string/jumbo v0, "UTF-8 (BOM)"

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 197
    :cond_4
    return-void
.end method

.method private getBaseToken(I)Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .locals 1
    .param p1, "line"    # I

    .prologue
    .line 418
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    .line 419
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    const/4 v0, 0x0

    .line 420
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;

    goto :goto_0
.end method

.method private getBomSize()I
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_8:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x3

    .line 188
    :goto_0
    return v0

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_2

    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 187
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v0, v1, :cond_4

    :cond_3
    const/4 v0, 0x4

    goto :goto_0

    .line 188
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getPreferredMode(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 442
    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 444
    :goto_0
    return-object v1

    .line 443
    :cond_0
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 444
    .local v0, "prefs":Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "syntax."

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getTextWithLineBreaks(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 307
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 308
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "lineBreak"

    const-string/jumbo v3, "linux"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "lbm":Ljava/lang/String;
    const-string/jumbo v2, "windows"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    const-string/jumbo v3, "\\n"

    const-string/jumbo v4, "\r\n"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 311
    :goto_0
    return-object v2

    .line 310
    :cond_0
    const-string/jumbo v2, "mac"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    const-string/jumbo v3, "\\n"

    const-string/jumbo v4, "\n\r"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 311
    :cond_1
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    goto :goto_0
.end method

.method private isLetter(I)Z
    .locals 2
    .param p1, "i"    # I

    .prologue
    .line 174
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 175
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v1, 0x27

    if-eq v0, v1, :cond_0

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/aor/droidedit/document/Document;->surroundedByLetters(I)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private readBOM(Ljava/lang/String;)Lcom/aor/droidedit/document/Encoding$BOM;
    .locals 11
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x1

    const/4 v9, -0x2

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 206
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 207
    .local v1, "f":Ljava/io/File;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 208
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v4, 0x4

    new-array v0, v4, [B

    .line 209
    .local v0, "buffer":[B
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 210
    .local v3, "size":I
    const/4 v4, 0x4

    if-lt v3, v4, :cond_0

    aget-byte v4, v0, v6

    if-nez v4, :cond_0

    aget-byte v4, v0, v7

    if-nez v4, :cond_0

    aget-byte v4, v0, v8

    if-ne v4, v9, :cond_0

    const/4 v4, 0x3

    aget-byte v4, v0, v4

    if-ne v4, v10, :cond_0

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    .line 216
    :goto_0
    return-object v4

    .line 211
    :cond_0
    const/4 v4, 0x4

    if-lt v3, v4, :cond_1

    aget-byte v4, v0, v6

    if-ne v4, v10, :cond_1

    aget-byte v4, v0, v7

    if-ne v4, v9, :cond_1

    aget-byte v4, v0, v8

    if-nez v4, :cond_1

    const/4 v4, 0x3

    aget-byte v4, v0, v4

    if-nez v4, :cond_1

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    goto :goto_0

    .line 212
    :cond_1
    const/4 v4, 0x3

    if-lt v3, v4, :cond_2

    aget-byte v4, v0, v6

    const/16 v5, -0x11

    if-ne v4, v5, :cond_2

    aget-byte v4, v0, v7

    const/16 v5, -0x45

    if-ne v4, v5, :cond_2

    aget-byte v4, v0, v8

    const/16 v5, -0x41

    if-ne v4, v5, :cond_2

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_8:Lcom/aor/droidedit/document/Encoding$BOM;

    goto :goto_0

    .line 213
    :cond_2
    if-lt v3, v8, :cond_3

    aget-byte v4, v0, v6

    if-ne v4, v9, :cond_3

    aget-byte v4, v0, v7

    if-ne v4, v10, :cond_3

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    goto :goto_0

    .line 214
    :cond_3
    if-lt v3, v8, :cond_4

    aget-byte v4, v0, v6

    if-ne v4, v10, :cond_4

    aget-byte v4, v0, v7

    if-ne v4, v9, :cond_4

    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    goto :goto_0

    .line 215
    :cond_4
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 216
    sget-object v4, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    goto :goto_0
.end method

.method private save(Ljava/lang/String;Landroid/content/Context;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v4}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 317
    .local v1, "f":Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 319
    .local v2, "fos":Ljava/io/FileOutputStream;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v5, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-eq v4, v5, :cond_0

    invoke-direct {p0, v2}, Lcom/aor/droidedit/document/Document;->writeBOM(Ljava/io/FileOutputStream;)V

    .line 321
    :cond_0
    new-instance v3, Ljava/io/OutputStreamWriter;

    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    invoke-direct {v3, v2, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 322
    .local v3, "osw":Ljava/io/OutputStreamWriter;
    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 323
    .local v0, "bw":Ljava/io/BufferedWriter;
    invoke-direct {p0, p2}, Lcom/aor/droidedit/document/Document;->getTextWithLineBreaks(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 324
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    .line 325
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->close()V

    .line 326
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 327
    return-void
.end method

.method private setBaseToken(ILcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;)V
    .locals 2
    .param p1, "line"    # I
    .param p2, "initialTokenType"    # Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;

    .prologue
    .line 411
    if-gez p1, :cond_0

    .line 415
    :goto_0
    return-void

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    .line 413
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 414
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 413
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private setSpan(Landroid/text/Spannable;Landroid/text/style/CharacterStyle;III)V
    .locals 0
    .param p1, "spannable"    # Landroid/text/Spannable;
    .param p2, "style"    # Landroid/text/style/CharacterStyle;
    .param p3, "i"    # I
    .param p4, "j"    # I
    .param p5, "flags"    # I

    .prologue
    .line 401
    invoke-interface {p1, p2, p3, p4, p5}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 408
    return-void
.end method

.method public static setUndoLevel(I)V
    .locals 0
    .param p0, "undoLevel"    # I

    .prologue
    .line 499
    sput p0, Lcom/aor/droidedit/document/Document;->undoLevel:I

    .line 500
    return-void
.end method

.method private surroundedByLetters(I)Z
    .locals 3
    .param p1, "i"    # I

    .prologue
    const/4 v0, 0x0

    .line 179
    if-lez p1, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-lt p1, v1, :cond_1

    .line 181
    :cond_0
    :goto_0
    return v0

    .line 180
    :cond_1
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private updateTokenMarker(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 424
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    if-nez v2, :cond_2

    .line 425
    sget-object v2, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v2}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v2

    array-length v2, v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lcom/aor/droidedit/theme/Theme;->loadModeCatalog(Landroid/content/Context;)V

    .line 427
    :cond_0
    invoke-direct {p0, p1}, Lcom/aor/droidedit/document/Document;->getPreferredMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 429
    .local v1, "preferred":Ljava/lang/String;
    if-nez v1, :cond_3

    .line 430
    sget-object v2, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModeForFile(Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v0

    .line 431
    .local v0, "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lcom/aor/droidedit/highlighting/base/Mode;->getTokenMarker(Landroid/content/Context;)Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    move-result-object v2

    iput-object v2, p0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    .line 432
    :cond_1
    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    .line 439
    .end local v0    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    .end local v1    # "preferred":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 434
    .restart local v1    # "preferred":Ljava/lang/String;
    :cond_3
    sget-object v2, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v2, v1}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getMode(Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v0

    .line 435
    .restart local v0    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    if-eqz v0, :cond_4

    invoke-virtual {v0, p1}, Lcom/aor/droidedit/highlighting/base/Mode;->getTokenMarker(Landroid/content/Context;)Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    move-result-object v2

    iput-object v2, p0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    .line 436
    :cond_4
    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    goto :goto_0
.end method

.method private writeBOM(Ljava/io/FileOutputStream;)V
    .locals 8
    .param p1, "fos"    # Ljava/io/FileOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/4 v6, -0x2

    const/4 v5, 0x1

    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 335
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_0

    .line 353
    :goto_0
    return-void

    .line 336
    :cond_0
    new-array v0, v3, [B

    .line 337
    .local v0, "buffer":[B
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_1

    .line 338
    new-array v0, v4, [B

    aput-byte v6, v0, v3

    aput-byte v7, v0, v5

    .line 340
    :cond_1
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_16_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_2

    .line 341
    new-array v0, v4, [B

    aput-byte v7, v0, v3

    aput-byte v6, v0, v5

    .line 343
    :cond_2
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_8:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_3

    .line 344
    const/4 v1, 0x3

    new-array v0, v1, [B

    const/16 v1, -0x11

    aput-byte v1, v0, v3

    const/16 v1, -0x45

    aput-byte v1, v0, v5

    const/16 v1, -0x41

    aput-byte v1, v0, v4

    .line 346
    :cond_3
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_BE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_4

    .line 347
    const/4 v1, 0x4

    new-array v0, v1, [B

    aput-byte v3, v0, v3

    aput-byte v3, v0, v5

    aput-byte v6, v0, v4

    aput-byte v7, v0, v4

    .line 349
    :cond_4
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v2, Lcom/aor/droidedit/document/Encoding$BOM;->UTF_32_LE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-ne v1, v2, :cond_5

    .line 350
    const/4 v1, 0x4

    new-array v0, v1, [B

    aput-byte v7, v0, v3

    aput-byte v6, v0, v5

    aput-byte v3, v0, v4

    aput-byte v3, v0, v4

    .line 352
    :cond_5
    invoke-virtual {p1, v0}, Ljava/io/FileOutputStream;->write([B)V

    goto :goto_0
.end method


# virtual methods
.method public canRedo()Z
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canUndo()Z
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public changed()Z
    .locals 1

    .prologue
    .line 290
    iget-boolean v0, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    return v0
.end method

.method public clearBaseTokens()V
    .locals 1

    .prologue
    .line 464
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->baseToken:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 465
    :cond_0
    return-void
.end method

.method public clearSyntaxHighlighting(Landroid/text/Spannable;II)V
    .locals 3
    .param p1, "spannable"    # Landroid/text/Spannable;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 476
    const-class v2, Lcom/aor/droidedit/document/SyntaxHighlightSpan;

    invoke-interface {p1, p2, p3, v2}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    .line 477
    .local v1, "toRemoveSpans":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-lt v0, v2, :cond_0

    .line 480
    return-void

    .line 478
    :cond_0
    aget-object v2, v1, v0

    invoke-interface {p1, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 477
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public clearSyntaxHighlighting(Landroid/widget/EditText;)V
    .locals 3
    .param p1, "textEditor"    # Landroid/widget/EditText;

    .prologue
    .line 468
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/aor/droidedit/document/Document;->clearSyntaxHighlighting(Landroid/text/Spannable;II)V

    .line 469
    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->clearBaseTokens()V

    .line 470
    return-void
.end method

.method public getBOM()Lcom/aor/droidedit/document/Encoding$BOM;
    .locals 1

    .prologue
    .line 487
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    return-object v0
.end method

.method public getChangedMark()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-boolean v0, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "*"

    .line 295
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getEncoding()Lcom/aor/droidedit/document/Encoding;
    .locals 3

    .prologue
    .line 495
    new-instance v0, Lcom/aor/droidedit/document/Encoding;

    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/aor/droidedit/document/Encoding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getExtension()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 503
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-nez v1, :cond_1

    .line 506
    :cond_0
    :goto_0
    return-object v0

    .line 504
    :cond_1
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 505
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 506
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getFile()Lcom/aor/droidedit/fs/implementation/FSFile;
    .locals 1

    .prologue
    .line 579
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    return-object v0
.end method

.method public getHumanEncoding()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 491
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    return-object v0
.end method

.method public getJavaEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 483
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getName()Ljava/lang/String;

    move-result-object v0

    .line 241
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/code/ide/compat/AppText;->untitled()Ljava/lang/String;
    move-result-object v0

    goto :goto_0
.end method

.method public getNameNoExtension()Ljava/lang/String;
    .locals 3

    .prologue
    .line 538
    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v0

    .line 539
    .local v0, "name":Ljava/lang/String;
    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 540
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public getNumberWords()Ljava/lang/String;
    .locals 2

    .prologue
    .line 544
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/aor/droidedit/document/Document;->getNumberWords(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNumberWords(II)Ljava/lang/String;
    .locals 7
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 548
    if-le p1, p2, :cond_0

    move v2, p1

    .local v2, "temp":I
    move p1, p2

    move p2, v2

    .line 549
    .end local v2    # "temp":I
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 p1, 0x0

    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result p2

    .line 550
    :cond_1
    const/4 v4, 0x0

    .local v4, "words":I
    const/4 v1, 0x1

    .line 551
    .local v1, "lines":I
    const/4 v3, 0x1

    .line 552
    .local v3, "wasLastWhiteSpace":Z
    const/4 v5, 0x0

    invoke-static {v5, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .local v0, "i":I
    :goto_0
    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-static {v5, p2}, Ljava/lang/Math;->min(II)I

    move-result v5

    if-lt v0, v5, :cond_2

    .line 558
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, " / "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " / "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-int v6, p2, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 553
    :cond_2
    if-eqz v3, :cond_3

    invoke-direct {p0, v0}, Lcom/aor/droidedit/document/Document;->isLetter(I)Z

    move-result v5

    if-eqz v5, :cond_3

    add-int/lit8 v4, v4, 0x1

    .line 554
    :cond_3
    invoke-direct {p0, v0}, Lcom/aor/droidedit/document/Document;->isLetter(I)Z

    move-result v5

    if-nez v5, :cond_5

    const/4 v3, 0x1

    .line 556
    :goto_1
    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0xa

    if-ne v5, v6, :cond_4

    add-int/lit8 v1, v1, 0x1

    .line 552
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 555
    :cond_5
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 246
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getScrollPositionX()I
    .locals 1

    .prologue
    .line 571
    iget v0, p0, Lcom/aor/droidedit/document/Document;->scrollPositionX:I

    return v0
.end method

.method public getScrollPositionY()I
    .locals 1

    .prologue
    .line 575
    iget v0, p0, Lcom/aor/droidedit/document/Document;->scrollPositionY:I

    return v0
.end method

.method public getSelectionEnd()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/aor/droidedit/document/Document;->selectionEnd:I

    return v0
.end method

.method public getSelectionStart()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lcom/aor/droidedit/document/Document;->selectionStart:I

    return v0
.end method

.method public getSyntaxName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 448
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    invoke-virtual {v0}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;

    move-result-object v0

    .line 449
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTemporaryFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 132
    :try_start_0
    const-string/jumbo v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    .line 133
    .local v4, "md":Ljava/security/MessageDigest;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 134
    .local v5, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 135
    .local v0, "bytes":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v6, v0

    if-lt v3, v6, :cond_0

    .line 141
    const-string/jumbo v6, ".tmp"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    new-instance v6, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    .line 144
    .end local v0    # "bytes":[B
    .end local v3    # "i":I
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :goto_1
    return-object v6

    .line 136
    .restart local v0    # "bytes":[B
    .restart local v3    # "i":I
    .restart local v4    # "md":Ljava/security/MessageDigest;
    .restart local v5    # "sb":Ljava/lang/StringBuffer;
    :cond_0
    aget-byte v6, v0, v3

    and-int/lit16 v6, v6, 0xff

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, "hex":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_1

    .line 138
    const/16 v6, 0x30

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 139
    :cond_1
    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 143
    .end local v0    # "bytes":[B
    .end local v2    # "hex":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v6, "HASHFAIL"

    goto :goto_1
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    return-object v0
.end method

.method public isBox()Z
    .locals 1

    .prologue
    .line 530
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/box/BoxFileSystem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDropbox()Z
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/dropbox/DropboxFileSystem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFtp()Z
    .locals 1

    .prologue
    .line 522
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isGitFile()Z
    .locals 1

    .prologue
    .line 562
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/git/GitFile;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLocal()Z
    .locals 1

    .prologue
    .line 514
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isSftp()Z
    .locals 1

    .prologue
    .line 518
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public load(Landroid/content/Context;Ljava/lang/String;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-direct {p0, p2}, Lcom/aor/droidedit/document/Document;->readBOM(Ljava/lang/String;)Lcom/aor/droidedit/document/Encoding$BOM;

    move-result-object v5

    iput-object v5, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    invoke-direct {p0}, Lcom/aor/droidedit/document/Document;->correctEncoding()V

    .line 151
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 152
    .local v1, "f":Ljava/io/File;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 154
    .local v2, "fis":Ljava/io/FileInputStream;
    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v8, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-eq v5, v8, :cond_0

    invoke-direct {p0, v2}, Lcom/aor/droidedit/document/Document;->consumeBOM(Ljava/io/FileInputStream;)V

    .line 156
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-direct {p0}, Lcom/aor/droidedit/document/Document;->getBomSize()I

    move-result v5

    int-to-long v10, v5

    sub-long v6, v8, v10

    .line 157
    .local v6, "size":J
    const-wide/32 v8, 0xf4240

    cmp-long v5, v6, v8

    if-lez v5, :cond_1

    new-instance v5, Ljava/io/IOException;

    sget v8, Lcom/aor/droidedit/lib/R$string;->error_file_too_big_msg:I

    invoke-virtual {p1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 159
    :cond_1
    long-to-int v5, v6

    new-array v0, v5, [B

    .line 161
    .local v0, "bts":[B
    const/4 v4, 0x0

    .line 162
    .local v4, "offset":I
    const/4 v3, 0x0

    .line 163
    .local v3, "numRead":I
    :goto_0
    array-length v5, v0

    if-ge v4, v5, :cond_2

    array-length v5, v0

    sub-int/2addr v5, v4

    invoke-virtual {v2, v0, v4, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    if-gez v3, :cond_3

    .line 166
    :cond_2
    new-instance v5, Ljava/lang/String;

    iget-object v8, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    invoke-direct {v5, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 167
    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    const-string/jumbo v8, "\\r\\n"

    const-string/jumbo v9, "\n"

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 168
    iget-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    const-string/jumbo v8, "\\r"

    const-string/jumbo v9, "\n"

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 169
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 170
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 171
    return-void

    .line 164
    :cond_3
    add-int/2addr v4, v3

    goto :goto_0
.end method

.method public load(Landroid/content/Context;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "rootMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/aor/droidedit/document/Document;->load(Landroid/content/Context;Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public redo()Lcom/aor/droidedit/document/Change;
    .locals 7

    .prologue
    .line 269
    const/4 v1, 0x0

    .line 270
    .local v1, "selection":I
    const/4 v0, 0x0

    .line 271
    .local v0, "change":Lcom/aor/droidedit/document/Change;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 272
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    check-cast v0, Lcom/aor/droidedit/document/Change;

    .line 273
    .restart local v0    # "change":Lcom/aor/droidedit/document/Change;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 274
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 275
    .local v3, "textBefore":Ljava/lang/String;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getOldText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "textAfter":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getNewText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 277
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 278
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 279
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v4

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getNewText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    .line 281
    .end local v2    # "textAfter":Ljava/lang/String;
    .end local v3    # "textBefore":Ljava/lang/String;
    :cond_0
    iput v1, p0, Lcom/aor/droidedit/document/Document;->selectionEnd:I

    iput v1, p0, Lcom/aor/droidedit/document/Document;->selectionStart:I

    .line 282
    return-object v0
.end method

.method public save(Landroid/content/Context;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "rootMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 303
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/aor/droidedit/document/Document;->save(Ljava/lang/String;Landroid/content/Context;)V

    .line 304
    return-void
.end method

.method public setChanged(Z)V
    .locals 0
    .param p1, "changed"    # Z

    .prologue
    .line 534
    iput-boolean p1, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 535
    return-void
.end method

.method public setEncoding(Lcom/aor/droidedit/document/Encoding;)V
    .locals 1
    .param p1, "encoding"    # Lcom/aor/droidedit/document/Encoding;

    .prologue
    .line 220
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Encoding;->getJavaName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingJavaName:Ljava/lang/String;

    .line 221
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Encoding;->getHumanName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->encodingHumanName:Ljava/lang/String;

    .line 222
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Encoding;->getBom()Lcom/aor/droidedit/document/Encoding$BOM;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    .line 223
    return-void
.end method

.method public setFile(Lcom/aor/droidedit/fs/implementation/FSFile;)V
    .locals 0
    .param p1, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;

    .prologue
    .line 583
    iput-object p1, p0, Lcom/aor/droidedit/document/Document;->mFile:Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 584
    return-void
.end method

.method public setScrollPosition(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 566
    iput p1, p0, Lcom/aor/droidedit/document/Document;->scrollPositionX:I

    .line 567
    iput p2, p0, Lcom/aor/droidedit/document/Document;->scrollPositionY:I

    .line 568
    return-void
.end method

.method public setSelection(II)V
    .locals 0
    .param p1, "selectionStart"    # I
    .param p2, "selectionEnd"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/aor/droidedit/document/Document;->selectionStart:I

    .line 97
    iput p2, p0, Lcom/aor/droidedit/document/Document;->selectionEnd:I

    .line 98
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setTokenMarker(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "syntax"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 453
    sget-object v0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v0}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModes()[Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_0

    invoke-static {p2}, Lcom/aor/droidedit/theme/Theme;->loadModeCatalog(Landroid/content/Context;)V

    .line 455
    :cond_0
    sget-object v0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v0, p1}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getMode(Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    .line 457
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    .line 460
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/aor/droidedit/document/Document;->clearNext:Z

    .line 461
    return-void

    .line 458
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->mMode:Lcom/aor/droidedit/highlighting/base/Mode;

    invoke-virtual {v0, p2}, Lcom/aor/droidedit/highlighting/base/Mode;->getTokenMarker(Landroid/content/Context;)Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    move-result-object v0

    iput-object v0, p0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    goto :goto_0
.end method

.method public syntaxHighlight(Landroid/widget/EditText;Lcom/aor/droidedit/theme/Theme;IIIIZLandroid/content/Context;)V
    .locals 18
    .param p1, "textEditor"    # Landroid/widget/EditText;
    .param p2, "theme"    # Lcom/aor/droidedit/theme/Theme;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "lstart"    # I
    .param p6, "lend"    # I
    .param p7, "change"    # Z
    .param p8, "context"    # Landroid/content/Context;

    .prologue
    .line 357
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-direct {v0, v1}, Lcom/aor/droidedit/document/Document;->updateTokenMarker(Landroid/content/Context;)V

    .line 359
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    if-nez v2, :cond_1

    .line 360
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/aor/droidedit/document/Document;->clearNext:Z

    if-eqz v2, :cond_0

    invoke-virtual/range {p0 .. p1}, Lcom/aor/droidedit/document/Document;->clearSyntaxHighlighting(Landroid/widget/EditText;)V

    .line 361
    :cond_0
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/aor/droidedit/document/Document;->clearNext:Z

    .line 398
    :goto_0
    return-void

    .line 365
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    .line 366
    .local v3, "spannable":Landroid/text/Spannable;
    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, "\\n"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 367
    .local v13, "lines":[Ljava/lang/String;
    new-instance v15, Lcom/aor/droidedit/highlighting/base/Segment;

    invoke-direct {v15}, Lcom/aor/droidedit/highlighting/base/Segment;-><init>()V

    .line 369
    .local v15, "segment":Lcom/aor/droidedit/highlighting/base/Segment;
    const/4 v14, 0x0

    .local v14, "pos":I
    const/4 v12, 0x0

    .line 370
    .local v12, "lastTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    const/4 v11, 0x0

    .local v11, "l":I
    :goto_1
    array-length v2, v13
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v11, v2, :cond_2

    .line 396
    .end local v3    # "spannable":Landroid/text/Spannable;
    .end local v11    # "l":I
    .end local v12    # "lastTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .end local v13    # "lines":[Ljava/lang/String;
    .end local v14    # "pos":I
    .end local v15    # "segment":Lcom/aor/droidedit/highlighting/base/Segment;
    :goto_2
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/aor/droidedit/document/Document;->lastSHLineStart:I

    .line 397
    move/from16 v0, p6

    move-object/from16 v1, p0

    iput v0, v1, Lcom/aor/droidedit/document/Document;->lastSHLineEnd:I

    goto :goto_0

    .line 371
    .restart local v3    # "spannable":Landroid/text/Spannable;
    .restart local v11    # "l":I
    .restart local v12    # "lastTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .restart local v13    # "lines":[Ljava/lang/String;
    .restart local v14    # "pos":I
    .restart local v15    # "segment":Lcom/aor/droidedit/highlighting/base/Segment;
    :cond_2
    move-object v10, v12

    .line 372
    .local v10, "initialTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    :try_start_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/aor/droidedit/document/Document;->lastSHLineStart:I

    if-lt v11, v2, :cond_4

    move-object/from16 v0, p0

    iget v2, v0, Lcom/aor/droidedit/document/Document;->lastSHLineEnd:I

    if-gt v11, v2, :cond_4

    move/from16 v0, p5

    if-lt v11, v0, :cond_3

    move/from16 v0, p6

    if-le v11, v0, :cond_4

    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    aget-object v4, v13, v11

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14, v4}, Lcom/aor/droidedit/document/Document;->clearSyntaxHighlighting(Landroid/text/Spannable;II)V

    .line 373
    :cond_4
    if-eqz p7, :cond_5

    aget-object v2, v13, v11

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v14

    move/from16 v0, p3

    if-gt v0, v2, :cond_5

    move/from16 v0, p4

    if-ge v0, v14, :cond_7

    :cond_5
    if-nez p7, :cond_6

    move/from16 v0, p5

    if-lt v11, v0, :cond_6

    move/from16 v0, p6

    if-le v11, v0, :cond_7

    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/aor/droidedit/document/Document;->getBaseToken(I)Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;

    move-result-object v2

    if-eq v2, v12, :cond_a

    move/from16 v0, p5

    if-lt v11, v0, :cond_a

    move/from16 v0, p6

    if-gt v11, v0, :cond_a

    .line 374
    :cond_7
    aget-object v2, v13, v11

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v14, v2}, Lcom/aor/droidedit/document/Document;->clearSyntaxHighlighting(Landroid/text/Spannable;II)V
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 376
    :try_start_2
    new-instance v8, Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;

    invoke-direct {v8}, Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;-><init>()V

    .line 377
    .local v8, "dth":Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;
    aget-object v2, v13, v11

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    iput-object v2, v15, Lcom/aor/droidedit/highlighting/base/Segment;->array:[C

    const/4 v2, 0x0

    iput v2, v15, Lcom/aor/droidedit/highlighting/base/Segment;->offset:I

    aget-object v2, v13, v11

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iput v2, v15, Lcom/aor/droidedit/highlighting/base/Segment;->count:I

    .line 378
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/aor/droidedit/document/Document;->mTokenMarker:Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    invoke-virtual {v2, v12, v8, v15}, Lcom/aor/droidedit/highlighting/syntax/TokenMarker;->markTokens(Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;Lcom/aor/droidedit/highlighting/syntax/TokenHandler;Lcom/aor/droidedit/highlighting/base/Segment;)Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;

    move-result-object v12

    .line 379
    invoke-virtual {v8}, Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;->getTokens()Lcom/aor/droidedit/highlighting/syntax/Token;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v17

    .line 380
    .local v17, "token":Lcom/aor/droidedit/highlighting/syntax/Token;
    :goto_3
    if-nez v17, :cond_8

    .line 389
    .end local v8    # "dth":Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;
    .end local v17    # "token":Lcom/aor/droidedit/highlighting/syntax/Token;
    :goto_4
    :try_start_3
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v10}, Lcom/aor/droidedit/document/Document;->setBaseToken(ILcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;)V

    .line 391
    :goto_5
    aget-object v2, v13, v11

    invoke-virtual {v2}, Ljava/lang/String;->length()I
    :try_end_3
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_0

    move-result v2

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v14, v2

    .line 370
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_1

    .line 381
    .restart local v8    # "dth":Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;
    .restart local v17    # "token":Lcom/aor/droidedit/highlighting/syntax/Token;
    :cond_8
    move/from16 v0, p5

    if-lt v11, v0, :cond_9

    move/from16 v0, p6

    if-gt v11, v0, :cond_9

    .line 382
    :try_start_4
    move-object/from16 v0, v17

    iget-byte v2, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->id:B

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/aor/droidedit/theme/Theme;->getStyleForToken(I)Lcom/aor/droidedit/theme/Style;

    move-result-object v16

    .line 383
    .local v16, "style":Lcom/aor/droidedit/theme/Style;
    if-eqz v16, :cond_9

    move-object/from16 v0, v17

    iget v2, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->length:I

    if-lez v2, :cond_9

    .line 384
    new-instance v4, Lcom/aor/droidedit/document/SyntaxHighlightSpan;

    invoke-virtual/range {v16 .. v16}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v2

    invoke-direct {v4, v2}, Lcom/aor/droidedit/document/SyntaxHighlightSpan;-><init>(I)V

    move-object/from16 v0, v17

    iget v2, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->offset:I

    add-int v5, v14, v2

    move-object/from16 v0, v17

    iget v2, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->offset:I

    add-int/2addr v2, v14

    move-object/from16 v0, v17

    iget v6, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->length:I

    add-int/2addr v6, v2

    const/16 v7, 0x21

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/aor/droidedit/document/Document;->setSpan(Landroid/text/Spannable;Landroid/text/style/CharacterStyle;III)V

    .line 386
    .end local v16    # "style":Lcom/aor/droidedit/theme/Style;
    :cond_9
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/aor/droidedit/highlighting/syntax/Token;->next:Lcom/aor/droidedit/highlighting/syntax/Token;

    move-object/from16 v17, v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_3

    .line 390
    .end local v8    # "dth":Lcom/aor/droidedit/highlighting/syntax/DefaultTokenHandler;
    .end local v17    # "token":Lcom/aor/droidedit/highlighting/syntax/Token;
    :cond_a
    add-int/lit8 v2, v11, 0x1

    :try_start_5
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/aor/droidedit/document/Document;->getBaseToken(I)Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    :try_end_5
    .catch Ljava/lang/Error; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v12

    goto :goto_5

    .line 393
    .end local v3    # "spannable":Landroid/text/Spannable;
    .end local v10    # "initialTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .end local v11    # "l":I
    .end local v12    # "lastTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .end local v13    # "lines":[Ljava/lang/String;
    .end local v14    # "pos":I
    .end local v15    # "segment":Lcom/aor/droidedit/highlighting/base/Segment;
    :catch_0
    move-exception v9

    .line 394
    .local v9, "e":Ljava/lang/Error;
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v4, ""

    invoke-static {v2, v4, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 388
    .end local v9    # "e":Ljava/lang/Error;
    .restart local v3    # "spannable":Landroid/text/Spannable;
    .restart local v10    # "initialTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .restart local v11    # "l":I
    .restart local v12    # "lastTokenType":Lcom/aor/droidedit/highlighting/syntax/TokenMarker$LineContext;
    .restart local v13    # "lines":[Ljava/lang/String;
    .restart local v14    # "pos":I
    .restart local v15    # "segment":Lcom/aor/droidedit/highlighting/base/Segment;
    :catch_1
    move-exception v2

    goto :goto_4
.end method

.method public textChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 110
    :try_start_0
    iget-object v1, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 111
    .local v1, "oldText":Ljava/lang/String;
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 112
    new-instance v0, Lcom/aor/droidedit/document/Change;

    add-int v2, p2, p3

    invoke-virtual {v1, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    add-int v4, p2, p4

    invoke-virtual {v3, p2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p2, v2, v3}, Lcom/aor/droidedit/document/Change;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 114
    .local v0, "change":Lcom/aor/droidedit/document/Change;
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/document/Change;

    invoke-virtual {v2, v0}, Lcom/aor/droidedit/document/Change;->compatible(Lcom/aor/droidedit/document/Change;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 115
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/document/Change;

    invoke-virtual {v2, v0}, Lcom/aor/droidedit/document/Change;->add(Lcom/aor/droidedit/document/Change;)V

    .line 118
    :goto_0
    sget v2, Lcom/aor/droidedit/document/Document;->undoLevel:I

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    sget v3, Lcom/aor/droidedit/document/Document;->undoLevel:I

    if-gt v2, v3, :cond_2

    .line 120
    :cond_0
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clear()V

    .line 121
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 124
    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    .end local v1    # "oldText":Ljava/lang/String;
    :goto_1
    return-void

    .line 116
    .restart local v0    # "change":Lcom/aor/droidedit/document/Change;
    .restart local v1    # "oldText":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 122
    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    .end local v1    # "oldText":Ljava/lang/String;
    :catch_0
    move-exception v2

    goto :goto_1

    .line 118
    .restart local v0    # "change":Lcom/aor/droidedit/document/Change;
    .restart local v1    # "oldText":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 235
    iget-boolean v0, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, " *"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 236
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public undo()Lcom/aor/droidedit/document/Change;
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 250
    const/4 v1, 0x0

    .line 251
    .local v1, "selection":I
    const/4 v0, 0x0

    .line 252
    .local v0, "change":Lcom/aor/droidedit/document/Change;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 253
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    check-cast v0, Lcom/aor/droidedit/document/Change;

    .line 254
    .restart local v0    # "change":Lcom/aor/droidedit/document/Change;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->undo:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 255
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v5

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 256
    .local v3, "textBefore":Ljava/lang/String;
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getNewText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 257
    .local v2, "textAfter":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getOldText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/aor/droidedit/document/Document;->text:Ljava/lang/String;

    .line 258
    iget-object v4, p0, Lcom/aor/droidedit/document/Document;->redo:Ljava/util/Vector;

    invoke-virtual {v4, v0, v7}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 260
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/aor/droidedit/document/Document;->changed:Z

    .line 261
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v4

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getOldText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int v1, v4, v5

    .line 263
    .end local v2    # "textAfter":Ljava/lang/String;
    .end local v3    # "textBefore":Ljava/lang/String;
    :cond_0
    iput v1, p0, Lcom/aor/droidedit/document/Document;->selectionStart:I

    iput v1, p0, Lcom/aor/droidedit/document/Document;->selectionEnd:I

    .line 264
    return-object v0
.end method

.method public usesBOM()Z
    .locals 2

    .prologue
    .line 510
    iget-object v0, p0, Lcom/aor/droidedit/document/Document;->bom:Lcom/aor/droidedit/document/Encoding$BOM;

    sget-object v1, Lcom/aor/droidedit/document/Encoding$BOM;->NONE:Lcom/aor/droidedit/document/Encoding$BOM;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
