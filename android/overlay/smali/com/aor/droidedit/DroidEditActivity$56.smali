.class Lcom/aor/droidedit/DroidEditActivity$56;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity;->changeSyntax()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;

.field private final synthetic val$names:[Ljava/lang/String;

.field private final synthetic val$types:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iput-object p2, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$types:[Ljava/lang/String;

    iput-object p3, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$names:[Ljava/lang/String;

    .line 2092
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity$56;)Lcom/aor/droidedit/DroidEditActivity;
    .locals 1

    .prologue
    .line 2092
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 10
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2095
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$types:[Ljava/lang/String;

    aget-object v2, v0, p2

    .line 2096
    .local v2, "syntax":Ljava/lang/String;
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v4

    .line 2097
    .local v4, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v4}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v3

    .line 2098
    .local v3, "extension":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 2099
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v1, Lcom/aor/droidedit/lib/R$string;->syntax_always_open:I

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    .line 2100
    .local v7, "message":Ljava/lang/CharSequence;
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\\$extension\\$"

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2101
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\\$language\\$"

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$names:[Ljava/lang/String;

    aget-object v5, v5, p2

    invoke-virtual {v0, v1, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2103
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->syntax_save:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    sget v9, Lcom/aor/droidedit/lib/R$string;->generic_yes:I

    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$56$1;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$types:[Ljava/lang/String;

    move-object v1, p0

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/aor/droidedit/DroidEditActivity$56$1;-><init>(Lcom/aor/droidedit/DroidEditActivity$56;Ljava/lang/String;Ljava/lang/String;Lcom/aor/droidedit/document/Document;[Ljava/lang/String;I)V

    invoke-virtual {v8, v9, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2116
    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_no:I

    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$56$2;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$types:[Ljava/lang/String;

    invoke-direct {v5, p0, v4, v6, p2}, Lcom/aor/droidedit/DroidEditActivity$56$2;-><init>(Lcom/aor/droidedit/DroidEditActivity$56;Lcom/aor/droidedit/document/Document;[Ljava/lang/String;I)V

    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2124
    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 2131
    .end local v7    # "message":Ljava/lang/CharSequence;
    :goto_0
    return-void

    .line 2126
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->val$types:[Ljava/lang/String;

    aget-object v0, v0, p2

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v4, v0, v1}, Lcom/aor/droidedit/document/Document;->setTokenMarker(Ljava/lang/String;Landroid/content/Context;)V

    .line 2127
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v0}, Lcom/aor/droidedit/DroidEditActivity;->access$24(Lcom/aor/droidedit/DroidEditActivity;)V

    .line 2128
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v1, 0x0

    invoke-virtual {v4}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    invoke-virtual {v0, v1, v5, v6}, Lcom/aor/droidedit/DroidEditActivity;->syntaxHighlight(IIZ)V

    .line 2129
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity$56;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->updateFooter()V

    goto :goto_0
.end method
