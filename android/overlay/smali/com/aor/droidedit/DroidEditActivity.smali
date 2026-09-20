.class public abstract Lcom/aor/droidedit/DroidEditActivity;
.super Landroid/app/Activity;
.source "DroidEditActivity.java"

# interfaces
.implements Lcom/aor/droidedit/fs/tasks/ActionResumer;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/aor/droidedit/DroidEditActivity$Action;,
        Lcom/aor/droidedit/DroidEditActivity$DownloadPastebinAction;,
        Lcom/aor/droidedit/DroidEditActivity$GenericDrawerAction;,
        Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;,
        Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;,
        Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;,
        Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;,
        Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;
    }
.end annotation


# static fields
.field public static ACTION_OPEN:Ljava/lang/String;

.field private static AUTODELAY:I

.field private static LINECOUNTDELAY:I

.field private static SCROLLDELAY:I

.field public static STORE:Ljava/lang/String;

.field private static TYPEDELAY:I


# instance fields
.field private autoTextChange:Z

.field private closeFileButton:Landroid/widget/ImageView;

.field private currentDocument:I

.field private currentTheme:Lcom/aor/droidedit/theme/Theme;

.field private docFindAnim:Landroid/widget/ViewAnimator;

.field private documentList:Landroid/widget/ListView;

.field private documentListButton:Landroid/widget/ImageView;

.field private documentListDrawer:Landroid/widget/SlidingDrawer;

.field private editorHorizontalLayout:Landroid/widget/HorizontalScrollView;

.field private editorInnerLayout:Landroid/widget/LinearLayout;

.field private editorOuterLayout:Landroid/widget/FrameLayout;

.field private extraKeys:Z

.field private findButton:Landroid/widget/ImageButton;

.field private findText:Landroid/widget/EditText;

.field private footer:Landroid/widget/TextView;

.field private footerEncoding:Landroid/widget/TextView;

.field protected footerlayout:Landroid/widget/LinearLayout;

.field private highlightSize:I

.field private hlChange:Z

.field private hlEnd:I

.field private hlStart:I

.field private initialIntent:Landroid/content/Intent;

.field private keyboard:Landroid/inputmethodservice/KeyboardView;

.field protected keyboardLayout:Landroid/widget/LinearLayout;

.field private lastRedoState:Z

.field private lastSaveState:Z

.field private lastUndoState:Z

.field private lineDivider:Landroid/view/View;

.field private lineNumbers:Landroid/widget/EditText;

.field private mHandler:Landroid/os/Handler;

.field private mLeftDrawerManager:Lcom/aor/droidedit/filedialog/LeftDrawerManager;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mTextInfo:Z

.field protected mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

.field protected menuLayout:Landroid/widget/SlidingDrawer;

.field private navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

.field private newFileButton:Landroid/widget/ImageView;

.field private openDocuments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/aor/droidedit/document/Document;",
            ">;"
        }
    .end annotation
.end field

.field private openFileButton:Landroid/widget/ImageView;

.field private openFindButton:Landroid/widget/ImageView;

.field private previousLineCount:I

.field private previousMaxDigits:I

.field private redoButton:Landroid/widget/ImageView;

.field private replaceAllButton:Landroid/widget/ImageButton;

.field private replaceButton:Landroid/widget/ImageButton;

.field private replaceText:Landroid/widget/EditText;

.field private saveFileButton:Landroid/widget/ImageView;

.field protected scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

.field private settingsButton:Landroid/widget/ImageView;

.field shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

.field private shareButton:Landroid/widget/ImageView;

.field private syntaxHighlighting:Z

.field protected tabCharacter:Ljava/lang/String;

.field protected textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

.field private textInfo:Landroid/widget/TextView;

.field private textWrap:Z

.field private toggleIgnoreCase:Landroid/widget/ToggleButton;

.field private toggleRegularExpression:Landroid/widget/ToggleButton;

.field private toggleWrap:Landroid/widget/ToggleButton;

.field ulcTask:Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

.field private undoButton:Landroid/widget/ImageView;

.field private updateLineCount:Z

.field private updatingTabs:Z

.field private wasOpenedDrawer:Z


.field private compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x12c

    .line 184
    const/16 v0, 0x190

    sput v0, Lcom/aor/droidedit/DroidEditActivity;->TYPEDELAY:I

    .line 185
    sput v1, Lcom/aor/droidedit/DroidEditActivity;->LINECOUNTDELAY:I

    .line 186
    const/16 v0, 0x64

    sput v0, Lcom/aor/droidedit/DroidEditActivity;->SCROLLDELAY:I

    .line 187
    sput v1, Lcom/aor/droidedit/DroidEditActivity;->AUTODELAY:I

    .line 189
    const-string/jumbo v0, "market://details?id="

    sput-object v0, Lcom/aor/droidedit/DroidEditActivity;->STORE:Ljava/lang/String;

    .line 192
    const-string/jumbo v0, "action_open"

    sput-object v0, Lcom/aor/droidedit/DroidEditActivity;->ACTION_OPEN:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 183
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 196
    iput v2, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    .line 203
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    .line 204
    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    invoke-direct {v0, p0}, Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    .line 205
    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

    invoke-direct {v0, p0}, Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->ulcTask:Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

    .line 208
    iput v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 234
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->wasOpenedDrawer:Z

    .line 252
    iput v3, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    iput v3, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    .line 253
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->hlChange:Z

    .line 255
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->syntaxHighlighting:Z

    .line 261
    iput-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lastSaveState:Z

    .line 262
    iput-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lastRedoState:Z

    .line 263
    iput-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lastUndoState:Z

    .line 269
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->updatingTabs:Z

    .line 270
    iput v3, p0, Lcom/aor/droidedit/DroidEditActivity;->previousMaxDigits:I

    .line 183
    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/document/Document;
    .locals 1

    .prologue
    .line 2185
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mTextInfo:Z

    return v0
.end method

.method static synthetic access$10(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 260
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    return v0
.end method

.method static synthetic access$11(Lcom/aor/droidedit/DroidEditActivity;)I
    .locals 1

    .prologue
    .line 273
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->highlightSize:I

    return v0
.end method

.method static synthetic access$12(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 196
    iput p1, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    return-void
.end method

.method static synthetic access$13(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->updateLineCount:Z

    return v0
.end method

.method static synthetic access$14(Lcom/aor/droidedit/DroidEditActivity;ZI)V
    .locals 0

    .prologue
    .line 2264
    invoke-direct {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->changeLineNumbers(ZI)V

    return-void
.end method

.method static synthetic access$15(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$16(Lcom/aor/droidedit/DroidEditActivity;)I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    return v0
.end method

.method static synthetic access$17(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/filedialog/LeftDrawerManager;
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mLeftDrawerManager:Lcom/aor/droidedit/filedialog/LeftDrawerManager;

    return-object v0
.end method

.method static synthetic access$18(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 1207
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->premiumFeature(I)V

    return-void
.end method

.method static synthetic access$19(Lcom/aor/droidedit/DroidEditActivity;ZII)V
    .locals 0

    .prologue
    .line 1478
    invoke-direct {p0, p1, p2, p3}, Lcom/aor/droidedit/DroidEditActivity;->updateProgress(ZII)V

    return-void
.end method

.method static synthetic access$2(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$20(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;)I
    .locals 1

    .prologue
    .line 2859
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->genericAlreadyOpen(Lcom/aor/droidedit/fs/implementation/FSFile;)I

    move-result v0

    return v0
.end method

.method static synthetic access$21(Lcom/aor/droidedit/DroidEditActivity;I)Lcom/aor/droidedit/document/Document;
    .locals 1

    .prologue
    .line 2191
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->getDocument(I)Lcom/aor/droidedit/document/Document;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$22(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$23(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2806
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V

    return-void
.end method

.method static synthetic access$24(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1725
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSpellCheckerState()V

    return-void
.end method

.method static synthetic access$25(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;)V
    .locals 0

    .prologue
    .line 2874
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->removeDocumentsWithPath(Lcom/aor/droidedit/document/Document;)V

    return-void
.end method

.method static synthetic access$26(Lcom/aor/droidedit/DroidEditActivity;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$27(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ProgressBar;
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$28(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1973
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustOpenedDrawer()V

    return-void
.end method

.method static synthetic access$29(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1989
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustClosedDrawer()V

    return-void
.end method

.method static synthetic access$3(Lcom/aor/droidedit/DroidEditActivity;)Lcom/aor/droidedit/theme/Theme;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    return-object v0
.end method

.method static synthetic access$30(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/SlidingDrawer;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    return-object v0
.end method

.method static synthetic access$31(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ViewAnimator;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    return-object v0
.end method

.method static synthetic access$32(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2345
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateReplaceState()V

    return-void
.end method

.method static synthetic access$33(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    return v0
.end method

.method static synthetic access$34(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1129
    invoke-direct {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->insertTabRight(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$35(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1107
    invoke-direct {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->insertTabLeft(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$36(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2415
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->insertEnter()V

    return-void
.end method

.method static synthetic access$37(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 1161
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->cutText()Z

    move-result v0

    return v0
.end method

.method static synthetic access$38(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 1178
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->copyText()Z

    move-result v0

    return v0
.end method

.method static synthetic access$39(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 1193
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->pasteText()Z

    move-result v0

    return v0
.end method

.method static synthetic access$4(Lcom/aor/droidedit/DroidEditActivity;)I
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    return v0
.end method

.method static synthetic access$40(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1157
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->selectAll()V

    return-void
.end method

.method static synthetic access$41(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2063
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openGotoLineDialog()V

    return-void
.end method

.method static synthetic access$42(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V
    .locals 0

    .prologue
    .line 2389
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->executeNewDocumentAction(Lcom/aor/droidedit/document/Encoding;)V

    return-void
.end method

.method static synthetic access$43(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2399
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeNewDocumentEncodingAction()V

    return-void
.end method

.method static synthetic access$44(Lcom/aor/droidedit/DroidEditActivity;)I
    .locals 1

    .prologue
    .line 208
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    return v0
.end method

.method static synthetic access$45(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 2195
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->closeDocument(I)V

    return-void
.end method

.method static synthetic access$46(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2145
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openFindDialog()V

    return-void
.end method

.method static synthetic access$47(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2429
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeUndoAction()V

    return-void
.end method

.method static synthetic access$48(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2452
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeRedoAction()V

    return-void
.end method

.method static synthetic access$49(Lcom/aor/droidedit/DroidEditActivity;)Landroid/widget/ToggleButton;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleWrap:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$5(Lcom/aor/droidedit/DroidEditActivity;)I
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    return v0
.end method

.method static synthetic access$50(Lcom/aor/droidedit/DroidEditActivity;ZZ)Z
    .locals 1

    .prologue
    .line 2319
    invoke-direct {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->executeFindWrapAction(ZZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$51(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1743
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->exit()V

    return-void
.end method

.method static synthetic access$52(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1470
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->shareDocument()V

    return-void
.end method

.method static synthetic access$53(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1370
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openInBrowser()V

    return-void
.end method

.method static synthetic access$54(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1310
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->runExternalCommand()V

    return-void
.end method

.method static synthetic access$55(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1961
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openPreferenceScreen()V

    return-void
.end method

.method static synthetic access$56(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2368
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeReplaceAction()V

    return-void
.end method

.method static synthetic access$57(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 2373
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeReplaceAllAction()V

    return-void
.end method

.method static synthetic access$58(Lcom/aor/droidedit/DroidEditActivity;)V
    .locals 0

    .prologue
    .line 1220
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->runShareCommand()V

    return-void
.end method

.method static synthetic access$59(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 1148
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->isVisibleSoftKeyboard()Z

    move-result v0

    return v0
.end method

.method static synthetic access$6(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 253
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlChange:Z

    return v0
.end method

.method static synthetic access$60(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1332
    invoke-direct {p0, p1, p2, p3}, Lcom/aor/droidedit/DroidEditActivity;->completeCommand(Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$61(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1855
    invoke-direct {p0, p1, p2, p3}, Lcom/aor/droidedit/DroidEditActivity;->gitCommitFiles(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$62(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1841
    invoke-direct {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->gitPush(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$63(Lcom/aor/droidedit/DroidEditActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1826
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->gitPull(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$64(Lcom/aor/droidedit/DroidEditActivity;Z)V
    .locals 0

    .prologue
    .line 2013
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->adjustWrappedTextEditor(Z)V

    return-void
.end method

.method static synthetic access$65(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 2135
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->gotoLine(I)V

    return-void
.end method

.method static synthetic access$66(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 2207
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->reallyCloseDocument(I)V

    return-void
.end method

.method static synthetic access$67(Lcom/aor/droidedit/DroidEditActivity;)Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->updatingTabs:Z

    return v0
.end method

.method static synthetic access$7(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 252
    iput p1, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    return-void
.end method

.method static synthetic access$8(Lcom/aor/droidedit/DroidEditActivity;I)V
    .locals 0

    .prologue
    .line 252
    iput p1, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    return-void
.end method

.method static synthetic access$9(Lcom/aor/droidedit/DroidEditActivity;Z)V
    .locals 0

    .prologue
    .line 253
    iput-boolean p1, p0, Lcom/aor/droidedit/DroidEditActivity;->hlChange:Z

    return-void
.end method

.method private adjustClosedDrawer()V
    .locals 7

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 1990
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1991
    .local v2, "prefs":Landroid/content/SharedPreferences;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v5, v6, :cond_4

    const-string/jumbo v5, "actionBar"

    invoke-interface {v2, v5, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string/jumbo v5, "hideDocumentList"

    invoke-interface {v2, v5, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1992
    .local v0, "hideDocumentList":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 1993
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 1995
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListButton:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    .line 1996
    .local v3, "width":I
    if-eqz v0, :cond_1

    const/4 v3, 0x0

    .line 1998
    :cond_1
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 1999
    .local v1, "lp1":Landroid/widget/FrameLayout$LayoutParams;
    iget v5, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v1, v4, v4, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2000
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 2002
    iget-boolean v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    if-eqz v5, :cond_2

    .line 2003
    invoke-direct {p0, v4}, Lcom/aor/droidedit/DroidEditActivity;->adjustWrappedTextEditor(Z)V

    .line 2005
    :cond_2
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListButton:Landroid/widget/ImageView;

    sget v6, Lcom/aor/droidedit/lib/R$drawable;->open_drawer:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2006
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    invoke-virtual {v5, v4}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 2009
    :try_start_0
    iget-boolean v4, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    invoke-virtual {v4}, Landroid/inputmethodservice/KeyboardView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-nez v4, :cond_3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2011
    :cond_3
    :goto_1
    return-void

    .end local v0    # "hideDocumentList":Z
    .end local v1    # "lp1":Landroid/widget/FrameLayout$LayoutParams;
    .end local v3    # "width":I
    :cond_4
    move v0, v4

    .line 1991
    goto :goto_0

    .line 2010
    .restart local v0    # "hideDocumentList":Z
    .restart local v1    # "lp1":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v3    # "width":I
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method private adjustOpenedDrawer()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1974
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 1975
    .local v0, "lp1":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v1}, Landroid/widget/SlidingDrawer;->getWidth()I

    move-result v1

    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 1976
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 1979
    :try_start_0
    iget-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    invoke-virtual {v1}, Landroid/inputmethodservice/KeyboardView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    if-ne v1, v2, :cond_0

    .line 1980
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1983
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    if-eqz v1, :cond_1

    .line 1984
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->adjustWrappedTextEditor(Z)V

    .line 1986
    :cond_1
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListButton:Landroid/widget/ImageView;

    sget v2, Lcom/aor/droidedit/lib/R$drawable;->close_drawer:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1987
    return-void

    .line 1981
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private adjustWrappedTextEditor(Z)V
    .locals 3
    .param p1, "openedDrawer"    # Z

    .prologue
    .line 2014
    if-eqz p1, :cond_0

    .line 2015
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->editorInnerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setMaxWidth(I)V

    .line 2018
    :goto_0
    return-void

    .line 2017
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->editorInnerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v2}, Landroid/widget/SlidingDrawer;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setMaxWidth(I)V

    goto :goto_0
.end method

.method private changeFont(Ljava/lang/String;)V
    .locals 5
    .param p1, "fontSize"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0xc

    const/4 v3, 0x2

    .line 2247
    const/16 v1, 0xa

    :try_start_0
    invoke-static {p1, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v2, 0x3c

    if-le v1, v2, :cond_0

    .line 2248
    const-string/jumbo p1, "60"

    .line 2249
    :cond_0
    const/16 v1, 0xa

    invoke-static {p1, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x4

    if-ge v1, v2, :cond_1

    .line 2250
    const-string/jumbo p1, "4"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2255
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-static {p1, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v3, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setTextSize(IF)V

    .line 2256
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-static {p1, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 2257
    const/4 v1, 0x0

    iput v1, p0, Lcom/aor/droidedit/DroidEditActivity;->previousMaxDigits:I

    .line 2258
    return-void

    .line 2251
    :catch_0
    move-exception v0

    .line 2252
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo p1, "12"

    goto :goto_0
.end method

.method private changeLineNumbers(ZI)V
    .locals 8
    .param p1, "updateLineCount"    # Z
    .param p2, "nd"    # I

    .prologue
    const/16 v6, 0x8

    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 2265
    if-eqz p1, :cond_0

    iget v4, p0, Lcom/aor/droidedit/DroidEditActivity;->previousMaxDigits:I

    if-ne p2, v4, :cond_0

    .line 2291
    :goto_0
    return-void

    .line 2268
    :cond_0
    iput-boolean p1, p0, Lcom/aor/droidedit/DroidEditActivity;->updateLineCount:Z

    .line 2270
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 2271
    .local v2, "lp1":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 2273
    .local v3, "lp2":Landroid/widget/LinearLayout$LayoutParams;
    if-nez p1, :cond_1

    .line 2274
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setVisibility(I)V

    .line 2275
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 2276
    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 2277
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 2278
    iput v5, p0, Lcom/aor/droidedit/DroidEditActivity;->previousMaxDigits:I

    .line 2289
    :goto_1
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->requestLayout()V

    .line 2290
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    goto :goto_0

    .line 2280
    :cond_1
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setVisibility(I)V

    .line 2281
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 2282
    const-string/jumbo v0, ""

    .line 2283
    .local v0, "digits":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-lt v1, p2, :cond_2

    .line 2285
    iput p2, p0, Lcom/aor/droidedit/DroidEditActivity;->previousMaxDigits:I

    .line 2286
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    invoke-static {v7, v5, v6}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v5

    float-to-int v5, v5

    add-int/2addr v4, v5

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 2287
    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    goto :goto_1

    .line 2284
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "9"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2283
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private changeSyntax()V
    .locals 4

    .prologue
    .line 2090
    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->getSyntaxTypes(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v1

    .line 2091
    .local v1, "types":[Ljava/lang/String;
    invoke-static {p0}, Lcom/aor/droidedit/theme/Theme;->getSyntaxNames(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 2092
    .local v0, "names":[Ljava/lang/String;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/aor/droidedit/lib/R$string;->syntax_change:I

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$56;

    invoke-direct {v3, p0, v1, v0}, Lcom/aor/droidedit/DroidEditActivity$56;-><init>(Lcom/aor/droidedit/DroidEditActivity;[Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 2132
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2133
    return-void
.end method

.method private changeSyntaxHighlighting(Z)V
    .locals 0
    .param p1, "syntaxHighlighting"    # Z

    .prologue
    .line 2261
    iput-boolean p1, p0, Lcom/aor/droidedit/DroidEditActivity;->syntaxHighlighting:Z

    .line 2262
    return-void
.end method

.method private changeTheme(Ljava/lang/String;)V
    .locals 3
    .param p1, "themeId"    # Ljava/lang/String;

    .prologue
    .line 2229
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/aor/droidedit/theme/Theme;->getTheme(ILandroid/content/Context;)Lcom/aor/droidedit/theme/Theme;

    move-result-object v1

    iput-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    .line 2231
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v1}, Lcom/aor/droidedit/theme/Theme;->getDefaultStyle()Lcom/aor/droidedit/theme/Style;

    move-result-object v0

    .line 2233
    .local v0, "style":Lcom/aor/droidedit/theme/Style;
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->editorInnerLayout:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 2234
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 2236
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setBackgroundColor(I)V

    .line 2237
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 2238
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setTextColor(I)V

    .line 2239
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 2240
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    invoke-virtual {v0}, Lcom/aor/droidedit/theme/Style;->getForeground()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 2242
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentTheme:Lcom/aor/droidedit/theme/Theme;

    invoke-virtual {v2}, Lcom/aor/droidedit/theme/Theme;->getBackground()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getInverseColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setBracketSpanColor(I)V

    .line 2243
    return-void
.end method

.method private checkAction(Landroid/view/Menu;IZ)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "id"    # I
    .param p3, "check"    # Z

    .prologue
    .line 1516
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1517
    .local v0, "item":Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1518
    :cond_0
    return-void
.end method

.method private closeDocument(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 2196
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->getDocument(I)Lcom/aor/droidedit/document/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2197
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x1080027

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->file_management_close_file:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->file_management_close_file_warning:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->file_management_close_file:I

    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$58;

    invoke-direct {v2, p0, p1}, Lcom/aor/droidedit/DroidEditActivity$58;-><init>(Lcom/aor/droidedit/DroidEditActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2202
    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2204
    :goto_0
    return-void

    .line 2203
    :cond_0
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->reallyCloseDocument(I)V

    goto :goto_0
.end method

.method private completeCommand(Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "document"    # Lcom/aor/droidedit/document/Document;
    .param p2, "command"    # Ljava/lang/String;
    .param p3, "action"    # Ljava/lang/String;

    .prologue
    .line 1334
    :try_start_0
    const-string/jumbo v0, "\\$\\{([a-zA-Z0-9_]+)\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    .line 1335
    .local v8, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v8, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 1336
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1337
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 1338
    .local v6, "match":Ljava/lang/String;
    const-string/jumbo v0, "file"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1339
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/aor/droidedit/DroidEditActivity;->completeCommand(Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    .line 1368
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    .end local v6    # "match":Ljava/lang/String;
    .end local v8    # "pattern":Ljava/util/regex/Pattern;
    :cond_0
    :goto_0
    return-void

    .line 1340
    .restart local v3    # "matcher":Ljava/util/regex/Matcher;
    .restart local v6    # "match":Ljava/lang/String;
    .restart local v8    # "pattern":Ljava/util/regex/Pattern;
    :cond_1
    const-string/jumbo v0, "name"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1341
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getNameNoExtension()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/aor/droidedit/DroidEditActivity;->completeCommand(Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1366
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    .end local v6    # "match":Ljava/lang/String;
    .end local v8    # "pattern":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v0

    goto :goto_0

    .line 1342
    .restart local v3    # "matcher":Ljava/util/regex/Matcher;
    .restart local v6    # "match":Ljava/lang/String;
    .restart local v8    # "pattern":Ljava/util/regex/Pattern;
    :cond_2
    const-string/jumbo v0, "path"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1343
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0x2f

    invoke-virtual {v2, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/aor/droidedit/DroidEditActivity;->completeCommand(Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1345
    :cond_3
    new-instance v4, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1346
    .local v4, "valueText":Landroid/widget/EditText;
    const/4 v0, 0x1

    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 1347
    sget v0, Lcom/aor/droidedit/lib/R$string;->external_value_for:I

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v7

    .line 1348
    .local v7, "message":Ljava/lang/CharSequence;
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\\$token\\$"

    const-string/jumbo v2, "_"

    const-string/jumbo v5, " "

    invoke-virtual {v6, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1349
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->external_insert_token:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    sget v10, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$41;

    move-object v1, p0

    move-object v2, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/aor/droidedit/DroidEditActivity$41;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Ljava/util/regex/Matcher;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {v9, v10, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1354
    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 1357
    .end local v4    # "valueText":Landroid/widget/EditText;
    .end local v6    # "match":Ljava/lang/String;
    .end local v7    # "message":Ljava/lang/CharSequence;
    :cond_4
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1358
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    if-eqz v0, :cond_5

    .line 1359
    new-instance v0, Lcom/aor/droidedit/fs/tasks/RunExternalTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/aor/droidedit/fs/tasks/RunExternalTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/tasks/RunExternalTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 1360
    :cond_5
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/root/RootFileSystem;

    if-eqz v0, :cond_6

    .line 1361
    new-instance v0, Lcom/aor/droidedit/fs/tasks/RunRootTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/aor/droidedit/fs/tasks/RunRootTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/tasks/RunRootTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 1362
    :cond_6
    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    instance-of v0, v0, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;

    if-eqz v0, :cond_0

    .line 1363
    new-instance v0, Lcom/aor/droidedit/fs/tasks/RunLocalTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/aor/droidedit/fs/tasks/RunLocalTask;-><init>(Landroid/content/Context;Lcom/aor/droidedit/document/Document;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/fs/tasks/RunLocalTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0
.end method

.method private copyText()Z
    .locals 6

    .prologue
    .line 1180
    :try_start_0
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    if-eq v4, v5, :cond_0

    .line 1181
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1182
    .local v3, "start":I
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1184
    .local v2, "end":I
    const-string/jumbo v4, "clipboard"

    invoke-virtual {p0, v4}, Lcom/aor/droidedit/DroidEditActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1185
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1190
    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    .end local v2    # "end":I
    .end local v3    # "start":I
    :cond_0
    const/4 v4, 0x1

    :goto_0
    return v4

    .line 1187
    :catch_0
    move-exception v1

    .line 1188
    .local v1, "e":Ljava/lang/NullPointerException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private createShortcut()V
    .locals 11

    .prologue
    .line 1440
    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    .line 1442
    .local v2, "document":Lcom/aor/droidedit/document/Document;
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 1443
    .local v7, "shortcutIntent":Landroid/content/Intent;
    new-instance v8, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1445
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1446
    .local v1, "bosFile":Ljava/io/ByteArrayOutputStream;
    new-instance v5, Ljava/io/ObjectOutputStream;

    invoke-direct {v5, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1447
    .local v5, "outFile":Ljava/io/ObjectOutput;
    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 1448
    const-string/jumbo v8, "file"

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    invoke-static {v9}, Lcom/aor/droidedit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1450
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1451
    .local v0, "bosEncoding":Ljava/io/ByteArrayOutputStream;
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1452
    .local v4, "outEncoding":Ljava/io/ObjectOutput;
    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getEncoding()Lcom/aor/droidedit/document/Encoding;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 1453
    const-string/jumbo v8, "encoding"

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    invoke-static {v9}, Lcom/aor/droidedit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1455
    const-string/jumbo v8, "shortcut"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1457
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 1458
    .local v6, "putShortCutIntent":Landroid/content/Intent;
    const-string/jumbo v8, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1460
    const-string/jumbo v8, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1461
    const-string/jumbo v8, "android.intent.extra.shortcut.ICON_RESOURCE"

    sget v9, Lcom/aor/droidedit/lib/R$drawable;->ic_file:I

    invoke-static {p0, v9}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1462
    const-string/jumbo v8, "com.android.launcher.action.INSTALL_SHORTCUT"

    invoke-virtual {v6, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1463
    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1468
    .end local v0    # "bosEncoding":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "bosFile":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "document":Lcom/aor/droidedit/document/Document;
    .end local v4    # "outEncoding":Ljava/io/ObjectOutput;
    .end local v5    # "outFile":Ljava/io/ObjectOutput;
    .end local v6    # "putShortCutIntent":Landroid/content/Intent;
    .end local v7    # "shortcutIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1464
    :catch_0
    move-exception v3

    .line 1465
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Lcom/aor/droidedit/lib/R$string;->error_creating_shortcut:I

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 1466
    const-string/jumbo v8, "DroidEdit"

    const-string/jumbo v9, ""

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private cutText()Z
    .locals 6

    .prologue
    .line 1163
    :try_start_0
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    if-eq v4, v5, :cond_0

    .line 1164
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1165
    .local v3, "start":I
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1167
    .local v2, "end":I
    const-string/jumbo v4, "clipboard"

    invoke-virtual {p0, v4}, Lcom/aor/droidedit/DroidEditActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1168
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1170
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4, v3, v2}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1175
    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    .end local v2    # "end":I
    .end local v3    # "start":I
    :cond_0
    const/4 v4, 0x1

    :goto_0
    return v4

    .line 1172
    :catch_0
    move-exception v1

    .line 1173
    .local v1, "e":Ljava/lang/NullPointerException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private enableAction(Landroid/view/Menu;IZ)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "id"    # I
    .param p3, "enable"    # Z

    .prologue
    .line 1507
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 1508
    .local v1, "item":Landroid/view/MenuItem;
    if-eqz v1, :cond_0

    .line 1509
    invoke-interface {v1, p3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 1510
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1511
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    if-eqz p3, :cond_1

    const/16 v2, 0xff

    :goto_0
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1513
    .end local v0    # "icon":Landroid/graphics/drawable/Drawable;
    :cond_0
    return-void

    .line 1511
    .restart local v0    # "icon":Landroid/graphics/drawable/Drawable;
    :cond_1
    const/16 v2, 0x60

    goto :goto_0
.end method

.method private executeFindAction()Z
    .locals 8

    .prologue
    .line 2294
    const/16 v2, 0x8

    .line 2296
    .local v2, "flags":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    invoke-virtual {v5}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2297
    or-int/lit8 v2, v2, 0x2

    .line 2298
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleRegularExpression:Landroid/widget/ToggleButton;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleRegularExpression:Landroid/widget/ToggleButton;

    invoke-virtual {v5}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2299
    or-int/lit8 v2, v2, 0x10

    .line 2302
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v1

    .line 2304
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 2306
    .local v4, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 2308
    .local v3, "matcher":Ljava/util/regex/Matcher;
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v0

    .line 2309
    .local v0, "currentPos":I
    invoke-virtual {v3, v0}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2310
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    .line 2311
    const/4 v5, 0x1

    .line 2316
    .end local v0    # "currentPos":I
    .end local v1    # "document":Lcom/aor/droidedit/document/Document;
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    .end local v4    # "pattern":Ljava/util/regex/Pattern;
    :goto_0
    return v5

    .line 2313
    .restart local v0    # "currentPos":I
    .restart local v1    # "document":Lcom/aor/droidedit/document/Document;
    .restart local v3    # "matcher":Ljava/util/regex/Matcher;
    .restart local v4    # "pattern":Ljava/util/regex/Pattern;
    :cond_2
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2316
    .end local v0    # "currentPos":I
    .end local v1    # "document":Lcom/aor/droidedit/document/Document;
    .end local v3    # "matcher":Ljava/util/regex/Matcher;
    .end local v4    # "pattern":Ljava/util/regex/Pattern;
    :goto_1
    const/4 v5, 0x0

    goto :goto_0

    .line 2314
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private executeFindWrapAction(ZZ)Z
    .locals 6
    .param p1, "wrap"    # Z
    .param p2, "toast"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2320
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2321
    .local v2, "toFind":Ljava/lang/String;
    const-string/jumbo v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2342
    :cond_0
    :goto_0
    return v3

    .line 2323
    :cond_1
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeFindAction()Z

    move-result v5

    if-nez v5, :cond_4

    .line 2324
    if-eqz p1, :cond_3

    .line 2325
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v1

    .line 2326
    .local v1, "selStart":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v0

    .line 2327
    .local v0, "selEnd":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5, v3}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 2328
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeFindAction()Z

    move-result v5

    if-nez v5, :cond_2

    .line 2329
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4, v1, v0}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    .line 2330
    if-eqz p2, :cond_0

    .line 2331
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/aor/droidedit/lib/R$string;->generic_not_found:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2333
    :cond_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->requestFocus()Z

    move v3, v4

    .line 2334
    goto :goto_0

    .line 2336
    .end local v0    # "selEnd":I
    .end local v1    # "selStart":I
    :cond_3
    if-eqz p2, :cond_0

    .line 2337
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/aor/droidedit/lib/R$string;->generic_not_found:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2339
    :cond_4
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->requestFocus()Z

    move v3, v4

    .line 2340
    goto :goto_0
.end method

.method private executeNewDocumentAction(Lcom/aor/droidedit/document/Encoding;)V
    .locals 5
    .param p1, "encoding"    # Lcom/aor/droidedit/document/Encoding;

    .prologue
    .line 2390
    new-instance v1, Lcom/aor/droidedit/document/Document;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/aor/droidedit/document/Document;-><init>(Landroid/content/Context;)V

    .line 2391
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v1, p1}, Lcom/aor/droidedit/document/Document;->setEncoding(Lcom/aor/droidedit/document/Encoding;)V

    .line 2392
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 2393
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 2394
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 2395
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->file_management_new_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2396
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->notifyDocumentListChanged()V

    .line 2397
    return-void
.end method

.method private executeNewDocumentEncodingAction()V
    .locals 5

    .prologue
    .line 2400
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v1

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v0

    .line 2401
    .local v0, "selected":Lcom/aor/droidedit/document/Encoding;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/aor/droidedit/lib/R$string;->file_management_select_encoding:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget-object v2, Lcom/aor/droidedit/document/Encoding;->encodings:[Lcom/aor/droidedit/document/Encoding;

    const/4 v3, 0x0

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$59;

    invoke-direct {v4, p0, v0}, Lcom/aor/droidedit/DroidEditActivity$59;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v1, v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2405
    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$60;

    invoke-direct {v3, p0, v0}, Lcom/aor/droidedit/DroidEditActivity$60;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2409
    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$61;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$61;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2412
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 2413
    return-void
.end method

.method private executeRedoAction()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2453
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v1

    .line 2454
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->canRedo()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2456
    :try_start_0
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->redo()Lcom/aor/droidedit/document/Change;

    move-result-object v0

    .line 2457
    .local v0, "change":Lcom/aor/droidedit/document/Change;
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2458
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v4

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getOldText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getNewText()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 2459
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2460
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getSelectionStart()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2469
    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    :goto_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSaveState()V

    .line 2471
    :cond_0
    return-void

    .line 2461
    :catch_0
    move-exception v2

    .line 2462
    .local v2, "e":Ljava/lang/Exception;
    iput-boolean v8, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2463
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 2464
    iput-boolean v7, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2466
    :try_start_1
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getSelectionStart()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 2467
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method private executeReplaceAction()V
    .locals 4

    .prologue
    .line 2369
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v2

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 2370
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleWrap:Landroid/widget/ToggleButton;

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->executeFindWrapAction(ZZ)Z

    .line 2371
    return-void
.end method

.method private executeReplaceAllAction()V
    .locals 5

    .prologue
    .line 2375
    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 2377
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    invoke-virtual {v3}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2378
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xa

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 2381
    .local v2, "pattern":Ljava/util/regex/Pattern;
    :goto_0
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 2382
    .local v1, "matcher":Ljava/util/regex/Matcher;
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 2383
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 2386
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    .end local v2    # "pattern":Ljava/util/regex/Pattern;
    :goto_1
    return-void

    .line 2379
    .restart local v0    # "document":Lcom/aor/droidedit/document/Document;
    :cond_0
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .restart local v2    # "pattern":Ljava/util/regex/Pattern;
    goto :goto_0

    .line 2384
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v2    # "pattern":Ljava/util/regex/Pattern;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private executeUndoAction()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2430
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v1

    .line 2431
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->canUndo()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2433
    :try_start_0
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->undo()Lcom/aor/droidedit/document/Change;

    move-result-object v0

    .line 2434
    .local v0, "change":Lcom/aor/droidedit/document/Change;
    if-eqz v0, :cond_0

    .line 2435
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2436
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v4

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getStart()I

    move-result v5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getNewText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Change;->getOldText()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 2437
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2438
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getSelectionStart()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2448
    .end local v0    # "change":Lcom/aor/droidedit/document/Change;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSaveState()V

    .line 2450
    :cond_1
    return-void

    .line 2440
    :catch_0
    move-exception v2

    .line 2441
    .local v2, "e":Ljava/lang/Exception;
    iput-boolean v8, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2442
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 2443
    iput-boolean v7, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2445
    :try_start_1
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getSelectionStart()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 2446
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method private exit()V
    .locals 5

    .prologue
    .line 1744
    const/4 v1, 0x0

    .line 1745
    .local v1, "hasChangedDocuments":Z
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1750
    :goto_0
    if-eqz v1, :cond_2

    .line 1751
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/aor/droidedit/lib/R$string;->exit_really:I

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->exit_really_msg:I

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->exit:I

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$46;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$46;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 1758
    sget v3, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1763
    :goto_1
    return-void

    .line 1745
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/document/Document;

    .line 1746
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1747
    const/4 v1, 0x1

    .line 1748
    goto :goto_0

    .line 1760
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    :cond_2
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V

    .line 1761
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->finish()V

    goto :goto_1
.end method

.method private genericAlreadyOpen(Lcom/aor/droidedit/fs/implementation/FSFile;)I
    .locals 5
    .param p1, "file"    # Lcom/aor/droidedit/fs/implementation/FSFile;

    .prologue
    .line 2860
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2871
    const/4 v2, -0x1

    :goto_1
    return v2

    .line 2860
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/aor/droidedit/document/Document;

    .line 2861
    .local v1, "od":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 2863
    :try_start_0
    invoke-virtual {p1}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v4

    invoke-virtual {v4}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2864
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_1

    .line 2866
    :catch_0
    move-exception v0

    .line 2867
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "DroidEdit"

    const-string/jumbo v4, ""

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private getCurrentDocument()Lcom/aor/droidedit/document/Document;
    .locals 2

    .prologue
    .line 2186
    :goto_0
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 2188
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    iget v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/document/Document;

    return-object v0

    .line 2187
    :cond_0
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    goto :goto_0
.end method

.method private getDocument(I)Lcom/aor/droidedit/document/Document;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 2192
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/document/Document;

    return-object v0
.end method

.method private getInverseColor(I)I
    .locals 4
    .param p1, "background"    # I

    .prologue
    .line 2660
    const/16 v0, 0x80

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    rsub-int v1, v1, 0xff

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    rsub-int v2, v2, 0xff

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    rsub-int v3, v3, 0xff

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0
.end method

.method private gitCommitFiles(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p1, "rootPath"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;

    .prologue
    .line 1856
    if-nez p1, :cond_0

    .line 1916
    :goto_0
    return-void

    .line 1857
    :cond_0
    invoke-static {p1}, Lcom/aor/droidedit/git/GitUtils;->getModifiedFiles(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/aor/droidedit/git/GitFileChange;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/aor/droidedit/git/GitFileChange;

    .line 1859
    .local v2, "files":[Lcom/aor/droidedit/git/GitFileChange;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    .line 1861
    array-length v1, v2

    const/4 v0, 0x0

    :goto_1
    if-lt v0, v1, :cond_1

    .line 1865
    new-instance v6, Lcom/aor/droidedit/git/GitChangeAdapter;

    invoke-direct {v6, p0, v2}, Lcom/aor/droidedit/git/GitChangeAdapter;-><init>(Landroid/content/Context;[Lcom/aor/droidedit/git/GitFileChange;)V

    .line 1867
    .local v6, "adapter":Lcom/aor/droidedit/git/GitChangeAdapter;
    sget v0, Lcom/aor/droidedit/lib/R$layout;->git_commit_view:I

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 1868
    .local v7, "commitView":Landroid/view/View;
    sget v0, Lcom/aor/droidedit/lib/R$id;->list:I

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ListView;

    .line 1869
    .local v10, "list":Landroid/widget/ListView;
    invoke-virtual {v10, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1871
    sget v0, Lcom/aor/droidedit/lib/R$id;->message:I

    invoke-virtual {v7, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 1873
    .local v5, "message":Landroid/widget/EditText;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1874
    sget v1, Lcom/aor/droidedit/lib/R$string;->action_bar_git_commit:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    .line 1875
    sget v12, Lcom/aor/droidedit/lib/R$string;->generic_commit:I

    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$50;

    move-object v1, p0

    move-object/from16 v3, p3

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/aor/droidedit/DroidEditActivity$50;-><init>(Lcom/aor/droidedit/DroidEditActivity;[Lcom/aor/droidedit/git/GitFileChange;Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v11, v12, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1895
    sget v1, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1896
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1897
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    .line 1899
    .local v8, "dialog":Landroid/app/AlertDialog;
    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$51;

    invoke-direct {v0, p0, v8}, Lcom/aor/droidedit/DroidEditActivity$51;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v5, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1914
    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 1915
    const/4 v0, -0x1

    invoke-virtual {v8, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1861
    .end local v5    # "message":Landroid/widget/EditText;
    .end local v6    # "adapter":Lcom/aor/droidedit/git/GitChangeAdapter;
    .end local v7    # "commitView":Landroid/view/View;
    .end local v8    # "dialog":Landroid/app/AlertDialog;
    .end local v10    # "list":Landroid/widget/ListView;
    :cond_1
    aget-object v9, v2, v0

    .line 1862
    .local v9, "gitFileChange":Lcom/aor/droidedit/git/GitFileChange;
    invoke-virtual {v9}, Lcom/aor/droidedit/git/GitFileChange;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1863
    const/4 v3, 0x1

    invoke-virtual {v9, v3}, Lcom/aor/droidedit/git/GitFileChange;->setSelected(Z)V

    .line 1861
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private gitPull(Ljava/lang/String;)V
    .locals 2
    .param p1, "repositoryId"    # Ljava/lang/String;

    .prologue
    .line 1827
    if-nez p1, :cond_0

    .line 1838
    :goto_0
    return-void

    .line 1829
    :cond_0
    new-instance v0, Lcom/aor/droidedit/git/GitPull;

    invoke-direct {v0, p0, p1}, Lcom/aor/droidedit/git/GitPull;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 1830
    .local v0, "pull":Lcom/aor/droidedit/git/GitPull;
    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$48;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/DroidEditActivity$48;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/git/GitPull;->addGitOperationListener(Lcom/aor/droidedit/git/GitOperationListener;)V

    .line 1837
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/git/GitPull;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private gitPush(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "localPath"    # Ljava/lang/String;
    .param p2, "repositoryId"    # Ljava/lang/String;

    .prologue
    .line 1842
    if-nez p1, :cond_0

    .line 1853
    :goto_0
    return-void

    .line 1844
    :cond_0
    new-instance v0, Lcom/aor/droidedit/git/GitPush;

    invoke-direct {v0, p0, p1, p2}, Lcom/aor/droidedit/git/GitPush;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 1845
    .local v0, "push":Lcom/aor/droidedit/git/GitPush;
    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$49;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/DroidEditActivity$49;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/git/GitPush;->addGitOperationListener(Lcom/aor/droidedit/git/GitOperationListener;)V

    .line 1852
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/git/GitPush;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private gotoLine(I)V
    .locals 5
    .param p1, "line"    # I

    .prologue
    .line 2136
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2137
    .local v3, "text":Ljava/lang/String;
    const-string/jumbo v4, "\\n"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 2138
    .local v1, "lines":[Ljava/lang/String;
    const/4 v2, 0x0

    .line 2139
    .local v2, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    if-ge v0, v4, :cond_0

    add-int/lit8 v4, v0, 0x1

    if-lt v4, p1, :cond_1

    .line 2142
    :cond_0
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 2143
    return-void

    .line 2140
    :cond_1
    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v2, v4

    .line 2139
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private initializeLeftDrawer()V
    .locals 6

    .prologue
    .line 1075
    sget v2, Lcom/aor/droidedit/lib/R$id;->filesystem_spinner:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 1076
    .local v1, "projectsSpinner":Landroid/widget/Spinner;
    invoke-static {p0}, Lcom/aor/droidedit/fs/implementation/FileSystem;->getFileSystems(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 1077
    .local v0, "fileSystems":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/fs/implementation/FileSystem;>;"
    new-instance v3, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;

    sget v4, Lcom/aor/droidedit/lib/R$layout;->item_row:I

    sget v5, Lcom/aor/droidedit/lib/R$id;->text1:I

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/aor/droidedit/fs/implementation/FileSystem;

    invoke-direct {v3, p0, v4, v5, v2}, Lcom/aor/droidedit/fs/adapter/FileSystemAdapter;-><init>(Landroid/content/Context;II[Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    invoke-virtual {v1, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1079
    new-instance v4, Lcom/aor/droidedit/filedialog/LeftDrawerManager;

    sget v2, Lcom/aor/droidedit/lib/R$id;->file_list:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/custom/PullToRefreshListView;

    sget v3, Lcom/aor/droidedit/lib/R$id;->home_folder:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    invoke-direct {v4, p0, v2, v3}, Lcom/aor/droidedit/filedialog/LeftDrawerManager;-><init>(Landroid/content/Context;Lcom/aor/droidedit/custom/PullToRefreshListView;Landroid/widget/ImageView;)V

    iput-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->mLeftDrawerManager:Lcom/aor/droidedit/filedialog/LeftDrawerManager;

    .line 1080
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->mLeftDrawerManager:Lcom/aor/droidedit/filedialog/LeftDrawerManager;

    new-instance v3, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;

    invoke-direct {v3}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;-><init>()V

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/filedialog/LeftDrawerManager;->setFileSystem(Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    .line 1082
    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$32;

    invoke-direct {v2, p0, v0}, Lcom/aor/droidedit/DroidEditActivity$32;-><init>(Lcom/aor/droidedit/DroidEditActivity;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1097
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->mLeftDrawerManager:Lcom/aor/droidedit/filedialog/LeftDrawerManager;

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$33;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$33;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/filedialog/LeftDrawerManager;->setOnFileSelectedListener(Lcom/aor/droidedit/filedialog/FileSelectedListener;)V

    .line 1105
    return-void
.end method

.method private insertColor()V
    .locals 2

    .prologue
    .line 1678
    new-instance v0, Lcom/aor/droidedit/util/ColorPickerDialog;

    invoke-direct {v0, p0}, Lcom/aor/droidedit/util/ColorPickerDialog;-><init>(Landroid/content/Context;)V

    .line 1679
    .local v0, "colorPicker":Lcom/aor/droidedit/util/ColorPickerDialog;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/util/ColorPickerDialog;->setShowOldColor(Z)V

    .line 1680
    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$44;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/DroidEditActivity$44;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/util/ColorPickerDialog;->setOnColorListener(Lcom/aor/droidedit/util/ColorPickerDialog$ColorSelectedListener;)V

    .line 1689
    invoke-virtual {v0}, Lcom/aor/droidedit/util/ColorPickerDialog;->show()V

    .line 1690
    return-void
.end method

.method private insertEnter()V
    .locals 9

    .prologue
    .line 2416
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 2417
    .local v4, "start":I
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2419
    .local v0, "end":I
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 2420
    .local v3, "previous":Ljava/lang/String;
    const/16 v6, 0xa

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 2421
    .local v1, "lastCR":I
    add-int/lit8 v1, v1, 0x1

    .line 2422
    const-string/jumbo v5, ""

    .line 2423
    .local v5, "tabs":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_0

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x9

    if-eq v6, v7, :cond_1

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-eq v6, v7, :cond_1

    .line 2426
    :cond_0
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\n"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v4, v0, v7}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 2427
    return-void

    .line 2424
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "lastCR":I
    .local v2, "lastCR":I
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move v1, v2

    .end local v2    # "lastCR":I
    .restart local v1    # "lastCR":I
    goto :goto_0
.end method

.method private insertTabLeft(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "tab"    # Ljava/lang/String;
    .param p2, "force"    # Z

    .prologue
    const/16 v5, 0xa

    .line 1108
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1109
    .local v1, "start":I
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1110
    .local v0, "end":I
    if-nez p2, :cond_0

    if-le v0, v1, :cond_6

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_6

    .line 1111
    :cond_0
    :goto_0
    if-lez v1, :cond_1

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    add-int/lit8 v4, v1, -0x1

    invoke-interface {v3, v4}, Landroid/text/Editable;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    .line 1113
    :cond_1
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1114
    .local v2, "text":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "\n"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 1115
    invoke-virtual {v2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1116
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 1117
    :cond_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0, v2}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 1118
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->requestLayout()V

    .line 1119
    if-eqz p2, :cond_5

    .line 1120
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 1127
    .end local v2    # "text":Ljava/lang/String;
    :cond_3
    :goto_1
    return-void

    .line 1112
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1122
    .restart local v2    # "text":Ljava/lang/String;
    :cond_5
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {v3, v1, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    goto :goto_1

    .line 1124
    .end local v2    # "text":Ljava/lang/String;
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_3

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v4, v1, v4

    invoke-interface {v3, v4, v1}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1125
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v4, v1, v4

    const-string/jumbo v5, ""

    invoke-interface {v3, v4, v1, v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_1
.end method

.method private insertTabRight(Ljava/lang/String;Z)V
    .locals 7
    .param p1, "tab"    # Ljava/lang/String;
    .param p2, "force"    # Z

    .prologue
    const/16 v5, 0xa

    .line 1130
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1131
    .local v1, "start":I
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v3

    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1132
    .local v0, "end":I
    if-nez p2, :cond_0

    if-le v0, v1, :cond_5

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_5

    .line 1133
    :cond_0
    :goto_0
    if-lez v1, :cond_1

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    add-int/lit8 v4, v1, -0x1

    invoke-interface {v3, v4}, Landroid/text/Editable;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_3

    .line 1135
    :cond_1
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1136
    .local v2, "text":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "\n"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\n"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1137
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "\n"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1138
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1139
    :cond_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0, v2}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 1140
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->requestLayout()V

    .line 1141
    if-eqz p2, :cond_4

    .line 1142
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V

    .line 1146
    .end local v2    # "text":Ljava/lang/String;
    :goto_1
    return-void

    .line 1134
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto/16 :goto_0

    .line 1144
    .restart local v2    # "text":Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {v3, v1, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(II)V

    goto :goto_1

    .line 1145
    .end local v2    # "text":Ljava/lang/String;
    :cond_5
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v1, v0, p1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_1
.end method

.method private isVisibleSoftKeyboard()Z
    .locals 5

    .prologue
    .line 1149
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 1150
    .local v1, "r":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 1152
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getRootView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 1153
    .local v2, "screenHeight":I
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    iget v4, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    sub-int v0, v2, v3

    .line 1154
    .local v0, "heightDiff":I
    div-int/lit8 v3, v2, 0x3

    if-le v0, v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private loadCurrentState()V
    .locals 4

    .prologue
    .line 2791
    :try_start_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "droidedit.tmp"

    invoke-static {v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->readObjectFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 2792
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v0, :cond_0

    .line 2793
    const-string/jumbo v1, "openDocuments"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    .line 2794
    const-string/jumbo v1, "currentDocument"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2795
    const-string/jumbo v1, "currentDocument"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2800
    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    if-nez v1, :cond_1

    .line 2801
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    .line 2802
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    new-instance v2, Lcom/aor/droidedit/document/Document;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/aor/droidedit/document/Document;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2804
    :cond_1
    return-void

    .line 2796
    .restart local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    const/4 v1, 0x0

    :try_start_1
    iput v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2798
    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private openFindDialog()V
    .locals 10

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 2146
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 2148
    .local v3, "prefs":Landroid/content/SharedPreferences;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xb

    if-lt v8, v9, :cond_3

    const-string/jumbo v8, "hideDocumentList"

    invoke-interface {v3, v8, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_3

    move v1, v6

    .line 2149
    .local v1, "hideDocumentList":Z
    :goto_0
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    invoke-virtual {v8}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v8

    if-nez v8, :cond_5

    .line 2150
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v8}, Landroid/widget/SlidingDrawer;->isOpened()Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v8}, Landroid/widget/SlidingDrawer;->getVisibility()I

    move-result v8

    if-nez v8, :cond_4

    move v8, v6

    :goto_1
    iput-boolean v8, p0, Lcom/aor/droidedit/DroidEditActivity;->wasOpenedDrawer:Z

    .line 2151
    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    invoke-virtual {v8, v6}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 2152
    iget-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->wasOpenedDrawer:Z

    if-nez v6, :cond_0

    .line 2153
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6}, Landroid/widget/SlidingDrawer;->animateOpen()V

    .line 2154
    :cond_0
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v7}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 2156
    const-string/jumbo v6, "find_tip_read"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_1

    .line 2157
    new-instance v2, Lcom/aor/droidedit/custom/MessageBarController;

    sget v6, Lcom/aor/droidedit/lib/R$id;->undobar:I

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$57;

    invoke-direct {v8, p0, v3}, Lcom/aor/droidedit/DroidEditActivity$57;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/content/SharedPreferences;)V

    invoke-direct {v2, v6, v8}, Lcom/aor/droidedit/custom/MessageBarController;-><init>(Landroid/view/View;Lcom/aor/droidedit/custom/MessageBarController$MessageListener;)V

    .line 2163
    .local v2, "mUndoBarController":Lcom/aor/droidedit/custom/MessageBarController;
    sget v6, Lcom/aor/droidedit/lib/R$string;->find_dialog_tip:I

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v7, v6}, Lcom/aor/droidedit/custom/MessageBarController;->showUndoBar(ZLjava/lang/CharSequence;)V

    .line 2175
    .end local v2    # "mUndoBarController":Lcom/aor/droidedit/custom/MessageBarController;
    :cond_1
    :goto_2
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 2176
    .local v5, "start":I
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2177
    .local v0, "end":I
    if-ge v5, v0, :cond_2

    .line 2178
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6, v5, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2179
    .local v4, "selection":Ljava/lang/String;
    const-string/jumbo v6, "\n"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 2180
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v6, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2182
    .end local v4    # "selection":Ljava/lang/String;
    :cond_2
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->requestFocus()Z

    .line 2183
    return-void

    .end local v0    # "end":I
    .end local v1    # "hideDocumentList":Z
    .end local v5    # "start":I
    :cond_3
    move v1, v7

    .line 2148
    goto/16 :goto_0

    .restart local v1    # "hideDocumentList":Z
    :cond_4
    move v8, v7

    .line 2150
    goto :goto_1

    .line 2167
    :cond_5
    iget-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->wasOpenedDrawer:Z

    if-nez v6, :cond_6

    .line 2168
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6}, Landroid/widget/SlidingDrawer;->close()V

    .line 2169
    :cond_6
    if-eqz v1, :cond_7

    .line 2170
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 2171
    :cond_7
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    invoke-virtual {v6, v7}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 2172
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->requestFocus()Z

    goto :goto_2
.end method

.method private openFromIntent(Landroid/content/Intent;)V
    .locals 27
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 2896
    if-nez p1, :cond_1

    .line 2985
    :cond_0
    :goto_0
    return-void

    .line 2897
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2898
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2900
    :cond_3
    const-string/jumbo v2, "android.intent.action.SEND"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "text/plain"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2901
    invoke-direct/range {p0 .. p1}, Lcom/aor/droidedit/DroidEditActivity;->openTextIntent(Landroid/content/Intent;)V

    .line 2902
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->setIntent(Landroid/content/Intent;)V

    .line 2904
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "shortcut"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2905
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_5

    .line 2906
    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->error_opening:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2908
    :cond_5
    :try_start_0
    new-instance v9, Ljava/io/ByteArrayInputStream;

    const-string/jumbo v2, "file"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/aor/droidedit/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v9, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 2909
    .local v9, "bisFile":Ljava/io/ByteArrayInputStream;
    new-instance v18, Ljava/io/ObjectInputStream;

    move-object/from16 v0, v18

    invoke-direct {v0, v9}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2910
    .local v18, "inFile":Ljava/io/ObjectInput;
    invoke-interface/range {v18 .. v18}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/aor/droidedit/fs/implementation/FSFile;

    .line 2911
    .local v15, "file":Lcom/aor/droidedit/fs/implementation/FSFile;
    const/4 v2, 0x0

    invoke-virtual {v15, v2}, Lcom/aor/droidedit/fs/implementation/FSFile;->setDownloaded(Z)V

    .line 2913
    new-instance v8, Ljava/io/ByteArrayInputStream;

    const-string/jumbo v2, "encoding"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/aor/droidedit/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v8, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 2914
    .local v8, "bisEncoding":Ljava/io/ByteArrayInputStream;
    new-instance v17, Ljava/io/ObjectInputStream;

    move-object/from16 v0, v17

    invoke-direct {v0, v8}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2915
    .local v17, "inEncoding":Ljava/io/ObjectInput;
    invoke-interface/range {v17 .. v17}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/aor/droidedit/document/Encoding;

    .line 2917
    .local v13, "encoding":Lcom/aor/droidedit/document/Encoding;
    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v15, v13}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2922
    .end local v8    # "bisEncoding":Ljava/io/ByteArrayInputStream;
    .end local v9    # "bisFile":Ljava/io/ByteArrayInputStream;
    .end local v13    # "encoding":Lcom/aor/droidedit/document/Encoding;
    .end local v15    # "file":Lcom/aor/droidedit/fs/implementation/FSFile;
    .end local v17    # "inEncoding":Ljava/io/ObjectInput;
    .end local v18    # "inFile":Ljava/io/ObjectInput;
    :goto_1
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->setIntent(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 2918
    :catch_0
    move-exception v12

    .line 2919
    .local v12, "e":Ljava/lang/Exception;
    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->error_opening:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2920
    const-string/jumbo v2, "DroidEdit"

    const-string/jumbo v3, ""

    invoke-static {v2, v3, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 2925
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_9

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "content"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2926
    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    .line 2928
    .local v24, "resolver":Landroid/content/ContentResolver;
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v19

    .line 2929
    .local v19, "is":Ljava/io/InputStream;
    if-eqz v19, :cond_9

    .line 2931
    const/16 v21, 0x0

    .line 2934
    .local v21, "name":Ljava/lang/String;
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 2935
    .local v11, "c":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2936
    const-string/jumbo v2, "_display_name"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 2937
    .local v16, "fileNameColumnId":I
    if-ltz v16, :cond_7

    move/from16 v0, v16

    invoke-interface {v11, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v21

    .line 2940
    .end local v11    # "c":Landroid/database/Cursor;
    .end local v16    # "fileNameColumnId":I
    :cond_7
    :goto_2
    if-nez v21, :cond_8

    :try_start_3
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "untitled_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Random;

    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    const/16 v4, 0x2710

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 2942
    :cond_8
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    move-object/from16 v0, v21

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v22

    .line 2944
    .local v22, "path":Ljava/lang/String;
    new-instance v26, Ljava/io/FileOutputStream;

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 2945
    .local v26, "tmp":Ljava/io/FileOutputStream;
    const/16 v2, 0x400

    new-array v10, v2, [B

    .line 2946
    .local v10, "buffer":[B
    :goto_3
    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-gtz v2, :cond_c

    .line 2949
    invoke-virtual/range {v26 .. v26}, Ljava/io/FileOutputStream;->close()V

    .line 2950
    invoke-virtual/range {v19 .. v19}, Ljava/io/InputStream;->close()V

    .line 2952
    new-instance v15, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    new-instance v2, Ljava/io/File;

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v15, v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;-><init>(Ljava/io/File;)V

    .line 2953
    .local v15, "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    new-instance v2, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;

    invoke-direct {v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;-><init>()V

    invoke-virtual {v15, v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->setFileSystem(Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    .line 2954
    invoke-virtual {v15}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0, v15}, Lcom/aor/droidedit/fs/implementation/FileSystem;->updateLocalPath(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    .line 2955
    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    invoke-static/range {p0 .. p0}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v15, v3}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 2961
    .end local v10    # "buffer":[B
    .end local v15    # "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    .end local v19    # "is":Ljava/io/InputStream;
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "path":Ljava/lang/String;
    .end local v24    # "resolver":Landroid/content/ContentResolver;
    .end local v26    # "tmp":Ljava/io/FileOutputStream;
    :cond_9
    :goto_4
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "file"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 2962
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v23

    .line 2963
    .local v23, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "rootMode"

    const/4 v3, 0x0

    move-object/from16 v0, v23

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v25

    .line 2965
    .local v25, "rootMode":Z
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v14, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2966
    .local v14, "f":Ljava/io/File;
    new-instance v15, Lcom/aor/droidedit/fs/implementation/local/LocalFile;

    invoke-direct {v15, v14}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;-><init>(Ljava/io/File;)V

    .line 2968
    .restart local v15    # "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    invoke-virtual {v14}, Ljava/io/File;->canRead()Z

    move-result v2

    if-nez v2, :cond_d

    if-eqz v25, :cond_d

    .line 2969
    new-instance v2, Lcom/aor/droidedit/fs/implementation/root/RootFileSystem;

    invoke-direct {v2}, Lcom/aor/droidedit/fs/implementation/root/RootFileSystem;-><init>()V

    invoke-virtual {v15, v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->setFileSystem(Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    .line 2973
    :goto_5
    invoke-virtual {v15}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0, v15}, Lcom/aor/droidedit/fs/implementation/FileSystem;->updateLocalPath(Landroid/content/Context;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    .line 2974
    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    invoke-static/range {p0 .. p0}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v15, v3}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/fs/implementation/FSFile;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v2}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    .line 2976
    .end local v14    # "f":Ljava/io/File;
    .end local v15    # "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    .end local v23    # "prefs":Landroid/content/SharedPreferences;
    .end local v25    # "rootMode":Z
    :cond_a
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b

    .line 2977
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    .line 2979
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    .line 2980
    .local v20, "key":Ljava/lang/String;
    const-string/jumbo v2, "[a-zA-Z0-9]+"

    move-object/from16 v0, v20

    invoke-static {v2, v0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2982
    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$DownloadPastebinAction;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/aor/droidedit/DroidEditActivity$DownloadPastebinAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v20, v3, v4

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/DroidEditActivity$DownloadPastebinAction;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2984
    .end local v20    # "key":Ljava/lang/String;
    :cond_b
    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->setIntent(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 2947
    .restart local v10    # "buffer":[B
    .restart local v19    # "is":Ljava/io/InputStream;
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "path":Ljava/lang/String;
    .restart local v24    # "resolver":Landroid/content/ContentResolver;
    .restart local v26    # "tmp":Ljava/io/FileOutputStream;
    :cond_c
    :try_start_4
    move-object/from16 v0, v26

    invoke-virtual {v0, v10}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_3

    .line 2957
    .end local v10    # "buffer":[B
    .end local v19    # "is":Ljava/io/InputStream;
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "path":Ljava/lang/String;
    .end local v26    # "tmp":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v12

    .line 2958
    .restart local v12    # "e":Ljava/lang/Exception;
    invoke-virtual/range {p0 .. p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->error_opening:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto/16 :goto_4

    .line 2971
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v24    # "resolver":Landroid/content/ContentResolver;
    .restart local v14    # "f":Ljava/io/File;
    .restart local v15    # "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    .restart local v23    # "prefs":Landroid/content/SharedPreferences;
    .restart local v25    # "rootMode":Z
    :cond_d
    new-instance v2, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;

    invoke-direct {v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFileSystem;-><init>()V

    invoke-virtual {v15, v2}, Lcom/aor/droidedit/fs/implementation/local/LocalFile;->setFileSystem(Lcom/aor/droidedit/fs/implementation/FileSystem;)V

    goto/16 :goto_5

    .line 2938
    .end local v14    # "f":Ljava/io/File;
    .end local v15    # "file":Lcom/aor/droidedit/fs/implementation/local/LocalFile;
    .end local v23    # "prefs":Landroid/content/SharedPreferences;
    .end local v25    # "rootMode":Z
    .restart local v19    # "is":Ljava/io/InputStream;
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v24    # "resolver":Landroid/content/ContentResolver;
    :catch_2
    move-exception v2

    goto/16 :goto_2
.end method

.method private openGotoLineDialog()V
    .locals 4

    .prologue
    .line 2064
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 2065
    .local v0, "dialog":Landroid/app/AlertDialog;
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2066
    .local v1, "input":Landroid/widget/EditText;
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 2067
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 2068
    sget v2, Lcom/aor/droidedit/lib/R$string;->goto_line:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 2069
    sget v2, Lcom/aor/droidedit/lib/R$string;->goto_line_number:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 2070
    sget v2, Lcom/aor/droidedit/lib/R$string;->goto_line_go:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$54;

    invoke-direct {v3, p0, v1}, Lcom/aor/droidedit/DroidEditActivity$54;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog;->setButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 2080
    sget v2, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$55;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$55;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog;->setButton2(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 2086
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 2087
    return-void
.end method

.method private openInBrowser()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    .line 1371
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v3

    .line 1373
    .local v3, "document":Lcom/aor/droidedit/document/Document;
    :try_start_0
    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v11

    if-nez v11, :cond_0

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isFtp()Z

    move-result v11

    if-eqz v11, :cond_9

    .line 1374
    :cond_0
    const/4 v9, 0x0

    .line 1375
    .local v9, "serverId":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v11

    invoke-virtual {v11}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v11

    check-cast v11, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;

    invoke-virtual {v11}, Lcom/aor/droidedit/fs/implementation/sftp/SFTPFileSystem;->getId()Ljava/lang/String;

    move-result-object v9

    .line 1376
    :cond_1
    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isFtp()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v11

    invoke-virtual {v11}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v11

    check-cast v11, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;

    invoke-virtual {v11}, Lcom/aor/droidedit/fs/implementation/ftp/FTPFileSystem;->getId()Ljava/lang/String;

    move-result-object v9

    .line 1378
    :cond_2
    if-nez v9, :cond_3

    .line 1436
    .end local v9    # "serverId":Ljava/lang/String;
    :goto_0
    return-void

    .line 1380
    .restart local v9    # "serverId":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11, v9}, Lcom/aor/droidedit/preferences/SftpListPreferences;->getServerUrl(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1381
    .local v10, "url":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11, v9}, Lcom/aor/droidedit/preferences/SftpListPreferences;->getServerPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1382
    .local v1, "base":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 1384
    .local v7, "path":Ljava/lang/String;
    if-nez v1, :cond_4

    .line 1385
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget v12, Lcom/aor/droidedit/lib/R$string;->error_no_initial_folder:I

    invoke-virtual {p0, v12}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1432
    .end local v1    # "base":Ljava/lang/String;
    .end local v7    # "path":Ljava/lang/String;
    .end local v9    # "serverId":Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 1433
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget v12, Lcom/aor/droidedit/lib/R$string;->error_failed_open_browser:I

    invoke-virtual {p0, v12}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    .line 1434
    const-string/jumbo v11, "DroidEdit"

    const-string/jumbo v12, ""

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1389
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v1    # "base":Ljava/lang/String;
    .restart local v7    # "path":Ljava/lang/String;
    .restart local v9    # "serverId":Ljava/lang/String;
    .restart local v10    # "url":Ljava/lang/String;
    :cond_4
    if-nez v10, :cond_5

    .line 1390
    :try_start_1
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget v12, Lcom/aor/droidedit/lib/R$string;->error_no_base_url:I

    invoke-virtual {p0, v12}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1394
    :cond_5
    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 1395
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1396
    :cond_6
    const-string/jumbo v11, "/"

    invoke-virtual {v1, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 1397
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1399
    :cond_7
    invoke-virtual {v7, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 1400
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget v12, Lcom/aor/droidedit/lib/R$string;->error_not_in_initial_folder:I

    invoke-virtual {p0, v12}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 1404
    :cond_8
    const-string/jumbo v11, "/"

    invoke-static {v7, v1, v11}, Lcom/aor/droidedit/util/ResourceUtils;->getRelativePath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1405
    .local v8, "relative":Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    invoke-direct {v5, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1406
    .local v5, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v11, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    .line 1407
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v5, v11}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1408
    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1410
    .end local v1    # "base":Ljava/lang/String;
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v7    # "path":Ljava/lang/String;
    .end local v8    # "relative":Ljava/lang/String;
    .end local v9    # "serverId":Ljava/lang/String;
    .end local v10    # "url":Ljava/lang/String;
    :cond_9
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v12, Ljava/io/File;

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v12}, Lcom/code/ide/compat/StorageAccess;->shareUri(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v12

    invoke-direct {v5, v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
    const/4 v11, 0x1
    invoke-virtual {v5, v11}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    const-string v11, "text/html"
    invoke-virtual {v5, v12, v11}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;


    .line 1411
    .restart local v5    # "intent":Landroid/content/Intent;
    new-instance v6, Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v6, v11}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 1412
    .local v6, "list":Landroid/widget/ListView;
    new-instance v11, Lcom/aor/droidedit/custom/BrowsersAdapter;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-direct {v11, v12, v5}, Lcom/aor/droidedit/custom/BrowsersAdapter;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {v6, v11}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1413
    invoke-virtual {v6}, Landroid/widget/ListView;->getCount()I

    move-result v11

    const/4 v12, 0x1

    if-ne v11, v12, :cond_a

    .line 1414
    invoke-virtual {v6}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/custom/BrowsersAdapter;

    .line 1415
    .local v0, "adapter":Lcom/aor/droidedit/custom/BrowsersAdapter;
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Lcom/aor/droidedit/custom/BrowsersAdapter;->getIntent(I)Landroid/content/Intent;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1417
    .end local v0    # "adapter":Lcom/aor/droidedit/custom/BrowsersAdapter;
    :cond_a
    new-instance v11, Landroid/app/AlertDialog$Builder;

    invoke-direct {v11, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1418
    sget v12, Lcom/aor/droidedit/lib/R$string;->external_preview_broser:I

    invoke-virtual {v11, v12}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    .line 1419
    invoke-virtual {v11, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    .line 1420
    invoke-virtual {v11}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .line 1421
    .local v2, "dialog":Landroid/app/AlertDialog;
    new-instance v11, Lcom/aor/droidedit/DroidEditActivity$42;

    invoke-direct {v11, p0, v2}, Lcom/aor/droidedit/DroidEditActivity$42;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v6, v11}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private openPreferenceScreen()V
    .locals 2

    .prologue
    .line 1962
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/aor/droidedit/preferences/Preferences;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1963
    .local v0, "settingsActivity":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 1964
    return-void
.end method

.method private openTextIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 2988
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2989
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    const-string/jumbo v3, "android.intent.extra.TEXT"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/aor/droidedit/document/Document;->setText(Ljava/lang/String;)V

    .line 2990
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/aor/droidedit/document/Document;->setChanged(Z)V

    .line 2991
    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    .line 3002
    :goto_0
    return-void

    .line 2993
    :cond_0
    new-instance v1, Lcom/aor/droidedit/document/Document;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/document/Document;-><init>(Landroid/content/Context;)V

    .line 2994
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    const-string/jumbo v2, "android.intent.extra.TEXT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/aor/droidedit/document/Document;->setText(Ljava/lang/String;)V

    .line 2995
    invoke-virtual {v1, v4}, Lcom/aor/droidedit/document/Document;->setChanged(Z)V

    .line 2997
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 2998
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 2999
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2, v4}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 3000
    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    goto :goto_0
.end method

.method private pasteText()Z
    .locals 6

    .prologue
    .line 1195
    :try_start_0
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1196
    .local v3, "start":I
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v4

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v5}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 1198
    .local v2, "end":I
    const-string/jumbo v4, "clipboard"

    invoke-virtual {p0, v4}, Lcom/aor/droidedit/DroidEditActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1199
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v4, v3, v2, v5}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 1200
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {v4, v5}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1204
    const/4 v4, 0x1

    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    .end local v2    # "end":I
    .end local v3    # "start":I
    :goto_0
    return v4

    .line 1201
    :catch_0
    move-exception v1

    .line 1202
    .local v1, "e":Ljava/lang/NullPointerException;
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private premiumFeature(I)V
    .locals 3
    .param p1, "summaryId"    # I

    .prologue
    .line 1208
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_feature:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_upgrade:I

    new-instance v2, Lcom/aor/droidedit/DroidEditActivity$34;

    invoke-direct {v2, p0}, Lcom/aor/droidedit/DroidEditActivity$34;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1217
    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_no_thanks:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1218
    return-void
.end method

.method public static readObjectFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 2839
    const/4 v2, 0x0

    .line 2840
    .local v2, "objectIn":Ljava/io/ObjectInputStream;
    const/4 v1, 0x0

    .line 2842
    .local v1, "object":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 2843
    .local v0, "fileIn":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2844
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .local v3, "objectIn":Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    .line 2849
    if-eqz v3, :cond_2

    .line 2851
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6

    move-object v2, v3

    .line 2856
    .end local v0    # "fileIn":Ljava/io/FileInputStream;
    .end local v1    # "object":Ljava/lang/Object;
    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    :cond_0
    :goto_0
    return-object v1

    .line 2845
    .restart local v1    # "object":Ljava/lang/Object;
    :catch_0
    move-exception v4

    .line 2849
    :goto_1
    if-eqz v2, :cond_0

    .line 2851
    :try_start_3
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 2852
    :catch_1
    move-exception v4

    goto :goto_0

    .line 2846
    :catch_2
    move-exception v4

    .line 2849
    :goto_2
    if-eqz v2, :cond_0

    .line 2851
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_0

    .line 2852
    :catch_3
    move-exception v4

    goto :goto_0

    .line 2847
    :catch_4
    move-exception v4

    .line 2849
    :goto_3
    if-eqz v2, :cond_0

    .line 2851
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_0

    .line 2852
    :catch_5
    move-exception v4

    goto :goto_0

    .line 2848
    :catchall_0
    move-exception v4

    .line 2849
    :goto_4
    if-eqz v2, :cond_1

    .line 2851
    :try_start_6
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    .line 2855
    :cond_1
    :goto_5
    throw v4

    .line 2852
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v0    # "fileIn":Ljava/io/FileInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :catch_6
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_0

    .end local v0    # "fileIn":Ljava/io/FileInputStream;
    :catch_7
    move-exception v5

    goto :goto_5

    .line 2848
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v0    # "fileIn":Ljava/io/FileInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_4

    .line 2847
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :catch_8
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_3

    .line 2846
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :catch_9
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_2

    .line 2845
    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :catch_a
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_1

    .end local v2    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v3    # "objectIn":Ljava/io/ObjectInputStream;
    :cond_2
    move-object v2, v3

    .end local v3    # "objectIn":Ljava/io/ObjectInputStream;
    .restart local v2    # "objectIn":Ljava/io/ObjectInputStream;
    goto :goto_0
.end method

.method private reallyCloseDocument(I)V
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v4, 0x0

    .line 2208
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 2210
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    :try_start_0
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->getDocument(I)Lcom/aor/droidedit/document/Document;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->remove(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2213
    :goto_0
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    if-nez v2, :cond_3

    .line 2214
    new-instance v1, Lcom/aor/droidedit/document/Document;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/aor/droidedit/document/Document;-><init>(Landroid/content/Context;)V

    .line 2215
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 2216
    iput v4, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 2219
    .end local v1    # "document":Lcom/aor/droidedit/document/Document;
    :cond_0
    :goto_1
    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 2220
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 2221
    :cond_1
    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    if-gez v2, :cond_2

    .line 2222
    iput v4, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 2223
    :cond_2
    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {p0, v2, v4}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 2224
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-direct {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getDocument(I)Lcom/aor/droidedit/document/Document;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 2225
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->notifyDocumentListChanged()V

    .line 2226
    return-void

    .line 2217
    :cond_3
    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    if-gt p1, v2, :cond_0

    .line 2218
    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    goto :goto_1

    .line 2211
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private removeDocumentsWithPath(Lcom/aor/droidedit/document/Document;)V
    .locals 7
    .param p1, "document"    # Lcom/aor/droidedit/document/Document;

    .prologue
    .line 2875
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 2876
    .local v3, "toRemove":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/aor/droidedit/document/Document;>;"
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2877
    .local v1, "file":Ljava/io/File;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2887
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 2888
    return-void

    .line 2877
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/document/Document;

    .line 2878
    .local v2, "od":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 2879
    new-instance v0, Ljava/io/File;

    invoke-virtual {v2}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2881
    .local v0, "dFile":Ljava/io/File;
    if-eq v2, p1, :cond_0

    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2882
    invoke-virtual {v3, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2883
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method private removeTempFiles()V
    .locals 5

    .prologue
    .line 1952
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 1953
    .local v0, "dir":Ljava/io/File;
    if-nez v0, :cond_1

    .line 1959
    :cond_0
    return-void

    .line 1954
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1955
    .local v1, "files":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 1956
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ".remote"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ".tmp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1957
    :cond_2
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1955
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private runExternalCommand()V
    .locals 10

    .prologue
    .line 1311
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v3

    .line 1312
    .local v3, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1313
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/aor/droidedit/preferences/ExternalListPreferences;->getCommands(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v2

    .line 1314
    .local v2, "commands":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v7

    new-array v6, v7, [Ljava/lang/CharSequence;

    .line 1315
    .local v6, "names":[Ljava/lang/CharSequence;
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v7

    new-array v5, v7, [Ljava/lang/CharSequence;

    .line 1316
    .local v5, "ids":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 1317
    .local v0, "c":I
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_2

    .line 1321
    new-instance v7, Landroid/app/AlertDialog$Builder;

    invoke-direct {v7, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v8, Lcom/aor/droidedit/lib/R$string;->external_choose_command:I

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    new-instance v8, Lcom/aor/droidedit/DroidEditActivity$40;

    invoke-direct {v8, p0, v5, v3}, Lcom/aor/droidedit/DroidEditActivity$40;-><init>(Lcom/aor/droidedit/DroidEditActivity;[Ljava/lang/CharSequence;Lcom/aor/droidedit/document/Document;)V

    invoke-virtual {v7, v6, v8}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 1328
    sget v8, Lcom/aor/droidedit/lib/R$string;->generic_cancel:I

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1330
    .end local v0    # "c":I
    .end local v2    # "commands":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "ids":[Ljava/lang/CharSequence;
    .end local v6    # "names":[Ljava/lang/CharSequence;
    :cond_1
    return-void

    .line 1317
    .restart local v0    # "c":I
    .restart local v2    # "commands":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "ids":[Ljava/lang/CharSequence;
    .restart local v6    # "names":[Ljava/lang/CharSequence;
    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1318
    .local v4, "id":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v0

    .line 1319
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "c":I
    .local v1, "c":I
    aput-object v4, v5, v0

    move v0, v1

    .end local v1    # "c":I
    .restart local v0    # "c":I
    goto :goto_0
.end method

.method private runShareCommand()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const v3, 0x108009b

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1221
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 1222
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1223
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_save_file_first:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1296
    :cond_0
    :goto_0
    return-void

    .line 1226
    :cond_1
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1227
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1228
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_choose_action:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/CharSequence;

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_preview_broser:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_external:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$35;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$35;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1240
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 1241
    :cond_2
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isFtp()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1242
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_choose_action:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/CharSequence;

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_preview_broser:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$36;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$36;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1252
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 1253
    :cond_3
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "html"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "htm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1254
    :cond_4
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_choose_action:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/CharSequence;

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_preview_broser:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_external:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$37;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$37;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1266
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 1267
    :cond_5
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1268
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_choose_action:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/CharSequence;

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_in_sl4a_terminal:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_in_sl4a_background:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_external:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$38;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$38;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1282
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 1283
    :cond_6
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1284
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->external_choose_action:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/CharSequence;

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_run_external:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    new-instance v3, Lcom/aor/droidedit/DroidEditActivity$39;

    invoke-direct {v3, p0}, Lcom/aor/droidedit/DroidEditActivity$39;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1294
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 1295
    :cond_7
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->shareDocument()V

    goto/16 :goto_0
.end method

.method private saveCurrentState()V
    .locals 3

    .prologue
    .line 2808
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2809
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v1, "openDocuments"

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2810
    const-string/jumbo v1, "currentDocument"

    iget v2, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2812
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "droidedit.tmp"

    invoke-static {v1, v0, v2}, Lcom/aor/droidedit/DroidEditActivity;->writeObjectToFile(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2815
    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 2813
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private searchFiles()V
    .locals 6

    .prologue
    .line 1702
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.MAIN"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1703
    .local v1, "i":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1704
    .local v2, "manager":Landroid/content/pm/PackageManager;
    const-string/jumbo v3, "com.aor.droidgrep"

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 1705
    const-string/jumbo v3, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1706
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1723
    .end local v1    # "i":Landroid/content/Intent;
    .end local v2    # "manager":Landroid/content/pm/PackageManager;
    :goto_0
    return-void

    .line 1707
    :catch_0
    move-exception v0

    .line 1708
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1709
    sget v4, Lcom/aor/droidedit/lib/R$string;->install_droidgrep_title:I

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1710
    sget v4, Lcom/aor/droidedit/lib/R$string;->install_droidgrep_message:I

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1711
    sget v4, Lcom/aor/droidedit/lib/R$string;->generic_no:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1712
    sget v4, Lcom/aor/droidedit/lib/R$string;->generic_ok:I

    new-instance v5, Lcom/aor/droidedit/DroidEditActivity$45;

    invoke-direct {v5, p0}, Lcom/aor/droidedit/DroidEditActivity$45;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1721
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private selectAll()V
    .locals 3

    .prologue
    .line 1158
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelectionNoHack(II)V

    .line 1159
    return-void
.end method

.method private setSpellCheckerState(Z)V
    .locals 2
    .param p1, "state"    # Z

    .prologue
    .line 1739
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const v1, 0x28001

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setInputType(I)V

    .line 1741
    :goto_0
    return-void

    .line 1740
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const v1, 0xb0091

    invoke-virtual {v0, v1}, Lcom/aor/droidedit/custom/ObservableEditText;->setInputType(I)V

    goto :goto_0
.end method

.method private shareDocument()V
    .locals 5

    .prologue
    .line 1471
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 1472
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1473
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "text/plain"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1474
    const-string/jumbo v2, "android.intent.extra.STREAM"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "file://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1475
    sget v2, Lcom/aor/droidedit/lib/R$string;->external_send_file:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 1476
    return-void
.end method

.method private showLegacyGitMenu()V
    .locals 8

    .prologue
    .line 1797
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1824
    :cond_0
    :goto_0
    return-void

    .line 1799
    :cond_1
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/git/GitFileSystem;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/git/GitFileSystem;->getRootPath()Ljava/lang/String;

    move-result-object v3

    .line 1800
    .local v3, "rootPath":Ljava/lang/String;
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getLocalPath()Ljava/lang/String;

    move-result-object v4

    .line 1801
    .local v4, "filePath":Ljava/lang/String;
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/fs/implementation/git/GitFileSystem;

    invoke-virtual {v0}, Lcom/aor/droidedit/fs/implementation/git/GitFileSystem;->getGitId()Ljava/lang/String;

    move-result-object v5

    .line 1802
    .local v5, "repositoryId":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 1804
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1805
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/CharSequence;>;"
    invoke-static {v3}, Lcom/aor/droidedit/git/GitUtils;->getModifiedFiles(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_2

    .line 1806
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_git_commit:I

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1807
    :cond_2
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_git_push:I

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1808
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_git_pull:I

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1810
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1811
    sget v1, Lcom/aor/droidedit/lib/R$string;->action_bar_git_actions:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 1812
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/CharSequence;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, [Ljava/lang/CharSequence;

    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$47;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/aor/droidedit/DroidEditActivity$47;-><init>(Lcom/aor/droidedit/DroidEditActivity;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v6, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1823
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0
.end method

.method private updateProgress(ZII)V
    .locals 2
    .param p1, "visible"    # Z
    .param p2, "max"    # I
    .param p3, "progress"    # I

    .prologue
    .line 1479
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 1481
    .local v0, "handler":Landroid/os/Handler;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$43;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/aor/droidedit/DroidEditActivity$43;-><init>(Lcom/aor/droidedit/DroidEditActivity;IIZ)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1488
    :cond_0
    return-void
.end method

.method private updateReplaceState()V
    .locals 9

    .prologue
    .line 2347
    :try_start_0
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v7

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v8}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 2348
    .local v5, "start":I
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v7

    iget-object v8, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v8}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2349
    .local v0, "end":I
    if-eq v5, v0, :cond_1

    .line 2350
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v7}, Lcom/aor/droidedit/custom/ObservableEditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7, v5, v0}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2351
    .local v4, "selected":Ljava/lang/String;
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2352
    .local v6, "toFind":Ljava/lang/String;
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    invoke-virtual {v7}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v1

    .line 2354
    .local v1, "ignoreCase":Z
    if-eqz v1, :cond_0

    .line 2355
    const/16 v7, 0xa

    invoke-static {v6, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 2357
    .local v3, "pattern":Ljava/util/regex/Pattern;
    :goto_0
    invoke-virtual {v3, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 2358
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 2359
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceButton:Landroid/widget/ImageButton;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 2366
    .end local v0    # "end":I
    .end local v1    # "ignoreCase":Z
    .end local v2    # "matcher":Ljava/util/regex/Matcher;
    .end local v3    # "pattern":Ljava/util/regex/Pattern;
    .end local v4    # "selected":Ljava/lang/String;
    .end local v5    # "start":I
    .end local v6    # "toFind":Ljava/lang/String;
    :goto_1
    return-void

    .line 2356
    .restart local v0    # "end":I
    .restart local v1    # "ignoreCase":Z
    .restart local v4    # "selected":Ljava/lang/String;
    .restart local v5    # "start":I
    .restart local v6    # "toFind":Ljava/lang/String;
    :cond_0
    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .restart local v3    # "pattern":Ljava/util/regex/Pattern;
    goto :goto_0

    .line 2363
    .end local v0    # "end":I
    .end local v1    # "ignoreCase":Z
    .end local v3    # "pattern":Ljava/util/regex/Pattern;
    .end local v4    # "selected":Ljava/lang/String;
    .end local v5    # "start":I
    .end local v6    # "toFind":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 2365
    :cond_1
    iget-object v7, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceButton:Landroid/widget/ImageButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_1
.end method

.method private updateSpellCheckerState()V
    .locals 5

    .prologue
    .line 1726
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1727
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "spellCheck"

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-direct {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->setSpellCheckerState(Z)V

    .line 1729
    const-string/jumbo v3, "fontFace"

    sget-object v4, Lcom/aor/droidedit/util/FontTypes;->DroidSans:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1731
    .local v0, "fontFace":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/aor/droidedit/util/FontUtils;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 1732
    .local v2, "typeFace":Landroid/graphics/Typeface;
    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v3}, Lcom/aor/droidedit/custom/ObservableEditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1733
    :cond_0
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-static {v3, v2}, Lcom/aor/droidedit/util/FontUtils;->setFont(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 1734
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    invoke-static {v3, v2}, Lcom/aor/droidedit/util/FontUtils;->setFont(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 1736
    :cond_1
    return-void
.end method

.method private updateTabs()V
    .locals 8

    .prologue
    .line 3609
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xb

    if-ge v6, v7, :cond_1

    .line 3649
    :cond_0
    :goto_0
    return-void

    .line 3611
    :cond_1
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->updatingTabs:Z

    .line 3612
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    .line 3613
    .local v1, "bar":Landroid/app/ActionBar;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/ActionBar;->getNavigationMode()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_0

    .line 3615
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v6}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 3616
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    :goto_1
    invoke-virtual {v1}, Landroid/app/ActionBar;->getTabCount()I

    move-result v6

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v7

    if-gt v6, v7, :cond_2

    .line 3618
    :goto_2
    invoke-virtual {v1}, Landroid/app/ActionBar;->getTabCount()I

    move-result v6

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v7

    if-lt v6, v7, :cond_3

    .line 3637
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v6

    if-lt v2, v6, :cond_4

    .line 3647
    iget v6, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {v1, v6}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 3648
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->updatingTabs:Z

    goto :goto_0

    .line 3617
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v1}, Landroid/app/ActionBar;->getTabCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v1, v6}, Landroid/app/ActionBar;->removeTabAt(I)V

    goto :goto_1

    .line 3619
    :cond_3
    invoke-virtual {v1}, Landroid/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v6

    new-instance v7, Lcom/aor/droidedit/DroidEditActivity$65;

    invoke-direct {v7, p0}, Lcom/aor/droidedit/DroidEditActivity$65;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v6, v7}, Landroid/app/ActionBar$Tab;->setTabListener(Landroid/app/ActionBar$TabListener;)Landroid/app/ActionBar$Tab;

    move-result-object v5

    .line 3635
    .local v5, "tab":Landroid/app/ActionBar$Tab;
    invoke-virtual {v1, v5}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    goto :goto_2

    .line 3638
    .end local v5    # "tab":Landroid/app/ActionBar$Tab;
    .restart local v2    # "i":I
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/aor/droidedit/document/Document;

    invoke-virtual {v6}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/aor/droidedit/document/Document;

    invoke-virtual {v6}, Lcom/aor/droidedit/document/Document;->getChangedMark()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3639
    .local v3, "newTabTitle":Ljava/lang/String;
    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/ActionBar$Tab;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    if-nez v6, :cond_6

    const-string/jumbo v4, ""

    .line 3640
    .local v4, "oldTabTitle":Ljava/lang/String;
    :goto_4
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 3641
    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object v5

    .line 3642
    .restart local v5    # "tab":Landroid/app/ActionBar$Tab;
    invoke-virtual {v5, v3}, Landroid/app/ActionBar$Tab;->setText(Ljava/lang/CharSequence;)Landroid/app/ActionBar$Tab;

    .line 3643
    invoke-virtual {v1, v5}, Landroid/app/ActionBar;->removeTab(Landroid/app/ActionBar$Tab;)V

    .line 3644
    invoke-virtual {v1, v5, v2}, Landroid/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;I)V

    .line 3637
    .end local v5    # "tab":Landroid/app/ActionBar$Tab;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 3639
    .end local v4    # "oldTabTitle":Ljava/lang/String;
    :cond_6
    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/ActionBar$Tab;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4
.end method

.method public static writeObjectToFile(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 2818
    const/4 v2, 0x0

    .line 2821
    .local v2, "objectOut":Ljava/io/ObjectOutputStream;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p0, p2, v4}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 2822
    .local v1, "fileOut":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2823
    .end local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    .local v3, "objectOut":Ljava/io/ObjectOutputStream;
    :try_start_1
    invoke-virtual {v3, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 2824
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2829
    if-eqz v3, :cond_2

    .line 2831
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v2, v3

    .line 2836
    .end local v1    # "fileOut":Ljava/io/FileOutputStream;
    .end local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 2826
    :catch_0
    move-exception v0

    .line 2827
    .local v0, "e":Ljava/io/IOException;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2829
    if-eqz v2, :cond_0

    .line 2831
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 2832
    :catch_1
    move-exception v4

    goto :goto_0

    .line 2828
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 2829
    :goto_2
    if-eqz v2, :cond_1

    .line 2831
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 2835
    :cond_1
    :goto_3
    throw v4

    .line 2832
    .end local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v1    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    :catch_2
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    goto :goto_0

    .end local v1    # "fileOut":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v5

    goto :goto_3

    .line 2828
    .end local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v1    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    goto :goto_2

    .line 2826
    .end local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    :catch_4
    move-exception v0

    move-object v2, v3

    .end local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    goto :goto_1

    .end local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    :cond_2
    move-object v2, v3

    .end local v3    # "objectOut":Ljava/io/ObjectOutputStream;
    .restart local v2    # "objectOut":Ljava/io/ObjectOutputStream;
    goto :goto_0
.end method


# virtual methods
.method protected adjustClosedMenu()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 2021
    const/4 v5, 0x1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v5

    float-to-int v4, v5

    .line 2023
    .local v4, "smallMargin":I
    const/4 v0, 0x0

    .line 2024
    .local v0, "footerSize":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->footerlayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->footerlayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v0

    .line 2026
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 2027
    .local v1, "lp1":Landroid/widget/FrameLayout$LayoutParams;
    iget v5, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int v6, v0, v4

    invoke-virtual {v1, v8, v8, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2029
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 2030
    .local v2, "lp2":Landroid/widget/FrameLayout$LayoutParams;
    add-int v5, v0, v4

    invoke-virtual {v2, v8, v8, v8, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2032
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 2033
    .local v3, "lp3":Landroid/widget/FrameLayout$LayoutParams;
    add-int v5, v0, v4

    invoke-virtual {v3, v8, v8, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2035
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->requestLayout()V

    .line 2036
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 2037
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->requestLayout()V

    .line 2039
    sget v5, Lcom/aor/droidedit/lib/R$id;->menudrawerbutton:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    sget v6, Lcom/aor/droidedit/lib/R$drawable;->open_drawer_h:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2040
    return-void
.end method

.method protected adjustMenus()V
    .locals 1

    .prologue
    .line 3042
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v0}, Landroid/widget/SlidingDrawer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustOpenedMenu()V

    .line 3045
    :goto_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v0}, Landroid/widget/SlidingDrawer;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustOpenedDrawer()V

    .line 3047
    :goto_1
    return-void

    .line 3043
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustClosedMenu()V

    goto :goto_0

    .line 3046
    :cond_1
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->adjustClosedDrawer()V

    goto :goto_1
.end method

.method protected adjustOpenedMenu()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 2043
    const/4 v5, 0x1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v5

    float-to-int v4, v5

    .line 2044
    .local v4, "smallMargin":I
    const/4 v0, 0x0

    .line 2045
    .local v0, "footerSize":I
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->isShown()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->getHeight()I

    move-result v0

    .line 2047
    :cond_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 2048
    .local v1, "lp1":Landroid/widget/FrameLayout$LayoutParams;
    iget v5, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int v6, v0, v4

    invoke-virtual {v1, v8, v8, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2050
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 2051
    .local v2, "lp2":Landroid/widget/FrameLayout$LayoutParams;
    add-int v5, v0, v4

    invoke-virtual {v2, v8, v8, v8, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2053
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 2054
    .local v3, "lp3":Landroid/widget/FrameLayout$LayoutParams;
    add-int v5, v0, v4

    invoke-virtual {v3, v8, v8, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 2056
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v5}, Landroid/widget/SlidingDrawer;->requestLayout()V

    .line 2057
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 2058
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->requestLayout()V

    .line 2060
    sget v5, Lcom/aor/droidedit/lib/R$id;->menudrawerbutton:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    sget v6, Lcom/aor/droidedit/lib/R$drawable;->close_drawer_h:I

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2061
    return-void
.end method

.method protected canEmmetExpand()Z
    .locals 1

    .prologue
    .line 1697
    const/4 v0, 0x1

    return v0
.end method

.method public cancelAction()V
    .locals 1

    .prologue
    .line 3711
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

    .line 3712
    return-void
.end method

.method protected declared-synchronized changeDocument(IZ)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "saveState"    # Z

    .prologue
    .line 2717
    monitor-enter p0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lt p1, v0, :cond_1

    .line 2726
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 2718
    :cond_1
    if-eqz p2, :cond_2

    .line 2719
    :try_start_1
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/document/Document;->setSelection(II)V

    .line 2720
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableScrollView;->getScrollX()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableScrollView;->getScrollY()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/document/Document;->setScrollPosition(II)V

    .line 2722
    :cond_2
    iput p1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 2723
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    .line 2724
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_3

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActionBar;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->invalidateOptionsMenu()V

    .line 2725
    :cond_3
    new-instance v0, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;)V

    invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity$GenericVerifyChanges;->execute()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2717
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public createDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V
    .locals 3
    .param p1, "document"    # Lcom/aor/droidedit/document/Document;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 3724
    new-instance v0, Lcom/aor/droidedit/document/Document;

    invoke-direct {v0, p0}, Lcom/aor/droidedit/document/Document;-><init>(Landroid/content/Context;)V

    .line 3725
    .local v0, "nd":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0, p2}, Lcom/aor/droidedit/document/Document;->setText(Ljava/lang/String;)V

    .line 3726
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3727
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 3728
    return-void
.end method

.method protected emmetExpand()V
    .locals 1

    .prologue
    .line 1693
    sget v0, Lcom/aor/droidedit/lib/R$string;->premium_emmet_summary:I

    invoke-direct {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->premiumFeature(I)V

    .line 1694
    return-void
.end method

.method protected hasNoModifiers(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1967
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1968
    .local v0, "sdkVersion":I
    const/16 v1, 0xb

    if-ge v0, v1, :cond_1

    .line 1969
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 1970
    :goto_0
    return v1

    .line 1969
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1970
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v1

    goto :goto_0
.end method

.method public hideCustomKeyboard()V
    .locals 2

    .prologue
    .line 3690
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/inputmethodservice/KeyboardView;->setVisibility(I)V

    .line 3691
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/inputmethodservice/KeyboardView;->setEnabled(Z)V

    .line 3692
    return-void
.end method

.method public isCustomKeyboardVisible()Z
    .locals 1

    .prologue
    .line 3700
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    invoke-virtual {v0}, Landroid/inputmethodservice/KeyboardView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notifyDocumentListChanged()V
    .locals 3

    .prologue
    .line 3597
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 3598
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 3600
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateTabs()V

    .line 3602
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    if-eqz v1, :cond_0

    .line 3603
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/DocumentAdapter;->notifyDataSetChanged()V

    .line 3605
    :cond_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 9

    const/16 v0, 0x53a1
    if-ne p1, v0, :compat_other_result
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->hasStorage(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :compat_denied
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeCompatAction()V
    return-void
    :compat_denied
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->cancelCompatAction()V
    return-void
    :compat_other_result
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 3653
    const v5, 0x10633

    if-ne p1, v5, :cond_1

    .line 3654
    if-nez p2, :cond_5

    .line 3655
    if-eqz p3, :cond_0

    .line 3656
    const-string/jumbo v5, "exception"

    invoke-virtual {p3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3657
    .local v2, "failMessage":Ljava/lang/String;
    const-string/jumbo v5, "DroidEdit"

    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3659
    .end local v2    # "failMessage":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, "Box"

    sget v6, Lcom/aor/droidedit/lib/R$string;->remote_box_connection_failed:I

    invoke-static {p0, v5, v6}, Lcom/aor/droidedit/util/Alert;->show(Landroid/content/Context;Ljava/lang/String;I)V

    .line 3673
    :cond_1
    :goto_0
    const/16 v5, 0x5b43

    if-ne p1, v5, :cond_3

    .line 3674
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 3675
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "authAccount"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3676
    .local v0, "accountName":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 3677
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 3678
    .local v4, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "drive_account"

    invoke-interface {v5, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3679
    invoke-static {v0}, Lcom/aor/droidedit/fs/implementation/drive/DriveFileSystem;->setAccount(Ljava/lang/String;)V

    .line 3682
    .end local v0    # "accountName":Ljava/lang/String;
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    :cond_2
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeAction()V

    .line 3684
    :cond_3
    const v5, 0xd506

    if-ne p1, v5, :cond_4

    .line 3685
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeAction()V

    .line 3687
    :cond_4
    return-void

    .line 3661
    :cond_5
    const-string/jumbo v5, "boxAndroidClient_oauth"

    invoke-virtual {p3, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/box/boxandroidlibv2/dao/BoxAndroidOAuthData;

    .line 3662
    .local v3, "oauth":Lcom/box/boxandroidlibv2/dao/BoxAndroidOAuthData;
    invoke-static {p0}, Lcom/aor/droidedit/fs/implementation/box/BoxFileSystem;->getClient(Landroid/content/Context;)Lcom/box/boxjavalibv2/BoxClient;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/box/boxjavalibv2/BoxClient;->authenticate(Lcom/box/boxjavalibv2/interfaces/IAuthData;)V

    .line 3663
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 3665
    .restart local v4    # "prefs":Landroid/content/SharedPreferences;
    :try_start_0
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "box_token"

    new-instance v7, Lcom/box/boxjavalibv2/jsonparsing/BoxJSONParser;

    new-instance v8, Lcom/box/boxandroidlibv2/jsonparsing/AndroidBoxResourceHub;

    invoke-direct {v8}, Lcom/box/boxandroidlibv2/jsonparsing/AndroidBoxResourceHub;-><init>()V

    invoke-direct {v7, v8}, Lcom/box/boxjavalibv2/jsonparsing/BoxJSONParser;-><init>(Lcom/box/boxjavalibv2/interfaces/IBoxResourceHub;)V

    invoke-virtual {v3, v7}, Lcom/box/boxandroidlibv2/dao/BoxAndroidOAuthData;->toJSONString(Lcom/box/boxjavalibv2/interfaces/IBoxJSONParser;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lcom/box/boxjavalibv2/exceptions/BoxJSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3670
    :goto_1
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeAction()V

    goto :goto_0

    .line 3666
    :catch_0
    move-exception v1

    .line 3667
    .local v1, "e":Lcom/box/boxjavalibv2/exceptions/BoxJSONException;
    const-string/jumbo v5, "DroidEdit"

    const-string/jumbo v6, ""

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v1, 0x1

    .line 1920
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    if-eqz v0, :cond_1

    .line 1921
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getWidth()I

    move-result v0

    if-nez v0, :cond_0

    .line 1922
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$52;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/DroidEditActivity$52;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1948
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1949
    return-void

    .line 1931
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v0}, Landroid/widget/SlidingDrawer;->isOpened()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->adjustWrappedTextEditor(Z)V

    .line 1932
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    goto :goto_0

    .line 1935
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getWidth()I

    move-result v0

    if-nez v0, :cond_2

    .line 1936
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/aor/droidedit/DroidEditActivity$53;

    invoke-direct {v1, p0}, Lcom/aor/droidedit/DroidEditActivity$53;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_0

    .line 1944
    :cond_2
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 1780
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->syntax_change:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1781
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->changeSyntax()V

    .line 1782
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->action_bar_create_shortcut:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1783
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->createShortcut()V

    .line 1784
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->action_bar_expand:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1785
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->emmetExpand()V

    .line 1786
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->pref_help:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1787
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/aor/droidedit/custom/HelpPageViewer;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1788
    .local v0, "helpIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 1790
    .end local v0    # "helpIntent":Landroid/content/Intent;
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    sget v2, Lcom/aor/droidedit/lib/R$string;->action_bar_git_actions:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1791
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->showLegacyGitMenu()V

    .line 1793
    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v9, 0xb

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 282
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 284
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 286
    .local v2, "prefs":Landroid/content/SharedPreferences;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v9, :cond_5

    .line 287
    invoke-virtual {p0, v7}, Lcom/aor/droidedit/DroidEditActivity;->requestWindowFeature(I)Z

    .line 294
    :cond_0
    :goto_0
    const-string/jumbo v3, "lineWrap"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 295
    sget v3, Lcom/aor/droidedit/lib/R$layout;->main_window_wrapped:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->setContentView(I)V

    .line 299
    :goto_1
    const-string/jumbo v3, "bugsense"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 300
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->start(Landroid/content/Context;)V

    .line 303
    :cond_1
    sget v3, Lcom/aor/droidedit/lib/R$string;->app_name:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "DroidEdit"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 305
    new-instance v3, Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v3}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;-><init>()V

    invoke-static {v3, v7}, Ljava/security/Security;->insertProviderAt(Ljava/security/Provider;I)I

    .line 308
    :cond_2
    sget v3, Lcom/aor/droidedit/lib/R$id;->textEditor:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/aor/droidedit/custom/ObservableEditText;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    .line 309
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const-string/jumbo v4, "lineWrap"

    invoke-interface {v2, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setWrapped(Z)V

    .line 311
    sget v3, Lcom/aor/droidedit/lib/R$id;->lineNumbers:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    .line 312
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 314
    sget v3, Lcom/aor/droidedit/lib/R$id;->lineDivider:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lineDivider:Landroid/view/View;

    .line 316
    sget v3, Lcom/aor/droidedit/lib/R$id;->progress:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->mProgress:Landroid/widget/ProgressBar;

    .line 318
    sget v3, Lcom/aor/droidedit/lib/R$id;->footer:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->footer:Landroid/widget/TextView;

    .line 319
    sget v3, Lcom/aor/droidedit/lib/R$id;->footer_encoding:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->footerEncoding:Landroid/widget/TextView;

    .line 320
    sget v3, Lcom/aor/droidedit/lib/R$id;->text_info:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    .line 321
    sget v3, Lcom/aor/droidedit/lib/R$id;->footerLayout:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->footerlayout:Landroid/widget/LinearLayout;

    .line 322
    sget v3, Lcom/aor/droidedit/lib/R$id;->documentsFindAnimator:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ViewAnimator;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->docFindAnim:Landroid/widget/ViewAnimator;

    .line 323
    sget v3, Lcom/aor/droidedit/lib/R$id;->mainLayout:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    .line 324
    sget v3, Lcom/aor/droidedit/lib/R$id;->editorInnerLayout:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorInnerLayout:Landroid/widget/LinearLayout;

    .line 325
    sget v3, Lcom/aor/droidedit/lib/R$id;->editorHorizontalLayout:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/HorizontalScrollView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorHorizontalLayout:Landroid/widget/HorizontalScrollView;

    .line 327
    sget v3, Lcom/aor/droidedit/lib/R$id;->SlidingDrawerMenu:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SlidingDrawer;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    .line 329
    sget v3, Lcom/aor/droidedit/lib/R$id;->openFileButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFileButton:Landroid/widget/ImageView;

    .line 330
    sget v3, Lcom/aor/droidedit/lib/R$id;->saveFileButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    .line 331
    sget v3, Lcom/aor/droidedit/lib/R$id;->newFileButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->newFileButton:Landroid/widget/ImageView;

    .line 332
    sget v3, Lcom/aor/droidedit/lib/R$id;->closeFileButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->closeFileButton:Landroid/widget/ImageView;

    .line 333
    sget v3, Lcom/aor/droidedit/lib/R$id;->undoButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->undoButton:Landroid/widget/ImageView;

    .line 334
    sget v3, Lcom/aor/droidedit/lib/R$id;->redoButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->redoButton:Landroid/widget/ImageView;

    .line 335
    sget v3, Lcom/aor/droidedit/lib/R$id;->openFindButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFindButton:Landroid/widget/ImageView;

    .line 336
    sget v3, Lcom/aor/droidedit/lib/R$id;->share:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->shareButton:Landroid/widget/ImageView;

    .line 337
    sget v3, Lcom/aor/droidedit/lib/R$id;->settings:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->settingsButton:Landroid/widget/ImageView;

    .line 339
    sget v3, Lcom/aor/droidedit/lib/R$id;->SlidingDrawer:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/SlidingDrawer;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    .line 340
    sget v3, Lcom/aor/droidedit/lib/R$id;->documentListButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListButton:Landroid/widget/ImageView;

    .line 342
    sget v3, Lcom/aor/droidedit/lib/R$id;->findButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findButton:Landroid/widget/ImageButton;

    .line 343
    sget v3, Lcom/aor/droidedit/lib/R$id;->replaceButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceButton:Landroid/widget/ImageButton;

    .line 344
    sget v3, Lcom/aor/droidedit/lib/R$id;->replaceAllButton:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceAllButton:Landroid/widget/ImageButton;

    .line 345
    sget v3, Lcom/aor/droidedit/lib/R$id;->findEdit:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    .line 346
    sget v3, Lcom/aor/droidedit/lib/R$id;->replaceEdit:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceText:Landroid/widget/EditText;

    .line 347
    sget v3, Lcom/aor/droidedit/lib/R$id;->checkBoxWrap:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ToggleButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleWrap:Landroid/widget/ToggleButton;

    .line 348
    sget v3, Lcom/aor/droidedit/lib/R$id;->checkBoxIgnoreCase:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ToggleButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    .line 349
    sget v3, Lcom/aor/droidedit/lib/R$id;->checkBoxRegularExpression:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ToggleButton;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleRegularExpression:Landroid/widget/ToggleButton;

    .line 351
    sget v3, Lcom/aor/droidedit/lib/R$id;->scrollview:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/aor/droidedit/custom/ObservableScrollView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    .line 352
    sget v3, Lcom/aor/droidedit/lib/R$id;->keyboardLayout:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboardLayout:Landroid/widget/LinearLayout;

    .line 353
    sget v3, Lcom/aor/droidedit/lib/R$id;->keyboard:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/inputmethodservice/KeyboardView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    .line 354
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    new-instance v4, Landroid/inputmethodservice/Keyboard;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/aor/droidedit/lib/R$xml;->keyboard:I

    invoke-direct {v4, v5, v6}, Landroid/inputmethodservice/Keyboard;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3, v4}, Landroid/inputmethodservice/KeyboardView;->setKeyboard(Landroid/inputmethodservice/Keyboard;)V

    .line 356
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$1;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$1;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/SlidingDrawer;->setOnDrawerOpenListener(Landroid/widget/SlidingDrawer$OnDrawerOpenListener;)V

    .line 363
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$2;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$2;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/SlidingDrawer;->setOnDrawerCloseListener(Landroid/widget/SlidingDrawer$OnDrawerCloseListener;)V

    .line 370
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$3;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$3;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/SlidingDrawer;->setOnDrawerOpenListener(Landroid/widget/SlidingDrawer$OnDrawerOpenListener;)V

    .line 377
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$4;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$4;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/SlidingDrawer;->setOnDrawerCloseListener(Landroid/widget/SlidingDrawer$OnDrawerCloseListener;)V

    .line 384
    sget v3, Lcom/aor/droidedit/lib/R$id;->documentList:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    .line 386
    if-eqz p1, :cond_7

    .line 387
    const-string/jumbo v3, "currentDocument"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 388
    const-string/jumbo v3, "openDocuments"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    .line 391
    :goto_2
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/aor/droidedit/lib/R$layout;->document_row:I

    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-direct {v0, v3, v4, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 392
    .local v0, "documentAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 393
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    invoke-virtual {v3, v7}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 395
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$5;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$5;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 402
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v9, :cond_3

    .line 403
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 405
    :cond_3
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$6;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$6;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setTextSelectionListener(Lcom/aor/droidedit/custom/TextSelectionListener;)V

    .line 414
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$7;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$7;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 443
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$8;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$8;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableScrollView;->setScrollViewListener(Lcom/aor/droidedit/custom/ScrollViewListener;)V

    .line 450
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$9;

    invoke-direct {v4, p0, v2}, Lcom/aor/droidedit/DroidEditActivity$9;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/content/SharedPreferences;)V

    invoke-virtual {v3, v4}, Lcom/aor/droidedit/custom/ObservableEditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 830
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->undoButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$10;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$10;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 837
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->redoButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$11;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$11;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 844
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$12;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$12;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 854
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$13;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$13;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 862
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$14;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$14;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 871
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$15;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$15;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 879
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->newFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$16;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$16;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 890
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->newFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$17;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$17;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 899
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->closeFileButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$18;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$18;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 906
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->settingsButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$19;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$19;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 913
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFindButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$20;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$20;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 920
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->openFindButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$21;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$21;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 928
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$22;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$22;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 935
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$23;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$23;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 942
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findText:Landroid/widget/EditText;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$24;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$24;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 958
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceText:Landroid/widget/EditText;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$25;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$25;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 970
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$26;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$26;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 977
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceAllButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$27;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$27;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 984
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->shareButton:Landroid/widget/ImageView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$28;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$28;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 992
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->findButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 993
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 994
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->replaceAllButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 995
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleWrap:Landroid/widget/ToggleButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 996
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleIgnoreCase:Landroid/widget/ToggleButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 997
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->toggleRegularExpression:Landroid/widget/ToggleButton;

    new-instance v4, Lcom/aor/droidedit/util/TooltipListener;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/util/TooltipListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1000
    sget v3, Lcom/aor/droidedit/lib/R$id;->keyboard:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/inputmethodservice/KeyboardView;

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$29;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$29;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/inputmethodservice/KeyboardView;->setOnKeyboardActionListener(Landroid/inputmethodservice/KeyboardView$OnKeyboardActionListener;)V

    const/4 v0, 0x1
    iput-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->showCustomKeyboard()V
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->requestNotifications(Landroid/content/Context;)V

    .line 1048
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$30;

    invoke-direct {v4, p0}, Lcom/aor/droidedit/DroidEditActivity$30;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1056
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->removeTempFiles()V

    .line 1058
    const-string/jumbo v3, "navigation_tip_read"

    invoke-interface {v2, v3, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_4

    .line 1059
    new-instance v1, Lcom/aor/droidedit/custom/MessageBarController;

    sget v3, Lcom/aor/droidedit/lib/R$id;->undobar:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$31;

    invoke-direct {v4, p0, v2}, Lcom/aor/droidedit/DroidEditActivity$31;-><init>(Lcom/aor/droidedit/DroidEditActivity;Landroid/content/SharedPreferences;)V

    invoke-direct {v1, v3, v4}, Lcom/aor/droidedit/custom/MessageBarController;-><init>(Landroid/view/View;Lcom/aor/droidedit/custom/MessageBarController$MessageListener;)V

    .line 1065
    .local v1, "mUndoBarController":Lcom/aor/droidedit/custom/MessageBarController;
    sget v3, Lcom/aor/droidedit/lib/R$string;->navigation_drawer_tip:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v8, v3}, Lcom/aor/droidedit/custom/MessageBarController;->showUndoBar(ZLjava/lang/CharSequence;)V

    .line 1068
    .end local v1    # "mUndoBarController":Lcom/aor/droidedit/custom/MessageBarController;
    :cond_4
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->initializeLeftDrawer()V

    .line 1070
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    iput-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->initialIntent:Landroid/content/Intent;

    .line 1071
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->openFromIntent(Landroid/content/Intent;)V

    .line 1072
    return-void

    .line 289
    .end local v0    # "documentAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/aor/droidedit/document/Document;>;"
    :cond_5
    sget v3, Lcom/aor/droidedit/lib/R$style;->DroidEdit_Theme:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->setTheme(I)V

    .line 290
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_0

    const-string/jumbo v3, "actionBar"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, "splitActionBar"

    invoke-interface {v2, v3, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 291
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/view/Window;->setUiOptions(I)V

    goto/16 :goto_0

    .line 297
    :cond_6
    sget v3, Lcom/aor/droidedit/lib/R$layout;->main_window:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->setContentView(I)V

    goto/16 :goto_1

    .line 389
    :cond_7
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->loadCurrentState()V

    goto/16 :goto_2
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 1767
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/aor/droidedit/lib/R$id;->textEditor:I

    if-ne v0, v1, :cond_1

    .line 1768
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isGitFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1769
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_git_actions:I

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 1770
    :cond_0
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_expand:I

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 1771
    sget v0, Lcom/aor/droidedit/lib/R$string;->syntax_change:I

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 1772
    sget v0, Lcom/aor/droidedit/lib/R$string;->action_bar_create_shortcut:I

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 1773
    sget v0, Lcom/aor/droidedit/lib/R$string;->pref_help:I

    invoke-interface {p1, v2, v2, v2, v0}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 1776
    :goto_0
    return-void

    .line 1775
    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x1

    .line 1492
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-ge v3, v4, :cond_0

    .line 1493
    const/4 v2, 0x0

    .line 1503
    :goto_0
    return v2

    .line 1495
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1496
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 1498
    .local v0, "inflater":Landroid/view/MenuInflater;
    const-string/jumbo v3, "alternativeActionBar"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1499
    sget v3, Lcom/aor/droidedit/lib/R$menu;->alternative_action_bar:I

    invoke-virtual {v0, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    goto :goto_0

    .line 1501
    :cond_1
    sget v3, Lcom/aor/droidedit/lib/R$menu;->action_bar:I

    invoke-virtual {v0, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 2671
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V

    .line 2672
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2673
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 2892
    invoke-direct {p0, p1}, Lcom/aor/droidedit/DroidEditActivity;->openFromIntent(Landroid/content/Intent;)V

    .line 2893
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 13
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v9, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1556
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_text_actions:I

    if-ne v6, v10, :cond_0

    .line 1557
    const-string/jumbo v6, "clipboard"

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1558
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v10

    sget v11, Lcom/aor/droidedit/lib/R$id;->action_cut:I

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v12, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v12}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v12

    if-eq v6, v12, :cond_21

    move v6, v7

    :goto_0
    invoke-direct {p0, v10, v11, v6}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1559
    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v10

    sget v11, Lcom/aor/droidedit/lib/R$id;->action_copy:I

    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v6

    iget-object v12, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v12}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v12

    if-eq v6, v12, :cond_22

    move v6, v7

    :goto_1
    invoke-direct {p0, v10, v11, v6}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1560
    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v10

    sget v11, Lcom/aor/droidedit/lib/R$id;->action_paste:I

    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    if-eqz v6, :cond_23

    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    const-string/jumbo v12, ""

    invoke-virtual {v6, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_23

    move v6, v7

    :goto_2
    invoke-direct {p0, v10, v11, v6}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1561
    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_expand:I

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->canEmmetExpand()Z

    move-result v11

    invoke-direct {p0, v6, v10, v11}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1564
    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1565
    .local v4, "prefs":Landroid/content/SharedPreferences;
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v1

    .line 1566
    .local v1, "document":Lcom/aor/droidedit/document/Document;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_new:I

    if-ne v6, v10, :cond_1

    .line 1567
    const-string/jumbo v6, "selectEncoding"

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 1568
    .local v5, "selectEncoding":Z
    if-eqz v5, :cond_24

    .line 1569
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeNewDocumentEncodingAction()V

    .line 1572
    .end local v5    # "selectEncoding":Z
    :cond_1
    :goto_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_read_only:I

    if-ne v6, v10, :cond_2

    .line 1573
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_25

    move v6, v8

    :goto_4
    invoke-interface {p1, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1574
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1575
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v6, "readOnly"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v10

    invoke-interface {v2, v6, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1576
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1577
    iget-object v10, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_26

    move v6, v8

    :goto_5
    invoke-virtual {v10, v6}, Lcom/aor/droidedit/custom/ObservableEditText;->setEditable(Z)V

    .line 1579
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_writer_mode:I

    if-ne v6, v10, :cond_3

    .line 1580
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_27

    move v6, v8

    :goto_6
    invoke-interface {p1, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1581
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1582
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v6, "spellCheck"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v10

    invoke-interface {v2, v6, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1583
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1584
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSpellCheckerState()V

    .line 1586
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_extra_keys:I

    if-ne v6, v10, :cond_4

    .line 1587
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_28

    move v6, v8

    :goto_7
    invoke-interface {p1, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1588
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1589
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v6, "extraKeys"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v10

    invoke-interface {v2, v6, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1590
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1591
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    .line 1592
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->isVisibleSoftKeyboard()Z

    move-result v6

    if-eqz v6, :cond_29

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->showCustomKeyboard()V

    .line 1595
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_4
    :goto_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_ask_encoding:I

    if-ne v6, v10, :cond_5

    .line 1596
    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_2a

    move v6, v8

    :goto_9
    invoke-interface {p1, v6}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 1597
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1598
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v6, "selectEncoding"

    invoke-interface {p1}, Landroid/view/MenuItem;->isChecked()Z

    move-result v10

    invoke-interface {v2, v6, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1599
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1601
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_open:I

    if-ne v6, v10, :cond_6

    .line 1602
    const-string/jumbo v6, "selectEncoding"

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 1603
    .restart local v5    # "selectEncoding":Z
    if-eqz v5, :cond_2b

    .line 1604
    new-instance v6, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    invoke-direct {v6, p0, v9}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v6}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    .line 1607
    .end local v5    # "selectEncoding":Z
    :cond_6
    :goto_a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_save:I

    if-ne v6, v10, :cond_7

    .line 1608
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1609
    new-instance v10, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v6

    if-nez v6, :cond_2c

    move-object v6, v9

    :goto_b
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v11

    invoke-direct {v10, p0, v1, v6, v11}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v10}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    .line 1612
    :cond_7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v10, Lcom/aor/droidedit/lib/R$id;->action_save_as:I

    if-ne v6, v10, :cond_8

    .line 1613
    new-instance v6, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;

    invoke-direct {v6, p0, v1, v9, v9}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;Lcom/aor/droidedit/fs/implementation/FileSystem;Lcom/aor/droidedit/fs/implementation/FSFile;)V

    invoke-virtual {v6}, Lcom/aor/droidedit/DroidEditActivity$GenericSaveAction;->execute()V

    .line 1614
    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_close:I

    if-ne v6, v9, :cond_9

    .line 1615
    iget v6, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->closeDocument(I)V

    .line 1616
    :cond_9
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_undo:I

    if-ne v6, v9, :cond_a

    .line 1617
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeUndoAction()V

    .line 1618
    :cond_a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_redo:I

    if-ne v6, v9, :cond_b

    .line 1619
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->executeRedoAction()V

    .line 1620
    :cond_b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_select_all:I

    if-ne v6, v9, :cond_c

    .line 1621
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->selectAll()V

    .line 1622
    :cond_c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_cut:I

    if-ne v6, v9, :cond_d

    .line 1623
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->cutText()Z

    .line 1624
    :cond_d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_copy:I

    if-ne v6, v9, :cond_e

    .line 1625
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->copyText()Z

    .line 1626
    :cond_e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_paste:I

    if-ne v6, v9, :cond_f

    .line 1627
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->pasteText()Z

    .line 1628
    :cond_f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_insert_color:I

    if-ne v6, v9, :cond_10

    .line 1629
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->insertColor()V

    .line 1630
    :cond_10
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_indent:I

    if-ne v6, v9, :cond_11

    .line 1631
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    invoke-direct {p0, v6, v7}, Lcom/aor/droidedit/DroidEditActivity;->insertTabRight(Ljava/lang/String;Z)V

    .line 1633
    :cond_11
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_unindent:I

    if-ne v6, v9, :cond_12

    .line 1634
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    invoke-direct {p0, v6, v7}, Lcom/aor/droidedit/DroidEditActivity;->insertTabLeft(Ljava/lang/String;Z)V

    .line 1636
    :cond_12
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_expand:I

    if-ne v6, v9, :cond_13

    .line 1637
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->emmetExpand()V

    .line 1638
    :cond_13
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_find:I

    if-ne v6, v9, :cond_14

    .line 1639
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openFindDialog()V

    .line 1640
    :cond_14
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_goto:I

    if-ne v6, v9, :cond_15

    .line 1641
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openGotoLineDialog()V

    .line 1642
    :cond_15
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_share:I

    if-ne v6, v9, :cond_16

    .line 1643
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->shareDocument()V

    .line 1644
    :cond_16
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_preview:I

    if-ne v6, v9, :cond_17

    .line 1645
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openInBrowser()V

    .line 1646
    :cond_17
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v9, Lcom/aor/droidedit/lib/R$id;->action_run_sl4a_back:I

    if-ne v6, v9, :cond_18

    .line 1647
    invoke-virtual {p0, v8}, Lcom/aor/droidedit/DroidEditActivity;->runInSL4A(Z)V

    .line 1648
    :cond_18
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v8, Lcom/aor/droidedit/lib/R$id;->action_run_sl4a_term:I

    if-ne v6, v8, :cond_19

    .line 1649
    invoke-virtual {p0, v7}, Lcom/aor/droidedit/DroidEditActivity;->runInSL4A(Z)V

    .line 1650
    :cond_19
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_create_shortcut:I

    if-ne v6, v7, :cond_1a

    .line 1651
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->createShortcut()V

    .line 1652
    :cond_1a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_run_external:I

    if-ne v6, v7, :cond_1b

    .line 1653
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->runExternalCommand()V

    .line 1654
    :cond_1b
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_settings:I

    if-ne v6, v7, :cond_1c

    .line 1655
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->openPreferenceScreen()V

    .line 1656
    :cond_1c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_syntax:I

    if-ne v6, v7, :cond_1d

    .line 1657
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->changeSyntax()V

    .line 1658
    :cond_1d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_exit:I

    if-ne v6, v7, :cond_1e

    .line 1659
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->exit()V

    .line 1662
    :cond_1e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_help:I

    if-ne v6, v7, :cond_1f

    .line 1663
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-class v7, Lcom/aor/droidedit/custom/HelpPageViewer;

    invoke-direct {v3, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1664
    .local v3, "helpIntent":Landroid/content/Intent;
    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 1666
    .end local v3    # "helpIntent":Landroid/content/Intent;
    :cond_1f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    sget v7, Lcom/aor/droidedit/lib/R$id;->action_git_actions:I

    if-ne v6, v7, :cond_20

    .line 1667
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->showLegacyGitMenu()V

    .line 1674
    :cond_20
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v6

    return v6

    .end local v1    # "document":Lcom/aor/droidedit/document/Document;
    .end local v4    # "prefs":Landroid/content/SharedPreferences;
    .restart local v0    # "clipboard":Landroid/text/ClipboardManager;
    :cond_21
    move v6, v8

    .line 1558
    goto/16 :goto_0

    :cond_22
    move v6, v8

    .line 1559
    goto/16 :goto_1

    :cond_23
    move v6, v8

    .line 1560
    goto/16 :goto_2

    .line 1570
    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    .restart local v1    # "document":Lcom/aor/droidedit/document/Document;
    .restart local v4    # "prefs":Landroid/content/SharedPreferences;
    .restart local v5    # "selectEncoding":Z
    :cond_24
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v6

    invoke-virtual {v6}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->executeNewDocumentAction(Lcom/aor/droidedit/document/Encoding;)V

    goto/16 :goto_3

    .end local v5    # "selectEncoding":Z
    :cond_25
    move v6, v7

    .line 1573
    goto/16 :goto_4

    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_26
    move v6, v7

    .line 1577
    goto/16 :goto_5

    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_27
    move v6, v7

    .line 1580
    goto/16 :goto_6

    :cond_28
    move v6, v7

    .line 1587
    goto/16 :goto_7

    .line 1593
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_29
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->hideCustomKeyboard()V

    goto/16 :goto_8

    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_2a
    move v6, v7

    .line 1596
    goto/16 :goto_9

    .line 1605
    .restart local v5    # "selectEncoding":Z
    :cond_2b
    new-instance v6, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v10

    invoke-virtual {v10}, Lcom/aor/droidedit/document/Encoding;->clone()Lcom/aor/droidedit/document/Encoding;

    move-result-object v10

    invoke-direct {v6, p0, v10}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Encoding;)V

    invoke-virtual {v6}, Lcom/aor/droidedit/DroidEditActivity$GenericOpenAction;->execute()V

    goto/16 :goto_a

    .line 1609
    .end local v5    # "selectEncoding":Z
    :cond_2c
    invoke-virtual {v1}, Lcom/aor/droidedit/document/Document;->getFile()Lcom/aor/droidedit/fs/implementation/FSFile;

    move-result-object v6

    invoke-virtual {v6}, Lcom/aor/droidedit/fs/implementation/FSFile;->getFileSystem()Lcom/aor/droidedit/fs/implementation/FileSystem;

    move-result-object v6

    goto/16 :goto_b
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 2665
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->saveCurrentState()V

    .line 2666
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2667
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1522
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1524
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 1526
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_ask_encoding:I

    const-string/jumbo v5, "selectEncoding"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->checkAction(Landroid/view/Menu;IZ)V

    .line 1527
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_read_only:I

    const-string/jumbo v5, "readOnly"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->checkAction(Landroid/view/Menu;IZ)V

    .line 1528
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_writer_mode:I

    const-string/jumbo v5, "spellCheck"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->checkAction(Landroid/view/Menu;IZ)V

    .line 1530
    sget v2, Lcom/aor/droidedit/lib/R$string;->app_name:I

    invoke-virtual {p0, v2}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v5, "DroidEdit"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1531
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_extra_keys:I

    invoke-interface {p1, v2}, Landroid/view/Menu;->removeItem(I)V

    .line 1534
    :goto_0
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_extra_keys:I

    sget v5, Lcom/aor/droidedit/lib/R$string;->app_name:I

    invoke-virtual {p0, v5}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "DroidEdit"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1536
    if-nez v0, :cond_1

    .line 1551
    :goto_1
    return v3

    .line 1532
    :cond_0
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_extra_keys:I

    const-string/jumbo v5, "extraKeys"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->checkAction(Landroid/view/Menu;IZ)V

    goto :goto_0

    .line 1538
    :cond_1
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_git_actions:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isGitFile()Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1540
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_undo:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canUndo()Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1541
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_redo:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canRedo()Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1543
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_save:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v5

    invoke-direct {p0, p1, v2, v5}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1544
    sget v5, Lcom/aor/droidedit/lib/R$id;->action_preview:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isDropbox()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "html"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getExtension()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "htm"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isFtp()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    move v2, v3

    :goto_2
    invoke-direct {p0, p1, v5, v2}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1545
    sget v5, Lcom/aor/droidedit/lib/R$id;->action_run_external:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isSftp()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    move v2, v3

    :goto_3
    invoke-direct {p0, p1, v5, v2}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1546
    sget v5, Lcom/aor/droidedit/lib/R$id;->action_share:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    move v2, v3

    :goto_4
    invoke-direct {p0, p1, v5, v2}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1547
    sget v5, Lcom/aor/droidedit/lib/R$id;->action_run_sl4a_back:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_8

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_8

    move v2, v3

    :goto_5
    invoke-direct {p0, p1, v5, v2}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1548
    sget v5, Lcom/aor/droidedit/lib/R$id;->action_run_sl4a_term:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_9

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_9

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_9

    move v2, v3

    :goto_6
    invoke-direct {p0, p1, v5, v2}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    .line 1549
    sget v2, Lcom/aor/droidedit/lib/R$id;->action_create_shortcut:I

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    move v4, v3

    :cond_4
    invoke-direct {p0, p1, v2, v4}, Lcom/aor/droidedit/DroidEditActivity;->enableAction(Landroid/view/Menu;IZ)V

    goto/16 :goto_1

    :cond_5
    move v2, v4

    .line 1544
    goto :goto_2

    :cond_6
    move v2, v4

    .line 1545
    goto :goto_3

    :cond_7
    move v2, v4

    .line 1546
    goto :goto_4

    :cond_8
    move v2, v4

    .line 1547
    goto :goto_5

    :cond_9
    move v2, v4

    .line 1548
    goto :goto_6
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 2711
    const-string/jumbo v0, "currentDocument"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    .line 2712
    const-string/jumbo v0, "openDocuments"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    .line 2713
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->updateEditor(Z)V

    .line 2714
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 2677
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2679
    sget v0, Lcom/aor/droidedit/lib/R$string;->app_name:I

    invoke-virtual {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "DroidEdit"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2694
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

    .line 2697
    :cond_0
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->initialIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/aor/droidedit/DroidEditActivity;->openFromIntent(Landroid/content/Intent;)V

    .line 2698
    :cond_1
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 2702
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionStart()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableEditText;->getSelectionEnd()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/document/Document;->setSelection(II)V

    .line 2703
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableScrollView;->getScrollX()I

    move-result v1

    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->scrollView:Lcom/aor/droidedit/custom/ObservableScrollView;

    invoke-virtual {v2}, Lcom/aor/droidedit/custom/ObservableScrollView;->getScrollY()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/aor/droidedit/document/Document;->setScrollPosition(II)V

    .line 2704
    const-string/jumbo v0, "currentDocument"

    iget v1, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2705
    const-string/jumbo v0, "openDocuments"

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 2706
    return-void
.end method

.method protected onStart()V
    .locals 15

    .prologue
    const/16 v14, 0xb

    const/4 v13, 0x2

    const/16 v12, 0x8

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 2525
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 2527
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 2529
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "themePrefId"

    const-string/jumbo v9, "0"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->changeTheme(Ljava/lang/String;)V

    .line 2530
    const-string/jumbo v6, "fontSize"

    const-string/jumbo v9, "12"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->changeFont(Ljava/lang/String;)V

    .line 2531
    const-string/jumbo v6, "lineNumbers"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-direct {p0, v6, v13}, Lcom/aor/droidedit/DroidEditActivity;->changeLineNumbers(ZI)V

    .line 2532
    const-string/jumbo v6, "syntaxHighlight"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->changeSyntaxHighlighting(Z)V

    .line 2534
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xe

    if-ge v6, v9, :cond_0

    .line 2535
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const-string/jumbo v9, "positionHack"

    invoke-interface {v3, v9, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    invoke-virtual {v6, v9}, Lcom/aor/droidedit/custom/ObservableEditText;->setPositionHack(Z)V

    .line 2537
    :cond_0
    const-string/jumbo v6, "extraKeys"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    .line 2539
    const-string/jumbo v6, "lineWrap"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    .line 2541
    :try_start_0
    const-string/jumbo v6, "highlightSize"

    const-string/jumbo v9, "50"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iput v6, p0, Lcom/aor/droidedit/DroidEditActivity;->highlightSize:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2546
    :goto_0
    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const-string/jumbo v6, "readOnly"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_7

    move v6, v7

    :goto_1
    invoke-virtual {v9, v6}, Lcom/aor/droidedit/custom/ObservableEditText;->setEditable(Z)V

    .line 2548
    sget v6, Lcom/aor/droidedit/lib/R$string;->app_name:I

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v9, "DroidEdit"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    const-string/jumbo v6, "infoPanel"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 2549
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2550
    iput-boolean v8, p0, Lcom/aor/droidedit/DroidEditActivity;->mTextInfo:Z

    .line 2557
    :goto_2
    iget-boolean v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textWrap:Z

    if-eqz v6, :cond_9

    .line 2558
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6}, Landroid/widget/SlidingDrawer;->isOpened()Z

    move-result v6

    invoke-direct {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->adjustWrappedTextEditor(Z)V

    .line 2559
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->isWrapped()Z

    move-result v6

    if-nez v6, :cond_1

    .line 2560
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string/jumbo v9, "Restarting..."

    invoke-static {v6, v9, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 2561
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->finish()V

    .line 2562
    new-instance v6, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-direct {v6, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 2580
    :cond_1
    :goto_3
    :try_start_1
    const-string/jumbo v6, "undoLevel"

    const-string/jumbo v9, "100"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v6}, Lcom/aor/droidedit/document/Document;->setUndoLevel(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 2585
    :goto_4
    const-string/jumbo v6, "spaceTab"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 2587
    :try_start_2
    const-string/jumbo v6, "spaceTabSize"

    const-string/jumbo v9, "2"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 2588
    .local v5, "spaces":I
    if-ge v5, v13, :cond_2

    .line 2589
    const/4 v5, 0x2

    .line 2590
    :cond_2
    if-le v5, v12, :cond_3

    .line 2591
    const/16 v5, 0x8

    .line 2592
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2593
    .local v4, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-lt v2, v5, :cond_b

    .line 2595
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 2603
    .end local v2    # "i":I
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    .end local v5    # "spaces":I
    :goto_6
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v14, :cond_4

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 2604
    new-instance v6, Lcom/aor/droidedit/custom/DocumentAdapter;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    sget v10, Lcom/aor/droidedit/lib/R$layout;->navigation_list:I

    iget-object v11, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-direct {v6, v9, v10, v11}, Lcom/aor/droidedit/custom/DocumentAdapter;-><init>(Landroid/content/Context;ILjava/util/ArrayList;)V

    iput-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    .line 2606
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 2607
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 2609
    const-string/jumbo v6, "actionBarTabs"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 2610
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6, v13}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 2611
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateTabs()V

    .line 2626
    :cond_4
    :goto_7
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v14, :cond_5

    .line 2627
    const-string/jumbo v6, "actionBar"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    if-eqz v6, :cond_f

    .line 2628
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    const-string/jumbo v9, ""

    invoke-virtual {v6, v9}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 2629
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/ActionBar;->show()V

    .line 2630
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v12}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 2632
    const-string/jumbo v6, "hideDocumentList"

    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 2633
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v12}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 2643
    :cond_5
    :goto_8
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xe

    if-lt v6, v9, :cond_6

    const-string/jumbo v6, "lowProfile"

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2644
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->editorOuterLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v8}, Landroid/widget/FrameLayout;->setSystemUiVisibility(I)V

    .line 2646
    :cond_6
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSpellCheckerState()V

    .line 2647
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 2648
    .local v1, "handler":Landroid/os/Handler;
    new-instance v6, Lcom/aor/droidedit/DroidEditActivity$63;

    invoke-direct {v6, p0}, Lcom/aor/droidedit/DroidEditActivity$63;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    .line 2654
    const-wide/16 v8, 0x1f4

    .line 2648
    invoke-virtual {v1, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2656
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->requestReflow()V

    .line 2657
    return-void

    .line 2542
    .end local v1    # "handler":Landroid/os/Handler;
    :catch_0
    move-exception v0

    .line 2543
    .local v0, "e":Ljava/lang/Exception;
    const/16 v6, 0x32

    iput v6, p0, Lcom/aor/droidedit/DroidEditActivity;->highlightSize:I

    goto/16 :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_7
    move v6, v8

    .line 2546
    goto/16 :goto_1

    .line 2553
    :cond_8
    iput-boolean v7, p0, Lcom/aor/droidedit/DroidEditActivity;->mTextInfo:Z

    .line 2554
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textInfo:Landroid/widget/TextView;

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 2566
    :cond_9
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->isWrapped()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 2567
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const-string/jumbo v9, "Restarting..."

    invoke-static {v6, v9, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 2568
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->finish()V

    .line 2569
    new-instance v6, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-direct {v6, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v6}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V

    .line 2571
    :cond_a
    iput v8, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    .line 2572
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->lineNumbers:Landroid/widget/EditText;

    const-string/jumbo v9, "1"

    invoke-virtual {v6, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2573
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6, v7}, Lcom/aor/droidedit/custom/ObservableEditText;->setMinWidth(I)V

    .line 2574
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    const v9, 0x7fffffff

    invoke-virtual {v6, v9}, Lcom/aor/droidedit/custom/ObservableEditText;->setMaxWidth(I)V

    .line 2575
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->requestLayout()V

    .line 2576
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v6}, Lcom/aor/droidedit/custom/ObservableEditText;->invalidate()V

    goto/16 :goto_3

    .line 2581
    :catch_1
    move-exception v0

    .line 2582
    .restart local v0    # "e":Ljava/lang/Exception;
    const/16 v6, 0x64

    invoke-static {v6}, Lcom/aor/droidedit/document/Document;->setUndoLevel(I)V

    goto/16 :goto_4

    .line 2594
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "i":I
    .restart local v4    # "sb":Ljava/lang/StringBuilder;
    .restart local v5    # "spaces":I
    :cond_b
    const/16 v6, 0x20

    :try_start_3
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 2593
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5

    .line 2596
    .end local v2    # "i":I
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    .end local v5    # "spaces":I
    :catch_2
    move-exception v0

    .line 2597
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string/jumbo v6, "  "

    iput-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    goto/16 :goto_6

    .line 2600
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_c
    const-string/jumbo v6, "\t"

    iput-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->tabCharacter:Ljava/lang/String;

    goto/16 :goto_6

    .line 2613
    :cond_d
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 2615
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    iget-object v9, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    new-instance v10, Lcom/aor/droidedit/DroidEditActivity$62;

    invoke-direct {v10, p0}, Lcom/aor/droidedit/DroidEditActivity$62;-><init>(Lcom/aor/droidedit/DroidEditActivity;)V

    invoke-virtual {v6, v9, v10}, Landroid/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    .line 2622
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    sget v9, Lcom/aor/droidedit/lib/R$layout;->navigation_dropdown:I

    invoke-virtual {v6, v9}, Lcom/aor/droidedit/custom/DocumentAdapter;->setDropDownViewResource(I)V

    goto/16 :goto_7

    .line 2634
    :cond_e
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v7}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    goto/16 :goto_8

    .line 2636
    :cond_f
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    if-eqz v6, :cond_10

    .line 2637
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/ActionBar;->hide()V

    .line 2638
    :cond_10
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->menuLayout:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v7}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    .line 2639
    iget-object v6, p0, Lcom/aor/droidedit/DroidEditActivity;->documentListDrawer:Landroid/widget/SlidingDrawer;

    invoke-virtual {v6, v7}, Landroid/widget/SlidingDrawer;->setVisibility(I)V

    goto/16 :goto_8
.end method

.method public replaceOrCreateDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V
    .locals 2
    .param p1, "document"    # Lcom/aor/droidedit/document/Document;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 3715
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->openDocuments:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 3716
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 3717
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/aor/droidedit/DroidEditActivity;->changeDocument(IZ)V

    .line 3718
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1, p2}, Lcom/aor/droidedit/custom/ObservableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 3720
    :goto_0
    return-void

    .line 3719
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/aor/droidedit/DroidEditActivity;->createDocument(Lcom/aor/droidedit/document/Document;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public resumeAction()V
    .locals 1

    .prologue
    .line 3704
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

    if-eqz v0, :cond_0

    .line 3705
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

    invoke-interface {v0}, Lcom/aor/droidedit/DroidEditActivity$Action;->execute()V

    .line 3706
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;

    .line 3708
    :cond_0
    return-void
.end method

.method protected runInSL4A(Z)V
    .locals 5
    .param p1, "terminal"    # Z

    .prologue
    .line 1300
    if-eqz p1, :cond_0

    .line 1301
    new-instance v2, Ljava/io/File;

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/aor/droidedit/sl4a/IntentBuilders;->buildStartInTerminalIntent(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v1

    .line 1304
    .local v1, "intent":Landroid/content/Intent;
    :goto_0
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/aor/droidedit/DroidEditActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1308
    :goto_1
    return-void

    .line 1302
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v3

    invoke-virtual {v3}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/aor/droidedit/sl4a/IntentBuilders;->buildStartInBackgroundIntent(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v1

    .restart local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 1305
    :catch_0
    move-exception v0

    .line 1306
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aor/droidedit/lib/R$string;->external_sl4a_error:I

    invoke-virtual {p0, v3}, Lcom/aor/droidedit/DroidEditActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method public showCustomKeyboard()V
    .locals 2

    .prologue
    .line 3695
    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/inputmethodservice/KeyboardView;->setVisibility(I)V

    .line 3696
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->keyboard:Landroid/inputmethodservice/KeyboardView;

    iget-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->extraKeys:Z

    invoke-virtual {v0, v1}, Landroid/inputmethodservice/KeyboardView;->setEnabled(Z)V

    .line 3697
    return-void

    .line 3695
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method protected syntaxHighlight(IIZ)V
    .locals 4
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "change"    # Z

    .prologue
    const/4 v1, -0x1

    .line 3025
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->syntaxHighlighting:Z

    if-nez v0, :cond_0

    .line 3039
    :goto_0
    return-void

    .line 3027
    :cond_0
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    if-ge p1, v0, :cond_2

    .line 3028
    :cond_1
    iput p1, p0, Lcom/aor/droidedit/DroidEditActivity;->hlStart:I

    .line 3029
    :cond_2
    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    if-le p2, v0, :cond_4

    .line 3030
    :cond_3
    iput p2, p0, Lcom/aor/droidedit/DroidEditActivity;->hlEnd:I

    .line 3031
    :cond_4
    iput-boolean p3, p0, Lcom/aor/droidedit/DroidEditActivity;->hlChange:Z

    .line 3033
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3034
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    if-eqz v0, :cond_5

    .line 3035
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    sget v2, Lcom/aor/droidedit/DroidEditActivity;->AUTODELAY:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 3036
    :cond_5
    if-nez p3, :cond_6

    .line 3037
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    sget v2, Lcom/aor/droidedit/DroidEditActivity;->SCROLLDELAY:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 3038
    :cond_6
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->shTask:Lcom/aor/droidedit/DroidEditActivity$SyntaxHighLight;

    sget v2, Lcom/aor/droidedit/DroidEditActivity;->TYPEDELAY:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method protected updateEditor(Z)V
    .locals 9
    .param p1, "setSelection"    # Z

    .prologue
    const/4 v8, 0x1

    .line 2729
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 2730
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSpellCheckerState()V

    .line 2731
    iput-boolean v8, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2732
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/aor/droidedit/custom/ObservableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 2733
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/aor/droidedit/DroidEditActivity;->autoTextChange:Z

    .line 2735
    if-eqz p1, :cond_0

    .line 2736
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getSelectionStart()I

    move-result v3

    .line 2737
    .local v3, "ss":I
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getSelectionEnd()I

    move-result v2

    .line 2738
    .local v2, "se":I
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 2739
    .local v1, "handler":Landroid/os/Handler;
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v4, v3, v2}, Lcom/aor/droidedit/custom/ObservableEditText;->setSelectionNoHack(II)V

    .line 2740
    new-instance v4, Lcom/aor/droidedit/DroidEditActivity$64;

    invoke-direct {v4, p0, v0}, Lcom/aor/droidedit/DroidEditActivity$64;-><init>(Lcom/aor/droidedit/DroidEditActivity;Lcom/aor/droidedit/document/Document;)V

    .line 2745
    const-wide/16 v6, 0x1f4

    .line 2740
    invoke-virtual {v1, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2748
    .end local v1    # "handler":Landroid/os/Handler;
    .end local v2    # "se":I
    .end local v3    # "ss":I
    :cond_0
    invoke-virtual {p0, v8}, Lcom/aor/droidedit/DroidEditActivity;->updateLineCount(Z)V

    .line 2749
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateUndoRedoState()V

    .line 2750
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateSaveState()V

    .line 2751
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateFooter()V

    .line 2752
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->documentList:Landroid/widget/ListView;

    iget v5, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {v4, v5, v8}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 2753
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_2

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 2754
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ActionBar;->getNavigationMode()I

    move-result v4

    if-ne v4, v8, :cond_1

    .line 2755
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v4

    iget v5, p0, Lcom/aor/droidedit/DroidEditActivity;->currentDocument:I

    invoke-virtual {v4, v5}, Landroid/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 2756
    iget-object v4, p0, Lcom/aor/droidedit/DroidEditActivity;->navigationBarAdapter:Lcom/aor/droidedit/custom/DocumentAdapter;

    invoke-virtual {v4}, Lcom/aor/droidedit/custom/DocumentAdapter;->notifyDataSetChanged()V

    .line 2759
    :cond_1
    :goto_0
    return-void

    .line 2758
    :cond_2
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateTabs()V

    goto :goto_0
.end method

.method protected updateFooter()V
    .locals 7

    .prologue
    .line 2763
    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 2764
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    const-string/jumbo v4, ""

    .line 2765
    .local v4, "title":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_5

    .line 2766
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getName()Ljava/lang/String;

    move-result-object v4

    .line 2768
    :goto_0
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->footer:Landroid/widget/TextView;

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2770
    const/4 v1, 0x0

    .line 2771
    .local v1, "encoding":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->usesBOM()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getJavaEncoding()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/aor/droidedit/document/Encoding;->getDefaultEncoding(Landroid/content/Context;)Lcom/aor/droidedit/document/Encoding;

    move-result-object v6

    invoke-virtual {v6}, Lcom/aor/droidedit/document/Encoding;->getJavaName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2772
    :cond_0
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getHumanEncoding()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2774
    :cond_1
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/aor/droidedit/document/Document;->getSyntaxName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 2776
    .local v3, "syntax":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 2777
    .local v2, "subTitle":Ljava/lang/String;
    if-eqz v1, :cond_2

    if-eqz v3, :cond_2

    .line 2778
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2779
    :cond_2
    if-nez v1, :cond_3

    if-eqz v3, :cond_3

    .line 2780
    move-object v2, v3

    .line 2781
    :cond_3
    if-eqz v1, :cond_4

    if-nez v3, :cond_4

    .line 2782
    move-object v2, v1

    .line 2783
    :cond_4
    iget-object v5, p0, Lcom/aor/droidedit/DroidEditActivity;->footerEncoding:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2785
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v1    # "encoding":Ljava/lang/String;
    .end local v2    # "subTitle":Ljava/lang/String;
    .end local v3    # "syntax":Ljava/lang/String;
    .end local v4    # "title":Ljava/lang/String;
    :goto_1
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->updateTabs()V

    .line 2786
    return-void

    .line 2767
    .restart local v0    # "document":Lcom/aor/droidedit/document/Document;
    .restart local v4    # "title":Ljava/lang/String;
    :cond_5
    :try_start_1
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_0

    .line 2784
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v4    # "title":Ljava/lang/String;
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method protected updateLineCount(Z)V
    .locals 4
    .param p1, "withDelay"    # Z

    .prologue
    .line 3005
    iget-boolean v0, p0, Lcom/aor/droidedit/DroidEditActivity;->updateLineCount:Z

    if-nez v0, :cond_1

    .line 3006
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->editorHorizontalLayout:Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v1}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 3007
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->editorHorizontalLayout:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    .line 3008
    :cond_0
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->textEditor:Lcom/aor/droidedit/custom/ObservableEditText;

    invoke-virtual {v0}, Lcom/aor/droidedit/custom/ObservableEditText;->getLineCount()I

    move-result v0

    iput v0, p0, Lcom/aor/droidedit/DroidEditActivity;->previousLineCount:I

    .line 3015
    :goto_0
    return-void

    .line 3011
    :cond_1
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->ulcTask:Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3012
    if-eqz p1, :cond_2

    .line 3013
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->ulcTask:Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

    sget v2, Lcom/aor/droidedit/DroidEditActivity;->LINECOUNTDELAY:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 3014
    :cond_2
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->ulcTask:Lcom/aor/droidedit/DroidEditActivity$UpdateLineCount;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method protected declared-synchronized updateSaveState()V
    .locals 4

    .prologue
    .line 2474
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 2475
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v1

    .line 2476
    .local v1, "newSaveState":Z
    iget-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lastSaveState:Z

    if-eq v2, v1, :cond_0

    .line 2477
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ActionBar;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2478
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->invalidateOptionsMenu()V

    .line 2492
    :goto_0
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lastSaveState:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2494
    :cond_0
    monitor-exit p0

    return-void

    .line 2480
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2481
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2484
    :goto_1
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->invalidate()V

    .line 2486
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->changed()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 2487
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->shareButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0xff

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2489
    :goto_2
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->shareButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->invalidate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2474
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v1    # "newSaveState":Z
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 2482
    .restart local v0    # "document":Lcom/aor/droidedit/document/Document;
    .restart local v1    # "newSaveState":Z
    :cond_2
    :try_start_2
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->saveFileButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_1

    .line 2488
    :cond_3
    iget-object v2, p0, Lcom/aor/droidedit/DroidEditActivity;->shareButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method protected declared-synchronized updateUndoRedoState()V
    .locals 6

    .prologue
    const/16 v5, 0xb

    .line 2497
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/aor/droidedit/DroidEditActivity;->getCurrentDocument()Lcom/aor/droidedit/document/Document;

    move-result-object v0

    .line 2498
    .local v0, "document":Lcom/aor/droidedit/document/Document;
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canUndo()Z

    move-result v2

    .line 2499
    .local v2, "newUndoState":Z
    iget-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lastUndoState:Z

    if-eq v2, v3, :cond_0

    .line 2500
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v5, :cond_2

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ActionBar;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2501
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->invalidateOptionsMenu()V

    .line 2507
    :goto_0
    iput-boolean v2, p0, Lcom/aor/droidedit/DroidEditActivity;->lastUndoState:Z

    .line 2510
    :cond_0
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canRedo()Z

    move-result v1

    .line 2511
    .local v1, "newRedoState":Z
    iget-boolean v3, p0, Lcom/aor/droidedit/DroidEditActivity;->lastRedoState:Z

    if-eq v1, v3, :cond_1

    .line 2512
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v5, :cond_4

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ActionBar;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2513
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->invalidateOptionsMenu()V

    .line 2519
    :goto_1
    iput-boolean v1, p0, Lcom/aor/droidedit/DroidEditActivity;->lastRedoState:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2521
    :cond_1
    monitor-exit p0

    return-void

    .line 2503
    .end local v1    # "newRedoState":Z
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canUndo()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->undoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2505
    :goto_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->undoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->invalidate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2497
    .end local v0    # "document":Lcom/aor/droidedit/document/Document;
    .end local v2    # "newUndoState":Z
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 2504
    .restart local v0    # "document":Lcom/aor/droidedit/document/Document;
    .restart local v2    # "newUndoState":Z
    :cond_3
    :try_start_2
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->undoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 v4, 0x50

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_2

    .line 2515
    .restart local v1    # "newRedoState":Z
    :cond_4
    invoke-virtual {v0}, Lcom/aor/droidedit/document/Document;->canRedo()Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->redoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 2517
    :goto_3
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->redoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->invalidate()V

    goto :goto_1

    .line 2516
    :cond_5
    iget-object v3, p0, Lcom/aor/droidedit/DroidEditActivity;->redoButton:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 v4, 0x50

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3
.end method

.method public cancelCompatAction()V
    .locals 2
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    instance-of v1, v0, Lcom/code/ide/compat/RetryListing;
    if-eqz v1, :compat_cancel_done
    check-cast v0, Lcom/code/ide/compat/RetryListing;
    invoke-virtual {v0}, Lcom/code/ide/compat/RetryListing;->cancel()V
    :compat_cancel_done
    const/4 v0, 0x0
    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    const-string v0, "Brak uprawnienia. Nadaj dostęp i ponów operację."
    const/4 v1, 0x1
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    const/16 v0, 0x53a1
    if-eq p1, v0, :storage
    const/16 v0, 0x53a2
    if-ne p1, v0, :done
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->hasLan(Landroid/content/Context;)Z
    move-result v0
    goto :checked
    :storage
    invoke-static {p0}, Lcom/code/ide/compat/StorageAccess;->hasStorage(Landroid/content/Context;)Z
    move-result v0
    :checked
    if-eqz v0, :denied
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->resumeCompatAction()V
    goto :done
    :denied
    invoke-virtual {p0}, Lcom/aor/droidedit/DroidEditActivity;->cancelCompatAction()V
    :done
    return-void
.end method

.method public saveCompatAction()V
    .locals 1
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    iput-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    return-void
.end method

.method public resumeCompatAction()V
    .locals 2
    iget-object v0, p0, Lcom/aor/droidedit/DroidEditActivity;->compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    const/4 v1, 0x0
    iput-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->compatWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    iput-object v1, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    if-eqz v0, :done
    invoke-interface {v0}, Lcom/aor/droidedit/DroidEditActivity$Action;->execute()V
    :done
    return-void
.end method

.method public setCompatAction(Lcom/aor/droidedit/DroidEditActivity$Action;)V
    .locals 0
    iput-object p1, p0, Lcom/aor/droidedit/DroidEditActivity;->mWaitingAction:Lcom/aor/droidedit/DroidEditActivity$Action;
    return-void
.end method
