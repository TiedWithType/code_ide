.class Lcom/aor/droidedit/DroidEditActivity$9;
.super Ljava/lang/Object;
.source "DroidEditActivity.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/DroidEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/DroidEditActivity;

.field private final synthetic val$prefs:Landroid/content/SharedPreferences;

.field private volumeCtrl:Z


# direct methods
.method constructor <init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/content/SharedPreferences;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iput-object p2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    .line 450
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 451
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity$9;->volumeCtrl:Z

    return-void
.end method

.method private deleteLine()V
    .locals 5

    .prologue
    const/16 v4, 0xa

    .line 807
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 808
    .local v1, "start":I
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 809
    .local v0, "end":I
    if-le v0, v1, :cond_0

    .line 810
    add-int/lit8 v0, v0, -0x1

    .line 811
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/text/Editable;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_4

    .line 813
    :cond_1
    :goto_1
    if-lez v1, :cond_2

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_5

    .line 815
    :cond_2
    if-lez v1, :cond_3

    .line 816
    add-int/lit8 v1, v1, -0x1

    .line 817
    :cond_3
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, v0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 818
    return-void

    .line 812
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 814
    :cond_5
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method private duplicateLine()V
    .locals 6

    .prologue
    const/16 v5, 0xa

    .line 794
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v4, v4, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 795
    .local v1, "start":I
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v4, v4, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 796
    .local v0, "end":I
    if-le v0, v1, :cond_0

    .line 797
    add-int/lit8 v0, v0, -0x1

    .line 798
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/text/Editable;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_3

    .line 800
    :cond_1
    :goto_1
    if-lez v1, :cond_2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    add-int/lit8 v4, v1, -0x1

    invoke-interface {v3, v4}, Landroid/text/Editable;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    .line 802
    :cond_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 803
    .local v2, "toDuplicate":Ljava/lang/String;
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "\n"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v0, v4}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 804
    return-void

    .line 799
    .end local v2    # "toDuplicate":Ljava/lang/String;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 801
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method private gotoBeginningOfLine(Z)V
    .locals 4
    .param p1, "shift"    # Z

    .prologue
    .line 784
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 785
    .local v1, "start":I
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 786
    .local v0, "end":I
    :goto_0
    if-lez v1, :cond_0

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v3}, Landroid/text/Editable;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 788
    :cond_0
    if-eqz p1, :cond_2

    .line 789
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2, v1, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    .line 791
    :goto_1
    return-void

    .line 787
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 790
    :cond_2
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    goto :goto_1
.end method

.method private gotoEndOfLine(Z)V
    .locals 4
    .param p1, "shift"    # Z

    .prologue
    .line 774
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 775
    .local v1, "start":I
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v3, v3, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 776
    .local v0, "end":I
    :goto_0
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/text/Editable;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 778
    :cond_0
    if-eqz p1, :cond_2

    .line 779
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2, v1, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    .line 781
    :goto_1
    return-void

    .line 777
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 780
    :cond_2
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v2, v2, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    goto :goto_1
.end method

.method private nextTab()V
    .locals 3

    .prologue
    .line 762
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity;->access$44(Lcom/aor/droidedit/DroidEditActivity;)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 763
    .local v0, "document":I
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity;->access$26(Lcom/aor/droidedit/DroidEditActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    .line 764
    :cond_0
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 765
    return-void
.end method

.method private prevTab()V
    .locals 3

    .prologue
    .line 768
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity;->access$44(Lcom/aor/droidedit/DroidEditActivity;)I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 769
    .local v0, "document":I
    if-gez v0, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v1}, Lcom/aor/droidedit/DroidEditActivity;->access$26(Lcom/aor/droidedit/DroidEditActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 770
    :cond_0
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 771
    return-void
.end method


# virtual methods
.method protected isCtrlPressed(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 821
    iget-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity$9;->volumeCtrl:Z

    if-eqz v2, :cond_1

    .line 825
    :cond_0
    :goto_0
    return v1

    .line 822
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 823
    .local v0, "sdkVersion":I
    const/16 v2, 0xb

    if-ge v0, v2, :cond_2

    .line 824
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v2

    and-int/lit16 v2, v2, 0x1000

    if-nez v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 825
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isCtrlPressed()Z

    move-result v1

    goto :goto_0
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    invoke-static {p1, p2, p3}, Lcom/code/ide/compat/EmmetFields;->key(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    move-result v0
    if-eqz v0, :compat_key_continue
    return v0
    :compat_key_continue
    const/16 v10, 0x42

    const/16 v9, 0x3d

    const/4 v11, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 456
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "volumeUpAsCtrl"

    invoke-interface {v5, v8, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 457
    const/16 v5, 0x18

    if-ne p2, v5, :cond_2

    .line 458
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-nez v5, :cond_0

    iput-boolean v7, p0, Lcom/aor/droidedit/DroidEditActivity$9;->volumeCtrl:Z

    .line 459
    :cond_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->volumeCtrl:Z

    .line 758
    :cond_1
    :goto_0
    return v7

    .line 464
    :cond_2
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "volumeDownAsTab"

    invoke-interface {v5, v8, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 465
    const/16 v5, 0x19

    if-ne p2, v5, :cond_3

    .line 466
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    const/16 p2, 0x3d

    .line 471
    :cond_3
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v8, v5, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const/16 v5, 0x13

    if-eq p2, v5, :cond_4

    const/16 v5, 0x14

    if-eq p2, v5, :cond_4

    move v5, v6

    :goto_1
    invoke-virtual {v8, v5}, Lcom/aor/droidedit/custom/ObservableEditText;->setArrowKeyPressed(Z)V

    .line 473
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_5

    move v7, v6

    .line 474
    goto :goto_0

    :cond_4
    move v5, v7

    .line 471
    goto :goto_1

    .line 475
    :cond_5
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 477
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-nez v5, :cond_6

    .line 478
    if-eq p2, v9, :cond_1

    .line 480
    if-eq p2, v10, :cond_1

    .line 484
    :cond_6
    const/16 v5, 0x8

    if-lt p2, v5, :cond_7

    const/16 v5, 0x10

    if-gt p2, v5, :cond_7

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 485
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 486
    add-int/lit8 v3, p2, -0x8

    .line 487
    .local v3, "selected":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$26(Lcom/aor/droidedit/DroidEditActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 488
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, v3, v7}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    goto :goto_0

    .line 493
    .end local v3    # "selected":I
    :cond_7
    const/16 v5, 0x52

    if-ne p2, v5, :cond_9

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, p3}, Lcom/aor/droidedit/DroidEditActivity;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 494
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_9

    .line 495
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 496
    .local v1, "prefs":Landroid/content/SharedPreferences;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xb

    if-lt v5, v8, :cond_8

    const-string/jumbo v5, "actionBar"

    invoke-interface {v1, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_9

    .line 497
    :cond_8
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v5, v5, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->toggle()V

    goto/16 :goto_0

    .line 503
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :cond_9
    if-ne p2, v9, :cond_a

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    if-nez v5, :cond_a

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_a

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v5

    if-nez v5, :cond_a

    .line 504
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 506
    :try_start_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, v6, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static {v5, v6, v8}, Lcom/aor/droidedit/DroidEditActivity;->access$34(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 507
    :catch_0
    move-exception v5

    goto/16 :goto_0

    .line 512
    :cond_a
    if-ne p2, v9, :cond_b

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_b

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v5

    if-nez v5, :cond_b

    .line 513
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 515
    :try_start_1
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, v6, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static {v5, v6, v8}, Lcom/aor/droidedit/DroidEditActivity;->access$35(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 516
    :catch_1
    move-exception v5

    goto/16 :goto_0

    .line 521
    :cond_b
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, p3}, Lcom/aor/droidedit/DroidEditActivity;->hasNoModifiers(Landroid/view/KeyEvent;)Z

    move-result v5

    if-eqz v5, :cond_c

    if-ne p2, v10, :cond_c

    .line 522
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 523
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$36(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 527
    :cond_c
    new-instance v5, Lcom/aor/droidedit/preferences/Shortcut;

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v8

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v9

    invoke-virtual {p3}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v10

    invoke-direct {v5, v8, v9, v10, p2}, Lcom/aor/droidedit/preferences/Shortcut;-><init>(ZZZI)V

    invoke-virtual {v5}, Lcom/aor/droidedit/preferences/Shortcut;->toCSV()Ljava/lang/String;

    move-result-object v4

    .line 529
    .local v4, "shortcut":Ljava/lang/String;
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_cut"

    const-string/jumbo v9, "1,0,0,52"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 530
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 531
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$37(Lcom/aor/droidedit/DroidEditActivity;)Z

    move-result v7

    goto/16 :goto_0

    .line 535
    :cond_d
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_copy"

    const-string/jumbo v9, "1,0,0,31"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 536
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 537
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$38(Lcom/aor/droidedit/DroidEditActivity;)Z

    move-result v7

    goto/16 :goto_0

    .line 541
    :cond_e
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_paste"

    const-string/jumbo v9, "1,0,0,50"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 542
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 543
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$39(Lcom/aor/droidedit/DroidEditActivity;)Z

    move-result v7

    goto/16 :goto_0

    .line 547
    :cond_f
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_expand"

    const-string/jumbo v9, "1,0,0,62"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 548
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 549
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->emmetExpand()V

    goto/16 :goto_0

    .line 553
    :cond_10
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_next_tab"

    const-string/jumbo v9, "1,0,0,61"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 554
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 555
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity$9;->nextTab()V

    goto/16 :goto_0

    .line 559
    :cond_11
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_prev_tab"

    const-string/jumbo v9, "1,1,0,61"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 560
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 561
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity$9;->prevTab()V

    goto/16 :goto_0

    .line 565
    :cond_12
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_select_all"

    const-string/jumbo v9, "1,0,0,29"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 566
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 567
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$40(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 571
    :cond_13
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_duplicate_line"

    const-string/jumbo v9, "1,0,0,32"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 572
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 573
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity$9;->duplicateLine()V

    goto/16 :goto_0

    .line 577
    :cond_14
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_delete_line"

    const-string/jumbo v9, "1,1,0,32"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 578
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 579
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity$9;->deleteLine()V

    goto/16 :goto_0

    .line 583
    :cond_15
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_line_start"

    const-string/jumbo v9, "1,0,0,45"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 584
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 585
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    invoke-direct {p0, v5}, Lcom/aor/droidedit/DroidEditActivity$9;->gotoBeginningOfLine(Z)V

    goto/16 :goto_0

    .line 589
    :cond_16
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_line_end"

    const-string/jumbo v9, "1,0,0,33"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 590
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 591
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    invoke-direct {p0, v5}, Lcom/aor/droidedit/DroidEditActivity$9;->gotoEndOfLine(Z)V

    goto/16 :goto_0

    .line 595
    :cond_17
    const/16 v5, 0x7a

    if-ne p2, v5, :cond_18

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 596
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 597
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    invoke-direct {p0, v5}, Lcom/aor/droidedit/DroidEditActivity$9;->gotoBeginningOfLine(Z)V

    goto/16 :goto_0

    .line 601
    :cond_18
    const/16 v5, 0x7b

    if-ne p2, v5, :cond_19

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_19

    .line 602
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 603
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v5

    invoke-direct {p0, v5}, Lcom/aor/droidedit/DroidEditActivity$9;->gotoEndOfLine(Z)V

    goto/16 :goto_0

    .line 607
    :cond_19
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_goto_line"

    const-string/jumbo v9, "1,0,0,40"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 608
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 609
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$41(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 613
    :cond_1a
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_new_file"

    const-string/jumbo v9, "1,0,0,42"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 614
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 615
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v6}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/aor/droidedit/DroidEditActivity;->access$42(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    goto/16 :goto_0

    .line 619
    :cond_1b
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_new_file_enc"

    const-string/jumbo v9, "1,1,0,42"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 620
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 621
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$43(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 625
    :cond_1c
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_save_file"

    const-string/jumbo v9, "1,0,0,47"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 626
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 627
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 628
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v5

    if-nez v5, :cond_1d

    .line 629
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v5, v6, v0, v11, v11}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    goto/16 :goto_0

    .line 631
    :cond_1d
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v8

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v9

    invoke-direct {v5, v6, v0, v8, v9}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    goto/16 :goto_0

    .line 636
    :cond_1e
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_save_file_as"

    const-string/jumbo v9, "1,1,0,47"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 637
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 638
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v5, v6, v0, v11, v11}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    goto/16 :goto_0

    .line 642
    :cond_1f
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_close_file"

    const-string/jumbo v9, "1,0,0,51"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    .line 643
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 644
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v6}, Lcom/aor/droidedit/DroidEditActivity;->access$44(Lcom/aor/droidedit/DroidEditActivity;)I

    move-result v6

    invoke-static {v5, v6}, Lcom/aor/droidedit/DroidEditActivity;->access$45(Lcom/aor/droidedit/DroidEditActivity;I)V

    goto/16 :goto_0

    .line 648
    :cond_20
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_open_file"

    const-string/jumbo v9, "1,0,0,43"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 649
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 650
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 651
    .restart local v1    # "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v5, "selectEncoding"

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 652
    .local v2, "selectEncoding":Z
    if-eqz v2, :cond_21

    .line 653
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v5, v6, v11}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    goto/16 :goto_0

    .line 654
    :cond_21
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v8}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v8

    invoke-virtual {v8}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v8

    invoke-direct {v5, v6, v8}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    goto/16 :goto_0

    .line 659
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    .end local v2    # "selectEncoding":Z
    :cond_22
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_open_file_enc"

    const-string/jumbo v9, "1,1,0,43"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 660
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 661
    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-direct {v5, v6, v11}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    goto/16 :goto_0

    .line 665
    :cond_23
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_find_menu"

    const-string/jumbo v9, "1,0,0,34"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 666
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 667
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$46(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 671
    :cond_24
    const/16 v5, 0x54

    if-ne p2, v5, :cond_25

    invoke-virtual {p0, p3}, Lcom/aor/droidedit/DroidEditActivity$9;->isCtrlPressed(Landroid/view/KeyEvent;)Z

    move-result v5

    if-nez v5, :cond_25

    .line 672
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 673
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$46(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 677
    :cond_25
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_undo"

    const-string/jumbo v9, "1,0,0,54"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    .line 678
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 679
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$47(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 683
    :cond_26
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_redo"

    const-string/jumbo v9, "1,0,0,53"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 684
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 685
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$48(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 689
    :cond_27
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_document_list"

    const-string/jumbo v9, "1,0,1,32"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 690
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 691
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$30(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/SlidingDrawer;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->animateToggle()V

    goto/16 :goto_0

    .line 695
    :cond_28
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_find_again"

    const-string/jumbo v9, "1,0,0,46"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 696
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 697
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v6}, Lcom/aor/droidedit/DroidEditActivity;->access$49(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ToggleButton;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v6

    invoke-static {v5, v6, v7}, Lcom/aor/droidedit/DroidEditActivity;->access$50(Lcom/aor/droidedit/DroidEditActivity;ZZ)Z

    goto/16 :goto_0

    .line 701
    :cond_29
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_exit"

    const-string/jumbo v9, "1,1,0,45"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 702
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 703
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$51(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 707
    :cond_2a
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_share_file"

    const-string/jumbo v9, "0,0,0,-1"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 708
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 709
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2b

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-nez v5, :cond_2b

    .line 710
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$52(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 711
    :cond_2b
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v9, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v5, v8, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 716
    :cond_2c
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_preview_browser"

    const-string/jumbo v9, "0,0,0,-1"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 717
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 718
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_30

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-nez v5, :cond_30

    .line 719
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_2e

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2e

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "html"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "htm"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 720
    :cond_2d
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$53(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 721
    :cond_2e
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v5

    if-nez v5, :cond_2f

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isFtp()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 722
    :cond_2f
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$53(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 723
    :cond_30
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v9, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v5, v8, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 728
    :cond_31
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_run_external"

    const-string/jumbo v9, "0,0,0,-1"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 729
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 730
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_32

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-nez v5, :cond_32

    .line 731
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 732
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-static {v5}, Lcom/aor/droidedit/DroidEditActivity;->access$54(Lcom/aor/droidedit/DroidEditActivity;)V

    goto/16 :goto_0

    .line 733
    :cond_32
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v9, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v5, v8, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 738
    :cond_33
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_run_sl4a_back"

    const-string/jumbo v9, "0,0,0,-1"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_35

    .line 739
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 740
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_34

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-nez v5, :cond_34

    .line 741
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 742
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, v6}, Lcom/aor/droidedit/DroidEditActivity;->runInSL4A(Z)V

    goto/16 :goto_0

    .line 743
    :cond_34
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v9, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v5, v8, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 748
    :cond_35
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->val$prefs:Landroid/content/SharedPreferences;

    const-string/jumbo v8, "shortcut_run_sl4a_term"

    const-string/jumbo v9, "0,0,0,-1"

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 749
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 750
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_36

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    if-nez v5, :cond_36

    .line 751
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 752
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5, v7}, Lcom/aor/droidedit/DroidEditActivity;->runInSL4A(Z)V

    goto/16 :goto_0

    .line 753
    :cond_36
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    invoke-virtual {v5}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity$9;->this$0:Lcom/aor/droidedit/DroidEditActivity;

    sget v9, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {v8, v9}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v5, v8, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_37
    move v7, v6

    .line 758
    goto/16 :goto_0
.end method
