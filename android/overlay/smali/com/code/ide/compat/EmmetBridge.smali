.class public final Lcom/code/ide/compat/EmmetBridge;
.super Ljava/lang/Object;
.source "EmmetBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/code/ide/compat/EmmetBridge$Request;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Lcom/code/ide/compat/EmmetBridge$Request;",
            ">;"
        }
    .end annotation
.end field

.field private static page:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0}, Lcom/code/ide/compat/EmmetBridge;->page(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .line 23
    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetBridge;->message(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200()Ljava/util/Map;
    .registers 1

    .line 23
    sget-object v0, Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;

    return-object v0
.end method

.method public static canExpand(Landroid/widget/EditText;Ljava/lang/String;)Z
    .registers 3

    .line 31
    const/4 v0, 0x0

    if-eqz p0, :cond_1c

    invoke-static {p1}, Lcom/code/ide/compat/EmmetBridge;->supported(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_a

    goto :goto_1c

    .line 32
    :cond_a
    invoke-virtual {p0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result p1

    invoke-virtual {p0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result p0

    .line 33
    if-ltz p1, :cond_1b

    if-ltz p0, :cond_1b

    if-ne p1, p0, :cond_1a

    if-lez p1, :cond_1b

    :cond_1a
    const/4 v0, 0x1

    :cond_1b
    return v0

    .line 31
    :cond_1c
    :goto_1c
    return v0
.end method

.method public static cancel(Landroid/app/Activity;)V
    .registers 2

    .line 36
    invoke-static {p0}, Lcom/code/ide/compat/EmmetFields;->cancel(Landroid/app/Activity;)V

    .line 37
    sget-object v0, Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/code/ide/compat/EmmetBridge$Request;

    .line 38
    if-eqz p0, :cond_10

    invoke-virtual {p0}, Lcom/code/ide/compat/EmmetBridge$Request;->close()V

    .line 39
    :cond_10
    return-void
.end method

.method public static expand(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 45
    invoke-static {p2}, Lcom/code/ide/compat/EmmetBridge;->supported(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string p1, "syntax"

    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetBridge;->message(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 46
    :cond_c
    invoke-static {p1, p2}, Lcom/code/ide/compat/EmmetBridge;->canExpand(Landroid/widget/EditText;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string p1, "empty"

    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetBridge;->message(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 47
    :cond_18
    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v0

    const/high16 v1, 0x80000

    if-le v0, v1, :cond_26

    const-string p1, "size"

    invoke-static {p0, p1}, Lcom/code/ide/compat/EmmetBridge;->message(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 48
    :cond_26
    invoke-static {p0}, Lcom/code/ide/compat/EmmetBridge;->cancel(Landroid/app/Activity;)V

    .line 49
    new-instance v0, Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/code/ide/compat/EmmetBridge$Request;-><init>(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    sget-object p1, Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    invoke-virtual {v0}, Lcom/code/ide/compat/EmmetBridge$Request;->start()V

    .line 52
    return-void
.end method

.method private static message(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 41
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "emmet_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "string"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    .line 42
    if-eqz p1, :cond_2b

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 43
    :cond_2b
    return-void
.end method

.method private static declared-synchronized page(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/code/ide/compat/EmmetBridge;

    monitor-enter v0

    .line 54
    :try_start_3
    sget-object v1, Lcom/code/ide/compat/EmmetBridge;->page:Ljava/lang/String;

    if-nez v1, :cond_5d

    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    const-string v1, "emmet/emmet.js"

    invoke-virtual {p0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 56
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_61

    .line 57
    const/16 v2, 0x2000

    :try_start_18
    new-array v2, v2, [B

    :goto_1a
    invoke-virtual {p0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_26

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_25
    .catchall {:try_start_18 .. :try_end_25} :catchall_58

    goto :goto_1a

    .line 58
    :cond_26
    :try_start_26
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 60
    new-instance p0, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v1, "</script"

    const-string v2, "<\\/script"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<!doctype html><html><head><meta charset=\"utf-8\"><meta http-equiv=\"Content-Security-Policy\" content=\"default-src \'none\'; script-src \'unsafe-inline\'; connect-src \'none\'\"></head><body><script>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "</script></body></html>"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/code/ide/compat/EmmetBridge;->page:Ljava/lang/String;

    goto :goto_5d

    .line 58
    :catchall_58
    move-exception v1

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v1

    .line 65
    :cond_5d
    :goto_5d
    sget-object p0, Lcom/code/ide/compat/EmmetBridge;->page:Ljava/lang/String;
    :try_end_5f
    .catchall {:try_start_26 .. :try_end_5f} :catchall_61

    monitor-exit v0

    return-object p0

    .line 53
    :catchall_61
    move-exception p0

    :try_start_62
    monitor-exit v0
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw p0
.end method

.method private static supported(Ljava/lang/String;)Z
    .registers 3

    .line 27
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_b

    :cond_5
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 28
    :goto_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "|html|xhtml|xml|xsl|svg|php|shtml|rhtml|jsp|gsp|asp|vue|css|scss|sass|stylus|jsx|tsx|text|txt||"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method
