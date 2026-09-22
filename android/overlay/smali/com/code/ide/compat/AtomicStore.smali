.class public final Lcom/code/ide/compat/AtomicStore;
.super Ljava/lang/Object;
.source "AtomicStore.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized read(Ljava/io/File;)Ljava/lang/Object;
    .registers 4

    const-class v0, Lcom/code/ide/compat/AtomicStore;

    monitor-enter v0

    .line 9
    :try_start_3
    invoke-static {p0}, Lcom/code/ide/compat/AtomicStore;->readOne(Ljava/io/File;)Ljava/lang/Object;

    move-result-object p0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_7} :catch_b
    .catchall {:try_start_3 .. :try_end_7} :catchall_9

    monitor-exit v0

    return-object p0

    .line 8
    :catchall_9
    move-exception p0

    goto :goto_2e

    .line 9
    :catch_b
    move-exception v1

    .line 10
    :try_start_c
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, ".bak"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/code/ide/compat/AtomicStore;->readOne(Ljava/io/File;)Ljava/lang/Object;

    move-result-object p0
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_2c} :catch_30
    .catchall {:try_start_c .. :try_end_2c} :catchall_9

    monitor-exit v0

    return-object p0

    .line 8
    :goto_2e
    :try_start_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_9

    throw p0

    .line 10
    :catch_30
    move-exception p0

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0
.end method

.method private static readOne(Ljava/io/File;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 6
    new-instance v0, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_a
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p0
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_12

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V

    return-object p0

    :catchall_12
    move-exception p0

    :try_start_13
    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_17

    goto :goto_1b

    :catchall_17
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1b
    throw p0
.end method

.method public static declared-synchronized write(Ljava/io/File;Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lcom/code/ide/compat/AtomicStore;

    monitor-enter v0

    .line 13
    :try_start_3
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".bak"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_d2

    .line 15
    :try_start_3b
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_40
    .catchall {:try_start_3b .. :try_end_40} :catchall_c7

    :try_start_40
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_45
    .catchall {:try_start_40 .. :try_end_45} :catchall_bd

    :try_start_45
    invoke-virtual {v4, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->flush()V

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_52
    .catchall {:try_start_45 .. :try_end_52} :catchall_b3

    :try_start_52
    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_55
    .catchall {:try_start_52 .. :try_end_55} :catchall_bd

    :try_start_55
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_58
    .catchall {:try_start_55 .. :try_end_58} :catchall_c7

    .line 16
    :try_start_58
    invoke-static {p0}, Lcom/code/ide/compat/AtomicStore;->readOne(Ljava/io/File;)Ljava/lang/Object;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_5d
    .catchall {:try_start_58 .. :try_end_5b} :catchall_c7

    const/4 p1, 0x1

    goto :goto_5f

    :catch_5d
    move-exception p1

    const/4 p1, 0x0

    .line 17
    :goto_5f
    if-eqz p1, :cond_85

    :try_start_61
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_76

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_6e

    goto :goto_76

    :cond_6e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot rotate recovery backup"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_75
    throw p0

    :cond_76
    :goto_76
    invoke-virtual {p0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_7d

    goto :goto_9a

    :cond_7d
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot retain previous snapshot"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_75

    .line 18
    :cond_85
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_9a

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_92

    goto :goto_9a

    :cond_92
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot replace incomplete snapshot"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 19
    :cond_9a
    :goto_9a
    invoke-virtual {v1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0
    :try_end_9e
    .catchall {:try_start_61 .. :try_end_9e} :catchall_c7

    if-eqz p0, :cond_ab

    .line 20
    :try_start_a0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_a9

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_a9
    .catchall {:try_start_a0 .. :try_end_a9} :catchall_d2

    .line 21
    :cond_a9
    monitor-exit v0

    return-void

    .line 19
    :cond_ab
    :try_start_ab
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Cannot commit recovery snapshot"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_b3
    .catchall {:try_start_ab .. :try_end_b3} :catchall_c7

    .line 15
    :catchall_b3
    move-exception p0

    :try_start_b4
    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_b7
    .catchall {:try_start_b4 .. :try_end_b7} :catchall_b8

    goto :goto_bc

    :catchall_b8
    move-exception p1

    :try_start_b9
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_bc
    throw p0
    :try_end_bd
    .catchall {:try_start_b9 .. :try_end_bd} :catchall_bd

    :catchall_bd
    move-exception p0

    :try_start_be
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_c1
    .catchall {:try_start_be .. :try_end_c1} :catchall_c2

    goto :goto_c6

    :catchall_c2
    move-exception p1

    :try_start_c3
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_c6
    throw p0
    :try_end_c7
    .catchall {:try_start_c3 .. :try_end_c7} :catchall_c7

    .line 20
    :catchall_c7
    move-exception p0

    :try_start_c8
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_d1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_d1
    throw p0

    .line 12
    :catchall_d2
    move-exception p0

    monitor-exit v0
    :try_end_d4
    .catchall {:try_start_c8 .. :try_end_d4} :catchall_d2

    throw p0
.end method
