.class public final Lcom/aor/droidedit/RecoverySaveTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private owner:Lcom/aor/droidedit/DroidEditActivity;
.method public constructor <init>(Lcom/aor/droidedit/DroidEditActivity;)V
 .locals 0
 invoke-direct {p0}, Ljava/lang/Object;-><init>()V
 iput-object p1, p0, Lcom/aor/droidedit/RecoverySaveTask;->owner:Lcom/aor/droidedit/DroidEditActivity;
 return-void
.end method
.method public run()V
 .locals 1
 iget-object v0, p0, Lcom/aor/droidedit/RecoverySaveTask;->owner:Lcom/aor/droidedit/DroidEditActivity;
 invoke-virtual {v0}, Lcom/aor/droidedit/DroidEditActivity;->compatCheckpoint()V
 return-void
.end method
