.class public final Lcom/code/ide/compat/RecoveryTicker;
.super Ljava/lang/Object;
.source "RecoveryTicker.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Ljava/lang/Runnable;


# static fields
.field private static final active:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Lcom/code/ide/compat/RecoveryTicker;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final activity:Landroid/app/Activity;

.field private dirty:Z

.field private final editor:Landroid/widget/EditText;

.field private final handler:Landroid/os/Handler;

.field private final save:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/code/ide/compat/RecoveryTicker;->active:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V
    .registers 6

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->handler:Landroid/os/Handler;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/code/ide/compat/RecoveryTicker;->dirty:Z

    .line 12
    iput-object p1, p0, Lcom/code/ide/compat/RecoveryTicker;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/code/ide/compat/RecoveryTicker;->editor:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/code/ide/compat/RecoveryTicker;->save:Ljava/lang/Runnable;

    return-void
.end method

.method public static start(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V
    .registers 4

    .line 13
    invoke-static {p0}, Lcom/code/ide/compat/RecoveryTicker;->stop(Landroid/app/Activity;)V

    if-nez p1, :cond_6

    return-void

    :cond_6
    new-instance v0, Lcom/code/ide/compat/RecoveryTicker;

    invoke-direct {v0, p0, p1, p2}, Lcom/code/ide/compat/RecoveryTicker;-><init>(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/Runnable;)V

    sget-object p2, Lcom/code/ide/compat/RecoveryTicker;->active:Ljava/util/Map;

    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, v0, Lcom/code/ide/compat/RecoveryTicker;->handler:Landroid/os/Handler;

    const-wide/16 p1, 0x3a98

    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static stop(Landroid/app/Activity;)V
    .registers 2

    .line 14
    sget-object v0, Lcom/code/ide/compat/RecoveryTicker;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/code/ide/compat/RecoveryTicker;

    if-eqz p0, :cond_14

    iget-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_14
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 18
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 17
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 16
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/code/ide/compat/RecoveryTicker;->dirty:Z

    return-void
.end method

.method public run()V
    .registers 4

    .line 15
    sget-object v0, Lcom/code/ide/compat/RecoveryTicker;->active:Ljava/util/Map;

    iget-object v1, p0, Lcom/code/ide/compat/RecoveryTicker;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_26

    iget-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_26

    :cond_13
    iget-boolean v0, p0, Lcom/code/ide/compat/RecoveryTicker;->dirty:Z

    if-eqz v0, :cond_1f

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/code/ide/compat/RecoveryTicker;->dirty:Z

    iget-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->save:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_1f
    iget-object v0, p0, Lcom/code/ide/compat/RecoveryTicker;->handler:Landroid/os/Handler;

    const-wide/16 v1, 0x3a98

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_26
    :goto_26
    return-void
.end method
