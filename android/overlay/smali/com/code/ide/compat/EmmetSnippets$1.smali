.class Lcom/code/ide/compat/EmmetSnippets$1;
.super Ljava/lang/Object;
.source "EmmetSnippets.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/code/ide/compat/EmmetSnippets;->edit(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$d:Landroid/app/AlertDialog;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/EditText;Landroid/app/Activity;Landroid/app/AlertDialog;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 21
    iput-object p1, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$input:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$d:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 22
    :try_start_0
    iget-object p1, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/code/ide/compat/EmmetSnippets;->validate(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$a:Landroid/app/Activity;

    const-string v1, "emmet"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "snippets"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p1

    if-eqz p1, :cond_2c

    iget-object p1, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$d:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 23
    goto :goto_40

    .line 22
    :cond_2c
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_32} :catch_32

    .line 23
    :catch_32
    move-exception p1

    iget-object p1, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$input:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/code/ide/compat/EmmetSnippets$1;->val$a:Landroid/app/Activity;

    const-string v1, "emmet_snippets_invalid"

    invoke-static {v0, v1}, Lcom/code/ide/compat/AppUi;->text(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 24
    :goto_40
    return-void
.end method
