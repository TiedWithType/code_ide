.class Lcom/aor/droidedit/SaveCloseClick;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity;->closeDocument(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/SaveCloseClick;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iput p2, p0, Lcom/aor/droidedit/SaveCloseClick;->val$id:I

    .line 2197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2200
    iget-object v0, p0, Lcom/aor/droidedit/SaveCloseClick;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget v1, p0, Lcom/aor/droidedit/SaveCloseClick;->val$id:I

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->compatSaveAndClose(I)V

    .line 2201
    return-void
.end method
