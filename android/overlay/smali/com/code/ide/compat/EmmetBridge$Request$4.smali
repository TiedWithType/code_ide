.class Lcom/code/ide/compat/EmmetBridge$Request$4;
.super Ljava/lang/Object;
.source "EmmetBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/code/ide/compat/EmmetBridge$Request;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/code/ide/compat/EmmetBridge$Request;

.field final synthetic val$view:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/code/ide/compat/EmmetBridge$Request;Landroid/webkit/WebView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 151
    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$4;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    iput-object p2, p0, Lcom/code/ide/compat/EmmetBridge$Request$4;->val$view:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 151
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request$4;->val$view:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request$4;->val$view:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method
