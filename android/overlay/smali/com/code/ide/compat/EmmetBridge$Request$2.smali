.class Lcom/code/ide/compat/EmmetBridge$Request$2;
.super Landroid/webkit/WebViewClient;
.source "EmmetBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/code/ide/compat/EmmetBridge$Request;->start()V
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

    .line 94
    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$2;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 3

    .line 96
    iget-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$2;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    invoke-virtual {p1}, Lcom/code/ide/compat/EmmetBridge$Request;->evaluate()V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 97
    iget-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request$2;->this$0:Lcom/code/ide/compat/EmmetBridge$Request;

    const-string p2, "engine"

    invoke-virtual {p1, p2}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .registers 3

    .line 95
    const/4 p1, 0x1

    return p1
.end method
