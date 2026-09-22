.class public final Lcom/code/ide/compat/AppText;
.super Ljava/lang/Object;
.source "AppText.java"


# static fields
.field private static context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .registers 1

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    return-void
.end method

.method private static quantity(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5

    .line 18
    sget-object v0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v1, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    const-string v2, "plurals"

    invoke-static {v1, p0, v2}, Lcom/code/ide/compat/AppUi;->id(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, p1, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static timeAgo(J)Ljava/lang/String;
    .registers 7

    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p0

    .line 11
    sget-object v2, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    if-eqz v2, :cond_64

    const-wide/16 v2, 0x0

    cmp-long v4, p0, v2

    if-lez v4, :cond_64

    cmp-long v2, v0, v2

    if-ltz v2, :cond_64

    const-wide/32 v2, 0xf731400

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1b

    goto :goto_64

    .line 12
    :cond_1b
    const-wide/32 p0, 0xea60

    cmp-long v2, v0, p0

    if-gez v2, :cond_2b

    sget-object p0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    const-string p1, "time_just_now"

    invoke-static {p0, p1}, Lcom/code/ide/compat/AppUi;->text(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 13
    :cond_2b
    const-wide/32 v2, 0x36ee80

    cmp-long v4, v0, v2

    if-gez v4, :cond_3b

    div-long/2addr v0, p0

    long-to-int p0, v0

    const-string p1, "time_minutes"

    invoke-static {p1, p0}, Lcom/code/ide/compat/AppText;->quantity(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 14
    :cond_3b
    const-wide/32 p0, 0x5265c00

    cmp-long v4, v0, p0

    if-gez v4, :cond_4b

    div-long/2addr v0, v2

    long-to-int p0, v0

    const-string p1, "time_hours"

    invoke-static {p1, p0}, Lcom/code/ide/compat/AppText;->quantity(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 15
    :cond_4b
    const-wide/32 v2, 0xa4cb800

    cmp-long v2, v0, v2

    if-gez v2, :cond_5b

    sget-object p0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    const-string p1, "time_yesterday"

    invoke-static {p0, p1}, Lcom/code/ide/compat/AppUi;->text(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 16
    :cond_5b
    div-long/2addr v0, p0

    long-to-int p0, v0

    const-string p1, "time_days"

    invoke-static {p1, p0}, Lcom/code/ide/compat/AppText;->quantity(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 11
    :cond_64
    :goto_64
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static untitled()Ljava/lang/String;
    .registers 2

    .line 8
    sget-object v0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    if-nez v0, :cond_7

    const-string v0, "untitled"

    goto :goto_f

    :cond_7
    sget-object v0, Lcom/code/ide/compat/AppText;->context:Landroid/content/Context;

    const-string v1, "file_untitled"

    invoke-static {v0, v1}, Lcom/code/ide/compat/AppUi;->text(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_f
    return-object v0
.end method
