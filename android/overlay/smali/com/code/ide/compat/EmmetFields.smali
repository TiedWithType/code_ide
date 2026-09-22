.class public final Lcom/code/ide/compat/EmmetFields;
.super Ljava/lang/Object;
.source "EmmetFields.java"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field private static final active:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Lcom/code/ide/compat/EmmetFields;",
            ">;"
        }
    .end annotation
.end field

.field private static final swallowUp:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final editor:Landroid/widget/EditText;

.field private ended:Z

.field private final ranges:Lcom/code/ide/compat/FieldRanges;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    .line 11
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/code/ide/compat/EmmetFields;->swallowUp:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/widget/EditText;)V
    .registers 4

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Lcom/code/ide/compat/FieldRanges;

    invoke-direct {v0}, Lcom/code/ide/compat/FieldRanges;-><init>()V

    iput-object v0, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    .line 15
    iput-object p1, p0, Lcom/code/ide/compat/EmmetFields;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    return-void
.end method

.method public static cancel(Landroid/app/Activity;)V
    .registers 2

    .line 22
    sget-object v0, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/code/ide/compat/EmmetFields;

    if-eqz p0, :cond_d

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->end()V

    :cond_d
    return-void
.end method

.method private end()V
    .registers 3

    .line 23
    iget-boolean v0, p0, Lcom/code/ide/compat/EmmetFields;->ended:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/code/ide/compat/EmmetFields;->ended:Z

    iget-object v0, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    sget-object v0, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetFields;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1e

    sget-object v0, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetFields;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    return-void
.end method

.method private static find(Landroid/view/View;)Lcom/code/ide/compat/EmmetFields;
    .registers 4

    .line 25
    sget-object v0, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/code/ide/compat/EmmetFields;

    iget-object v2, v1, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    if-ne v2, p0, :cond_a

    return-object v1

    :cond_1b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static key(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 8

    .line 27
    const/4 v0, 0x1

    const/16 v1, 0x3d

    if-ne p1, v1, :cond_14

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v0, :cond_14

    sget-object v2, Lcom/code/ide/compat/EmmetFields;->swallowUp:Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    return v0

    .line 28
    :cond_14
    invoke-static {p0}, Lcom/code/ide/compat/EmmetFields;->find(Landroid/view/View;)Lcom/code/ide/compat/EmmetFields;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_1c

    return v3

    .line 29
    :cond_1c
    const/16 v4, 0x6f

    if-ne p1, v4, :cond_24

    invoke-direct {v2}, Lcom/code/ide/compat/EmmetFields;->end()V

    return v3

    .line 30
    :cond_24
    if-ne p1, v1, :cond_4a

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_4a

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    move-result p1

    if-nez p1, :cond_4a

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result p1

    if-eqz p1, :cond_39

    goto :goto_4a

    .line 31
    :cond_39
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result p1

    invoke-direct {v2, p1}, Lcom/code/ide/compat/EmmetFields;->next(Z)Z

    move-result p1

    if-nez p1, :cond_44

    return v3

    :cond_44
    sget-object p1, Lcom/code/ide/compat/EmmetFields;->swallowUp:Ljava/util/Set;

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return v0

    .line 30
    :cond_4a
    :goto_4a
    return v3
.end method

.method private next(Z)Z
    .registers 5

    .line 35
    iget-object v0, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    iget-object v1, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v1

    iget-object v2, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 36
    iget-object v2, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v2, v0, v1}, Lcom/code/ide/compat/FieldRanges;->contains(II)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->end()V

    const/4 p1, 0x0

    return p1

    .line 37
    :cond_2d
    iget-object v0, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v0, p1}, Lcom/code/ide/compat/FieldRanges;->move(Z)Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->select()V

    goto :goto_47

    :cond_39
    iget-object p1, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v0}, Lcom/code/ide/compat/FieldRanges;->end()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->end()V

    .line 38
    :goto_47
    const/4 p1, 0x1

    return p1
.end method

.method private select()V
    .registers 4

    .line 24
    iget-object v0, p0, Lcom/code/ide/compat/EmmetFields;->editor:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v1}, Lcom/code/ide/compat/FieldRanges;->start()I

    move-result v1

    iget-object v2, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v2}, Lcom/code/ide/compat/FieldRanges;->end()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setSelection(II)V

    return-void
.end method

.method public static start(Landroid/app/Activity;Landroid/widget/EditText;ILorg/json/JSONObject;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 17
    invoke-static {p0}, Lcom/code/ide/compat/EmmetFields;->cancel(Landroid/app/Activity;)V

    const-string v0, "fields"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p3

    if-eqz p3, :cond_50

    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_12

    goto :goto_50

    .line 18
    :cond_12
    new-instance v0, Lcom/code/ide/compat/EmmetFields;

    invoke-direct {v0, p0, p1}, Lcom/code/ide/compat/EmmetFields;-><init>(Landroid/app/Activity;Landroid/widget/EditText;)V

    .line 19
    const/4 v1, 0x0

    :goto_18
    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_44

    invoke-virtual {p3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "start"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v3, p2

    const-string v4, "end"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    add-int/2addr v2, p2

    if-ltz v3, :cond_43

    if-lt v2, v3, :cond_43

    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v4

    if-le v2, v4, :cond_3b

    goto :goto_43

    :cond_3b
    iget-object v4, v0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {v4, v3, v2}, Lcom/code/ide/compat/FieldRanges;->add(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_43
    :goto_43
    return-void

    .line 20
    :cond_44
    sget-object p2, Lcom/code/ide/compat/EmmetFields;->active:Ljava/util/Map;

    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-direct {v0}, Lcom/code/ide/compat/EmmetFields;->select()V

    .line 21
    return-void

    .line 17
    :cond_50
    :goto_50
    return-void
.end method

.method public static text(Landroid/widget/EditText;Ljava/lang/CharSequence;)Z
    .registers 4

    .line 33
    invoke-static {p0}, Lcom/code/ide/compat/EmmetFields;->find(Landroid/view/View;)Lcom/code/ide/compat/EmmetFields;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_16

    const-string v1, "\t"

    invoke-virtual {v1, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-direct {p0, v0}, Lcom/code/ide/compat/EmmetFields;->next(Z)Z

    move-result p0

    if-eqz p0, :cond_16

    const/4 v0, 0x1

    :cond_16
    return v0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 42
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 40
    iget-object p1, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    add-int/2addr p3, p2

    invoke-virtual {p1, p2, p3}, Lcom/code/ide/compat/FieldRanges;->contains(II)Z

    move-result p1

    if-nez p1, :cond_c

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->end()V

    :cond_c
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 41
    iget-boolean p1, p0, Lcom/code/ide/compat/EmmetFields;->ended:Z

    if-nez p1, :cond_f

    iget-object p1, p0, Lcom/code/ide/compat/EmmetFields;->ranges:Lcom/code/ide/compat/FieldRanges;

    invoke-virtual {p1, p2, p3, p4}, Lcom/code/ide/compat/FieldRanges;->edit(III)Z

    move-result p1

    if-nez p1, :cond_f

    invoke-direct {p0}, Lcom/code/ide/compat/EmmetFields;->end()V

    :cond_f
    return-void
.end method
