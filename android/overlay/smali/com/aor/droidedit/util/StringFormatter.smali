.class public Lcom/aor/droidedit/util/StringFormatter;
.super Ljava/lang/Object;
.source "StringFormatter.java"


# static fields
.field private static final DAY_MILLIS:I = 0x5265c00

.field private static final HOUR_MILLIS:I = 0x36ee80

.field private static final MINUTE_MILLIS:I = 0xea60

.field private static final SECOND_MILLIS:I = 0x3e8

.field private static final dateFormat:Ljava/text/DateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/text/SimpleDateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    sput-object v0, Lcom/aor/droidedit/util/StringFormatter;->dateFormat:Ljava/text/DateFormat;

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTimeAgo(J)Ljava/lang/String;
 .locals 1
 invoke-static {p0, p1}, Lcom/code/ide/compat/AppText;->timeAgo(J)Ljava/lang/String;
 move-result-object v0
 return-object v0
.end method

.method public static humanReadableByteCount(JZ)Ljava/lang/String;
    .locals 12
    .param p0, "bytes"    # J
    .param p2, "si"    # Z

    .prologue
    .line 12
    const-wide/16 v4, -0x1

    cmp-long v3, p0, v4

    if-nez v3, :cond_0

    const-string/jumbo v3, ""

    .line 17
    :goto_0
    return-object v3

    .line 13
    :cond_0
    if-eqz p2, :cond_1

    const/16 v2, 0x3e8

    .line 14
    .local v2, "unit":I
    :goto_1
    int-to-long v4, v2

    cmp-long v3, p0, v4

    if-gez v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, " B"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 13
    .end local v2    # "unit":I
    :cond_1
    const/16 v2, 0x400

    goto :goto_1

    .line 15
    .restart local v2    # "unit":I
    :cond_2
    long-to-double v4, p0

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    int-to-double v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    div-double/2addr v4, v6

    double-to-int v0, v4

    .line 16
    .local v0, "exp":I
    new-instance v4, Ljava/lang/StringBuilder;

    if-eqz p2, :cond_3

    const-string/jumbo v3, "kMGTPE"

    :goto_2
    add-int/lit8 v5, v0, -0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_4

    const-string/jumbo v3, ""

    :goto_3
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 17
    .local v1, "pre":Ljava/lang/String;
    const-string/jumbo v3, "%.1f %sB"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    long-to-double v6, p0

    int-to-double v8, v2

    int-to-double v10, v0

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 16
    .end local v1    # "pre":Ljava/lang/String;
    :cond_3
    const-string/jumbo v3, "KMGTPE"

    goto :goto_2

    :cond_4
    const-string/jumbo v3, "i"

    goto :goto_3
.end method
