.class public Lcom/aor/droidedit/custom/ObservableEditText;
.super Landroid/widget/EditText;
.source "ObservableEditText.java"


# static fields
.field private static brackets:[C


# instance fields
.field private arrowKeyPressed:Z

.field private closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

.field private editable:Z

.field private lastColumn:I

.field private lastLine:I

.field private lastPosition:I

.field private mBounds:Landroid/graphics/Rect;

.field private mNumberCols:I

.field private mNumberColsChanged:Z

.field private mNumberLines:I

.field private mWrapped:Z

.field private openBracketSpan:Landroid/text/style/BackgroundColorSpan;

.field private positionHack:Z

.field private secLastPosition:I

.field private textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x6

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/aor/droidedit/custom/ObservableEditText;->brackets:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x7bs
        0x5bs
        0x28s
        0x7ds
        0x5ds
        0x29s
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, -0x1

    const/16 v1, -0x100

    .line 52
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 27
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 28
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 31
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    .line 32
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    .line 38
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mBounds:Landroid/graphics/Rect;

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, -0x1

    const/16 v1, -0x100

    .line 60
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 27
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 28
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 31
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    .line 32
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    .line 38
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mBounds:Landroid/graphics/Rect;

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, -0x1

    const/16 v1, -0x100

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 27
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 28
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, v1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 31
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    .line 32
    iput v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    .line 38
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mBounds:Landroid/graphics/Rect;

    .line 57
    return-void
.end method

.method private checkMatchingBracket(I)V
    .locals 9
    .param p1, "pos"    # I

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    iget-object v8, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    invoke-interface {v7, v8}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 107
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    iget-object v8, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    invoke-interface {v7, v8}, Landroid/text/Editable;->removeSpan(Ljava/lang/Object;)V

    .line 108
    if-lez p1, :cond_0

    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    if-gt p1, v7, :cond_0

    .line 109
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    add-int/lit8 v8, p1, -0x1

    invoke-interface {v7, v8}, Landroid/text/Editable;->charAt(I)C

    move-result v0

    .line 110
    .local v0, "c1":C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v7, Lcom/aor/droidedit/custom/ObservableEditText;->brackets:[C

    array-length v7, v7

    if-lt v2, v7, :cond_1

    .line 133
    .end local v0    # "c1":C
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 111
    .restart local v0    # "c1":C
    .restart local v2    # "i":I
    :cond_1
    sget-object v7, Lcom/aor/droidedit/custom/ObservableEditText;->brackets:[C

    aget-char v7, v7, v2

    if-ne v7, v0, :cond_3

    .line 112
    sget-object v7, Lcom/aor/droidedit/custom/ObservableEditText;->brackets:[C

    add-int/lit8 v8, v2, 0x3

    rem-int/lit8 v8, v8, 0x6

    aget-char v1, v7, v8

    .line 113
    .local v1, "c2":C
    const/4 v6, 0x0

    .line 114
    .local v6, "open":Z
    const/4 v7, 0x2

    if-gt v2, v7, :cond_2

    const/4 v6, 0x1

    .line 115
    :cond_2
    if-eqz v6, :cond_8

    .line 116
    const/4 v5, 0x1

    .line 117
    .local v5, "nob":I
    move v3, p1

    .local v3, "k":I
    :goto_1
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    if-lt v3, v7, :cond_4

    .line 110
    .end local v1    # "c2":C
    .end local v3    # "k":I
    .end local v5    # "nob":I
    .end local v6    # "open":Z
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 118
    .restart local v1    # "c2":C
    .restart local v3    # "k":I
    .restart local v5    # "nob":I
    .restart local v6    # "open":Z
    :cond_4
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v7

    if-ne v7, v1, :cond_5

    add-int/lit8 v5, v5, -0x1

    .line 119
    :cond_5
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v7

    if-ne v7, v0, :cond_6

    add-int/lit8 v5, v5, 0x1

    .line 120
    :cond_6
    if-nez v5, :cond_7

    add-int/lit8 v7, p1, -0x1

    invoke-direct {p0, v7, v3}, Lcom/aor/droidedit/custom/ObservableEditText;->showBracket(II)V

    goto :goto_2

    .line 117
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 123
    .end local v3    # "k":I
    .end local v5    # "nob":I
    :cond_8
    const/4 v4, 0x1

    .line 124
    .local v4, "ncb":I
    add-int/lit8 v3, p1, -0x2

    .restart local v3    # "k":I
    :goto_3
    if-ltz v3, :cond_3

    .line 125
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v7

    if-ne v7, v1, :cond_9

    add-int/lit8 v4, v4, -0x1

    .line 126
    :cond_9
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v7

    if-ne v7, v0, :cond_a

    add-int/lit8 v4, v4, 0x1

    .line 127
    :cond_a
    if-nez v4, :cond_b

    add-int/lit8 v7, p1, -0x1

    invoke-direct {p0, v3, v7}, Lcom/aor/droidedit/custom/ObservableEditText;->showBracket(II)V

    goto :goto_2

    .line 124
    :cond_b
    add-int/lit8 v3, v3, -0x1

    goto :goto_3
.end method

.method private getLineEnd(I)I
    .locals 1
    .param p1, "line"    # I

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    check-cast v0, Landroid/text/DynamicLayout;

    invoke-virtual {v0, p1}, Landroid/text/DynamicLayout;->getLineEnd(I)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method private getLineStart(I)I
    .locals 1
    .param p1, "line"    # I

    .prologue
    .line 160
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    check-cast v0, Landroid/text/DynamicLayout;

    invoke-virtual {v0, p1}, Landroid/text/DynamicLayout;->getLineStart(I)I

    move-result v0

    return v0
.end method

.method private showBracket(II)V
    .locals 4
    .param p1, "i"    # I
    .param p2, "j"    # I

    .prologue
    const/16 v3, 0x21

    .line 136
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    add-int/lit8 v2, p1, 0x1

    invoke-interface {v0, v1, p1, v2, v3}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 137
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    add-int/lit8 v2, p2, 0x1

    invoke-interface {v0, v1, p2, v2, v3}, Landroid/text/Editable;->setSpan(Ljava/lang/Object;III)V

    .line 138
    return-void
.end method


# virtual methods
.method public final fastMeasure(II)V
    .locals 0
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 238
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/custom/ObservableEditText;->onMeasure(II)V

    .line 239
    return-void
.end method

.method public getLineNumber(I)I
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    check-cast v0, Landroid/text/DynamicLayout;

    invoke-virtual {v0, p1}, Landroid/text/DynamicLayout;->getLineForOffset(I)I

    move-result v0

    .line 152
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRealLineHeight()I
    .locals 5

    .prologue
    .line 250
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const-string/jumbo v1, "X"

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 251
    iget-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public isEditable()Z
    .locals 1

    .prologue
    .line 175
    iget-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->editable:Z

    return v0
.end method

.method public isWrapped()Z
    .locals 1

    .prologue
    .line 246
    iget-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mWrapped:Z

    return v0
.end method

.method public onCheckIsTextEditor()Z
    .locals 1

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->isEditable()Z

    move-result v0

    return v0
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 4
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    const/4 v3, 0x0

    .line 188
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 189
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "rawKeys"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    new-instance v0, Lcom/aor/droidedit/custom/ObservableEditText$1;

    invoke-direct {v0, p0, p0, v3}, Lcom/aor/droidedit/custom/ObservableEditText$1;-><init>(Lcom/aor/droidedit/custom/ObservableEditText;Landroid/view/View;Z)V

    .line 200
    .local v0, "fic":Landroid/view/inputmethod/BaseInputConnection;
    const/4 v2, 0x0

    iput-object v2, p1, Landroid/view/inputmethod/EditorInfo;->actionLabel:Ljava/lang/CharSequence;

    .line 201
    const v2, 0x20001

    iput v2, p1, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 202
    const/high16 v2, 0x50000000

    iput v2, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    .line 204
    .end local v0    # "fic":Landroid/view/inputmethod/BaseInputConnection;
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/EditText;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 209
    iget-boolean v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mWrapped:Z

    if-eqz v2, :cond_1

    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onMeasure(II)V

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 211
    :cond_1
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getPaint()Landroid/text/TextPaint;

    move-result-object v2

    const-string/jumbo v3, "X"

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 212
    .local v1, "width":F
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineHeight()I

    move-result v0

    .line 213
    .local v0, "height":I
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->updateFastLineCount()V

    .line 215
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 216
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 218
    iget v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberLines:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget v3, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    mul-float/2addr v2, v1

    float-to-int v2, v2

    add-int/lit8 v2, v2, 0xa

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberLines:I

    mul-int/2addr v3, v0

    add-int/lit8 v3, v3, 0xa

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/aor/droidedit/custom/ObservableEditText;->setMeasuredDimension(II)V

    .line 220
    iget-boolean v2, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberColsChanged:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->requestReflow()V

    goto :goto_0
.end method

.method protected onSelectionChanged(II)V
    .locals 6
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 71
    :try_start_0
    iget-boolean v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    if-eqz v4, :cond_2

    iget v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->secLastPosition:I

    if-ne p1, v4, :cond_2

    if-ne p1, p2, :cond_2

    .line 72
    iget p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastPosition:I

    .line 73
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 89
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    .line 90
    iget-object v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    if-eqz v4, :cond_0

    .line 91
    iget-object v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    invoke-interface {v4, p1, p2}, Lcom/aor/droidedit/custom/TextSelectionListener;->selectionChanged(II)V

    .line 93
    :cond_0
    iget v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastPosition:I

    iput v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->secLastPosition:I

    .line 94
    iput p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastPosition:I

    .line 95
    if-ne p1, p2, :cond_1

    invoke-direct {p0, p1}, Lcom/aor/droidedit/custom/ObservableEditText;->checkMatchingBracket(I)V

    .line 97
    :cond_1
    :goto_1
    return-void

    .line 74
    :cond_2
    if-ne p1, p2, :cond_5

    .line 75
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineNumber(I)I

    move-result v1

    .line 76
    .local v1, "currentLine":I
    invoke-direct {p0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineStart(I)I

    move-result v3

    .line 77
    .local v3, "lineStart":I
    sub-int v0, p1, v3

    .line 78
    .local v0, "currentColumn":I
    iget-boolean v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->arrowKeyPressed:Z

    if-eqz v4, :cond_4

    iget v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    sub-int v4, v1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_4

    .line 79
    invoke-direct {p0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineEnd(I)I

    move-result v2

    .line 80
    .local v2, "lineEnd":I
    iget v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    add-int/2addr v4, v3

    if-ge p1, v4, :cond_3

    iget v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    add-int/2addr v4, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 81
    :cond_3
    invoke-virtual {p0, p1}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 83
    .end local v2    # "lineEnd":I
    :goto_2
    iput v1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    .line 84
    move p2, p1

    .line 85
    goto :goto_0

    .line 82
    :cond_4
    iput v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I

    goto :goto_2

    .line 96
    .end local v0    # "currentColumn":I
    .end local v1    # "currentLine":I
    .end local v3    # "lineStart":I
    :catch_0
    move-exception v4

    goto :goto_1

    .line 86
    :cond_5
    const/4 v4, -0x1

    iput v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastLine:I

    .line 87
    const/4 v4, -0x1

    iput v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->lastColumn:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "lengthBefore"    # I
    .param p4, "lengthAfter"    # I

    .prologue
    .line 101
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/EditText;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 102
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v0

    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->checkMatchingBracket(I)V

    .line 103
    :cond_0
    return-void
.end method

.method public requestReflow()V
    .locals 1

    .prologue
    .line 255
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getPaintFlags()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setPaintFlags(I)V

    .line 256
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getPaintFlags()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setPaintFlags(I)V

    .line 257
    return-void
.end method

.method public setArrowKeyPressed(Z)V
    .locals 0
    .param p1, "arrowKeyPressed"    # Z

    .prologue
    .line 183
    iput-boolean p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->arrowKeyPressed:Z

    .line 184
    return-void
.end method

.method public setBracketSpanColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 47
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, p1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->openBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 48
    new-instance v0, Landroid/text/style/BackgroundColorSpan;

    invoke-direct {v0, p1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->closeBracketSpan:Landroid/text/style/BackgroundColorSpan;

    .line 49
    return-void
.end method

.method public setEditable(Z)V
    .locals 0
    .param p1, "editable"    # Z

    .prologue
    .line 179
    iput-boolean p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->editable:Z

    .line 180
    return-void
.end method

.method public setPositionHack(Z)V
    .locals 0
    .param p1, "positionHack"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 44
    return-void
.end method

.method public setSelectionNoHack(II)V
    .locals 2
    .param p1, "selectionStart"    # I
    .param p2, "selectionEnd"    # I

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 142
    .local v0, "oldPositionHack":Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 144
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    iput-boolean v0, p0, Lcom/aor/droidedit/custom/ObservableEditText;->positionHack:Z

    .line 147
    return-void

    .line 145
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public setTextSelectionListener(Lcom/aor/droidedit/custom/TextSelectionListener;)V
    .locals 0
    .param p1, "textSelectionListener"    # Lcom/aor/droidedit/custom/TextSelectionListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->textSelectionListener:Lcom/aor/droidedit/custom/TextSelectionListener;

    .line 66
    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 165
    if-nez p1, :cond_0

    .line 167
    :goto_0
    return-void

    .line 166
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/EditText;->setWidth(I)V

    goto :goto_0
.end method

.method public setWrapped(Z)V
    .locals 0
    .param p1, "wrapped"    # Z

    .prologue
    .line 242
    iput-boolean p1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mWrapped:Z

    .line 243
    return-void
.end method

.method public updateFastLineCount()V
    .locals 9

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 225
    invoke-virtual {p0}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "\\n"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 226
    .local v0, "lines":[Ljava/lang/String;
    iget v1, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    .line 228
    .local v1, "oldNumberCols":I
    iput v4, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    .line 229
    array-length v5, v0

    iput v5, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberLines:I

    .line 230
    array-length v6, v0

    move v5, v4

    :goto_0
    if-lt v5, v6, :cond_1

    .line 232
    iget v5, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberLines:I

    if-nez v5, :cond_0

    iput v3, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberLines:I

    .line 234
    :cond_0
    iget v5, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    if-eq v1, v5, :cond_2

    :goto_1
    iput-boolean v3, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberColsChanged:Z

    .line 235
    return-void

    .line 230
    :cond_1
    aget-object v2, v0, v5

    .line 231
    .local v2, "string":Ljava/lang/String;
    iget v7, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, p0, Lcom/aor/droidedit/custom/ObservableEditText;->mNumberCols:I

    .line 230
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .end local v2    # "string":Ljava/lang/String;
    :cond_2
    move v3, v4

    .line 234
    goto :goto_1
.end method
