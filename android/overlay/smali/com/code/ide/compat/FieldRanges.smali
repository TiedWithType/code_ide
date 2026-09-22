.class public final Lcom/code/ide/compat/FieldRanges;
.super Ljava/lang/Object;
.source "FieldRanges.java"


# instance fields
.field private current:I

.field final fields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public add(II)V
    .registers 4

    .line 7
    if-ltz p1, :cond_e

    if-lt p2, p1, :cond_e

    iget-object v0, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    filled-new-array {p1, p2}, [I

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public contains(II)Z
    .registers 4

    .line 10
    invoke-virtual {p0}, Lcom/code/ide/compat/FieldRanges;->start()I

    move-result v0

    if-lt p1, v0, :cond_10

    invoke-virtual {p0}, Lcom/code/ide/compat/FieldRanges;->end()I

    move-result v0

    if-gt p2, v0, :cond_10

    if-lt p2, p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    return p1
.end method

.method public edit(III)Z
    .registers 10

    .line 12
    add-int v0, p1, p2

    invoke-virtual {p0, p1, v0}, Lcom/code/ide/compat/FieldRanges;->contains(II)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 13
    :cond_a
    iget-object v0, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    iget v2, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v2, 0x1

    aget v3, v0, v2

    sub-int/2addr p3, p2

    .line 14
    move p2, v1

    :goto_19
    iget-object v4, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge p2, v4, :cond_39

    iget v4, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    if-eq p2, v4, :cond_36

    iget-object v4, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    aget v5, v4, v1

    if-ge v5, v3, :cond_36

    aget v4, v4, v2

    if-le v4, p1, :cond_36

    return v1

    :cond_36
    add-int/lit8 p2, p2, 0x1

    goto :goto_19

    .line 15
    :cond_39
    aget p1, v0, v2

    add-int/2addr p1, p3

    aput p1, v0, v2

    .line 16
    move p1, v1

    :goto_3f
    iget-object p2, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_64

    iget p2, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    if-eq p1, p2, :cond_61

    iget-object p2, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [I

    aget v0, p2, v1

    if-lt v0, v3, :cond_61

    aget v0, p2, v1

    add-int/2addr v0, p3

    aput v0, p2, v1

    aget v0, p2, v2

    add-int/2addr v0, p3

    aput v0, p2, v2

    :cond_61
    add-int/lit8 p1, p1, 0x1

    goto :goto_3f

    .line 17
    :cond_64
    return v2
.end method

.method public end()I
    .registers 3

    .line 9
    iget-object v0, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    iget v1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public move(Z)Z
    .registers 5

    .line 19
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_e

    iget p1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    sub-int/2addr p1, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_b
    iput p1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    return v1

    :cond_e
    iget p1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    add-int/2addr p1, v1

    iget-object v2, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1a

    return v0

    :cond_1a
    iget p1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    add-int/2addr p1, v1

    goto :goto_b
.end method

.method public start()I
    .registers 3

    .line 8
    iget-object v0, p0, Lcom/code/ide/compat/FieldRanges;->fields:Ljava/util/ArrayList;

    iget v1, p0, Lcom/code/ide/compat/FieldRanges;->current:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method
