.class public final Lcom/code/ide/compat/InsetsListener;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field private final bottom:I

.field private final left:I

.field private final right:I

.field private final top:I

.field private final view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/code/ide/compat/InsetsListener;->view:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    iput v0, p0, Lcom/code/ide/compat/InsetsListener;->left:I

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    iput v0, p0, Lcom/code/ide/compat/InsetsListener;->top:I

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    iput v0, p0, Lcom/code/ide/compat/InsetsListener;->right:I

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    iput v0, p0, Lcom/code/ide/compat/InsetsListener;->bottom:I

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 6

    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v2

    iget v3, p0, Lcom/code/ide/compat/InsetsListener;->bottom:I

    add-int/2addr v0, v3

    iget v3, p0, Lcom/code/ide/compat/InsetsListener;->left:I

    add-int/2addr v1, v3

    iget v3, p0, Lcom/code/ide/compat/InsetsListener;->right:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/code/ide/compat/InsetsListener;->top:I

    invoke-virtual {p1, v1, v3, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p2
.end method
