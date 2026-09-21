.class Lcom/code/ide/compat/EmmetBridge$Request$3;
.super Ljava/lang/Object;
.source "EmmetBridge.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/code/ide/compat/EmmetBridge$Request;->evaluate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/code/ide/compat/EmmetBridge$Request;


# direct methods
.method constructor <init>(Lcom/code/ide/compat/EmmetBridge$Request;)V
    .registers 2

    .line 111
    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$3;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .registers 2

    .line 111
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/code/ide/compat/EmmetBridge$Request$3;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .registers 3

    .line 112
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request$3;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-virtual {v0, p1}, Lcom/code/ide/compat/EmmetBridge$Request;->apply(Ljava/lang/String;)V

    return-void
.end method
