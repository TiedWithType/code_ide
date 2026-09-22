.class public final Lcom/code/ide/compat/StateIo;
.super Ljava/lang/Object;
.source "StateIo.java"


# static fields
.field private static warned:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-static {p0}, Lcom/code/ide/compat/AtomicStore;->read(Ljava/io/File;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static write(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    .line 9
    :try_start_0
    invoke-virtual {p0, p2}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/code/ide/compat/AtomicStore;->write(Ljava/io/File;Ljava/lang/Object;)V

    const/4 p1, 0x0

    sput-boolean p1, Lcom/code/ide/compat/StateIo;->warned:Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    goto :goto_28

    .line 10
    :catch_b
    move-exception p1

    const-string p2, "CodeIDE"

    const-string v0, "Session checkpoint failed"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-boolean p1, Lcom/code/ide/compat/StateIo;->warned:Z

    if-nez p1, :cond_28

    const/4 p1, 0x1

    sput-boolean p1, Lcom/code/ide/compat/StateIo;->warned:Z

    const-string p2, "recovery_write_failed"

    invoke-static {p0, p2}, Lcom/code/ide/compat/AppUi;->text(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_29

    :cond_28
    :goto_28
    nop

    .line 11
    :goto_29
    return-void
.end method
