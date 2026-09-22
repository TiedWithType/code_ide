.class Lcom/aor/droidedit/preferences/Preferences$2;
.super Ljava/lang/Object;
.source "Preferences.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aor/droidedit/preferences/Preferences;->createPreferenceHierarchy(Landroid/preference/PreferenceScreen;)Landroid/preference/PreferenceScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/aor/droidedit/preferences/Preferences;


# direct methods
.method constructor <init>(Lcom/aor/droidedit/preferences/Preferences;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/aor/droidedit/preferences/Preferences$2;->this$0:Lcom/aor/droidedit/preferences/Preferences;

    .line 520
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/aor/droidedit/preferences/Preferences$2;)Lcom/aor/droidedit/preferences/Preferences;
    .locals 1

    .prologue
    .line 520
    iget-object v0, p0, Lcom/aor/droidedit/preferences/Preferences$2;->this$0:Lcom/aor/droidedit/preferences/Preferences;

    return-object v0
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 523
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/aor/droidedit/preferences/Preferences$2;->this$0:Lcom/aor/droidedit/preferences/Preferences;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 524
    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_feature:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 525
    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_external_summary:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 526
    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_upgrade:I

    new-instance v2, Lcom/aor/droidedit/preferences/Preferences$2$1;

    invoke-direct {v2, p0}, Lcom/aor/droidedit/preferences/Preferences$2$1;-><init>(Lcom/aor/droidedit/preferences/Preferences$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 536
    sget v1, Lcom/aor/droidedit/lib/R$string;->premium_no_thanks:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {v0}, Lcom/code/ide/compat/AppUi;->show(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    .line 537
    const/4 v0, 0x0

    return v0
.end method
