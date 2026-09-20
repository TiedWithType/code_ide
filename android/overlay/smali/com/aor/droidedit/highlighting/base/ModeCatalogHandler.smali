.class public Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ModeCatalogHandler.java"


# instance fields
.field private directory:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "directory"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;->directory:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public instantiateMode(Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;
    .locals 1
    .param p1, "modeName"    # Ljava/lang/String;

    .prologue
    .line 90
    new-instance v0, Lcom/aor/droidedit/highlighting/base/Mode;

    invoke-direct {v0, p1}, Lcom/aor/droidedit/highlighting/base/Mode;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 2
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    .line 47
    const-string/jumbo v0, "catalog.dtd"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/aor/droidedit/highlighting/util/XMLUtilities;->findEntity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 9
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 54
    const-string/jumbo v6, "MODE"

    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 56
    const-string/jumbo v6, "NAME"

    invoke-interface {p4, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "modeName":Ljava/lang/String;
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual {v4, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v4

    const-string/jumbo v6, "FILE"

    invoke-interface {p4, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "file":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 61
    const-string/jumbo v6, "ERROR"

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;->directory:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "catalog:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 62
    const-string/jumbo v8, " mode "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " doesn\'t have"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 63
    const-string/jumbo v8, " a FILE attribute"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 61
    invoke-static {v6, p0, v7}, Lcom/aor/droidedit/highlighting/base/Logger;->log(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    :cond_0
    const-string/jumbo v6, "FILE_NAME_GLOB"

    invoke-interface {p4, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "filenameGlob":Ljava/lang/String;
    const-string/jumbo v6, "FIRST_LINE_GLOB"

    invoke-interface {p4, v6}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "firstlineGlob":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;->instantiateMode(Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v3

    .line 71
    .local v3, "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    sget-object v6, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-virtual {v6, v3}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->addMode(Lcom/aor/droidedit/highlighting/base/Mode;)V

    .line 73
    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/aor/droidedit/highlighting/base/ModeCatalogHandler;->directory:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 74
    .local v5, "path":Ljava/lang/String;
    const-string/jumbo v6, "file"

    invoke-virtual {v3, v6, v5}, Lcom/aor/droidedit/highlighting/base/Mode;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    const-string/jumbo v6, "filenameGlob"

    invoke-virtual {v3, v6}, Lcom/aor/droidedit/highlighting/base/Mode;->unsetProperty(Ljava/lang/String;)V

    .line 77
    if-eqz v1, :cond_1

    .line 78
    const-string/jumbo v6, "filenameGlob"

    invoke-virtual {v3, v6, v1}, Lcom/aor/droidedit/highlighting/base/Mode;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    :cond_1
    const-string/jumbo v6, "firstlineGlob"

    invoke-virtual {v3, v6}, Lcom/aor/droidedit/highlighting/base/Mode;->unsetProperty(Ljava/lang/String;)V

    .line 81
    if-eqz v2, :cond_2

    .line 82
    const-string/jumbo v6, "firstlineGlob"

    invoke-virtual {v3, v6, v2}, Lcom/aor/droidedit/highlighting/base/Mode;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    :cond_2
    invoke-virtual {v3}, Lcom/aor/droidedit/highlighting/base/Mode;->init()V

    .line 86
    .end local v0    # "file":Ljava/lang/String;
    .end local v1    # "filenameGlob":Ljava/lang/String;
    .end local v2    # "firstlineGlob":Ljava/lang/String;
    .end local v3    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    .end local v4    # "modeName":Ljava/lang/String;
    .end local v5    # "path":Ljava/lang/String;
    :cond_3
    return-void
.end method
