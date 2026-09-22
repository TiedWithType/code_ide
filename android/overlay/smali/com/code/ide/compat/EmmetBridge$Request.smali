.class final Lcom/code/ide/compat/EmmetBridge$Request;
.super Ljava/lang/Object;
.source "EmmetBridge.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/code/ide/compat/EmmetBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Request"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field closed:Z

.field final editor:Landroid/widget/EditText;

.field engine:Landroid/webkit/WebView;

.field evaluated:Z

.field final handler:Landroid/os/Handler;

.field final indent:Ljava/lang/String;

.field final original:Ljava/lang/String;

.field final selectionEnd:I

.field final selectionStart:I

.field final syntax:Ljava/lang/String;

.field final timeout:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/widget/EditText;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->handler:Landroid/os/Handler;

    .line 75
    new-instance v0, Lcom/code/ide/compat/EmmetBridge$Request$1;

    invoke-direct {v0, p0}, Lcom/code/ide/compat/EmmetBridge$Request$1;-><init>(Lcom/code/ide/compat/EmmetBridge$Request;)V

    iput-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->timeout:Ljava/lang/Runnable;

    .line 77
    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/code/ide/compat/EmmetBridge$Request;->syntax:Ljava/lang/String;

    iput-object p4, p0, Lcom/code/ide/compat/EmmetBridge$Request;->indent:Ljava/lang/String;

    .line 78
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->original:Ljava/lang/String;

    .line 79
    invoke-virtual {p2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result p1

    iput p1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionStart:I

    invoke-virtual {p2}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result p1

    iput p1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionEnd:I

    .line 80
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 155
    return-void
.end method

.method apply(Ljava/lang/String;)V
    .registers 10

    .line 119
    const-string v0, "invalid"

    iget-boolean v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->closed:Z

    if-eqz v1, :cond_7

    return-void

    .line 121
    :cond_7
    :try_start_7
    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_e4

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_e4

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    .line 122
    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v1

    iget v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionStart:I

    if-ne v1, v2, :cond_e4

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    iget v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionEnd:I

    if-ne v1, v2, :cond_e4

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->original:Ljava/lang/String;

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    .line 123
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    goto/16 :goto_e4

    .line 124
    :cond_3f
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 125
    const-string p1, "ok"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_77

    .line 126
    const-string p1, "error"

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 127
    const-string v1, "syntax"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73

    const-string v1, "size"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73

    const-string v1, "empty"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73

    const-string v1, "context"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_73

    move-object p1, v0

    .line 128
    :cond_73
    invoke-virtual {p0, p1}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    return-void

    .line 130
    :cond_77
    const-string p1, "start"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1

    const-string v2, "end"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 131
    const-string v3, "text"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 132
    const-string v4, "selectionStart"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "selectionEnd"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 133
    if-ltz p1, :cond_e0

    if-lt v2, p1, :cond_e0

    iget-object v6, p0, Lcom/code/ide/compat/EmmetBridge$Request;->original:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-gt v2, v6, :cond_e0

    if-ltz v4, :cond_e0

    if-lt v5, v4, :cond_e0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-gt v5, v6, :cond_e0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    const/high16 v7, 0x40000

    if-le v6, v7, :cond_b4

    goto :goto_e0

    .line 136
    :cond_b4
    invoke-virtual {p0}, Lcom/code/ide/compat/EmmetBridge$Request;->close()V

    .line 137
    iget-object v6, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->beginBatchEdit()V
    :try_end_bc
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_bc} :catch_e8

    .line 138
    :try_start_bc
    iget-object v6, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6, p1, v2, v3}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    add-int/2addr v4, p1

    add-int/2addr v5, p1

    invoke-virtual {v2, v4, v5}, Landroid/widget/EditText;->setSelection(II)V

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-static {v2, v3, p1, v1}, Lcom/code/ide/compat/EmmetFields;->start(Landroid/app/Activity;Landroid/widget/EditText;ILorg/json/JSONObject;)V
    :try_end_d3
    .catchall {:try_start_bc .. :try_end_d3} :catchall_d9

    .line 139
    :try_start_d3
    iget-object p1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->endBatchEdit()V

    .line 140
    goto :goto_ec

    .line 139
    :catchall_d9
    move-exception p1

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->endBatchEdit()V

    throw p1

    .line 134
    :cond_e0
    :goto_e0
    invoke-virtual {p0, v0}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    return-void

    .line 123
    :cond_e4
    :goto_e4
    invoke-virtual {p0}, Lcom/code/ide/compat/EmmetBridge$Request;->close()V
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_d3 .. :try_end_e7} :catch_e8

    return-void

    .line 140
    :catch_e8
    move-exception p1

    invoke-virtual {p0, v0}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    .line 141
    :goto_ec
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 153
    return-void
.end method

.method close()V
    .registers 4

    .line 144
    iget-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->closed:Z

    if-eqz v0, :cond_5

    return-void

    .line 145
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->closed:Z

    .line 146
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 147
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 148
    # getter for: Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Lcom/code/ide/compat/EmmetBridge;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_29

    # getter for: Lcom/code/ide/compat/EmmetBridge;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Lcom/code/ide/compat/EmmetBridge;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_29
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    .line 151
    if-eqz v0, :cond_3a

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/code/ide/compat/EmmetBridge$Request$4;

    invoke-direct {v2, p0, v0}, Lcom/code/ide/compat/EmmetBridge$Request$4;-><init>(Lcom/code/ide/compat/EmmetBridge$Request;Landroid/webkit/WebView;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 152
    :cond_3a
    return-void
.end method

.method evaluate()V
    .registers 5

    .line 104
    iget-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->closed:Z

    if-nez v0, :cond_9a

    iget-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->evaluated:Z

    if-eqz v0, :cond_a

    goto/16 :goto_9a

    .line 105
    :cond_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->evaluated:Z

    .line 107
    :try_start_d
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 108
    const-string v1, "text"

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->original:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "start"

    iget v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionStart:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "end"

    iget v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->selectionEnd:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 109
    const-string v1, "syntax"

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->syntax:Ljava/lang/String;

    if-nez v2, :cond_30

    const-string v2, ""

    goto :goto_32

    :cond_30
    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->syntax:Ljava/lang/String;

    :goto_32
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "indent"

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->indent:Ljava/lang/String;

    if-nez v2, :cond_3e

    const-string v2, "    "

    goto :goto_40

    :cond_3e
    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->indent:Ljava/lang/String;

    :goto_40
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 110
    const-string v1, "lang"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    const-string v1, "snippets"

    iget-object v2, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/code/ide/compat/EmmetSnippets;->get(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u2028"

    const-string v2, "\\u2028"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u2029"

    const-string v2, "\\u2029"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 113
    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CodeIDEEmmet.expand("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/code/ide/compat/EmmetBridge$Request$3;

    invoke-direct {v2, p0}, Lcom/code/ide/compat/EmmetBridge$Request$3;-><init>(Lcom/code/ide/compat/EmmetBridge$Request;)V

    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_92} :catch_93

    .line 116
    goto :goto_99

    :catch_93
    move-exception v0

    const-string v0, "engine"

    invoke-virtual {p0, v0}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    .line 117
    :goto_99
    return-void

    .line 104
    :cond_9a
    :goto_9a
    return-void
.end method

.method fail(Ljava/lang/String;)V
    .registers 3

    .line 142
    iget-boolean v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->closed:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    # invokes: Lcom/code/ide/compat/EmmetBridge;->message(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/code/ide/compat/EmmetBridge;->access$100(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/code/ide/compat/EmmetBridge$Request;->close()V

    :cond_c
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 154
    invoke-virtual {p0}, Lcom/code/ide/compat/EmmetBridge$Request;->close()V

    return-void
.end method

.method start()V
    .registers 11

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->editor:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 84
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    .line 85
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 86
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 87
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 88
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 89
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 90
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 91
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBlockNetworkLoads(Z)V

    .line 92
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    .line 93
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 94
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    new-instance v1, Lcom/code/ide/compat/EmmetBridge$Request$2;

    invoke-direct {v1, p0}, Lcom/code/ide/compat/EmmetBridge$Request$2;-><init>(Lcom/code/ide/compat/EmmetBridge$Request;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 99
    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/code/ide/compat/EmmetBridge$Request;->timeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 100
    iget-object v4, p0, Lcom/code/ide/compat/EmmetBridge$Request;->engine:Landroid/webkit/WebView;

    const-string v5, "https://emmet.invalid/"

    iget-object v0, p0, Lcom/code/ide/compat/EmmetBridge$Request;->activity:Landroid/app/Activity;

    # invokes: Lcom/code/ide/compat/EmmetBridge;->page(Landroid/content/Context;)Ljava/lang/String;
    invoke-static {v0}, Lcom/code/ide/compat/EmmetBridge;->access$000(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "text/html"

    const-string v8, "UTF-8"

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_53} :catch_54

    .line 101
    goto :goto_5a

    :catch_54
    move-exception v0

    const-string v0, "engine"

    invoke-virtual {p0, v0}, Lcom/code/ide/compat/EmmetBridge$Request;->fail(Ljava/lang/String;)V

    .line 102
    :goto_5a
    return-void
.end method
