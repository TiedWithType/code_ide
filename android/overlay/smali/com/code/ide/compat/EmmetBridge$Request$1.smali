.class Lcom/code/ide/compat/EmmetBridge$Request$1;
.super Ljava/lang/Object;
.source "EmmetBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/code/ide/compat/EmmetBridge$Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/code/ide/compat/EmmetBridge$Request;


# direct methods
.method constructor <init>(Lcom/code/ide/compat/EmmetBridge$Request;)V
    .registers 2

    .line 74
    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$1;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 74
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request$1;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    const-string v1, "timeout"

    invoke-virtual {v0, v1}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    return-void
.end method
