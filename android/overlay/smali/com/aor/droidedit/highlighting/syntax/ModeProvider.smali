.class public Lcom/aor/droidedit/highlighting/syntax/ModeProvider;
.super Ljava/lang/Object;
.source "ModeProvider.java"


# static fields
.field public static instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;


# instance fields
.field private final modes:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/aor/droidedit/highlighting/base/Mode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    invoke-direct {v0}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;-><init>()V

    sput-object v0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->instance:Lcom/aor/droidedit/highlighting/syntax/ModeProvider;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0xb4

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    .line 55
    return-void
.end method


# virtual methods
.method public addMode(Lcom/aor/droidedit/highlighting/base/Mode;)V
    .locals 2
    .param p1, "mode"    # Lcom/aor/droidedit/highlighting/base/Mode;

    .prologue
    .line 181
    invoke-virtual {p1}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    iget-object v1, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    return-void
.end method

.method protected error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 268
    const-string/jumbo v0, "ERROR"

    invoke-static {v0, p0, p2}, Lcom/aor/droidedit/highlighting/base/Logger;->log(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 269
    return-void
.end method

.method public getMode(Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/aor/droidedit/highlighting/base/Mode;

    return-object v0
.end method

.method public getModeForFile(Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "firstLine"    # Ljava/lang/String;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->getModeForFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;

    move-result-object v0

    return-object v0
.end method

.method public getModeForFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/aor/droidedit/highlighting/base/Mode;
    .locals 6
    .param p1, "filepath"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "firstLine"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 102
    if-eqz p1, :cond_0

    const-string/jumbo v2, ".gz"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 104
    :cond_0
    if-eqz p2, :cond_1

    const-string/jumbo v2, ".gz"

    invoke-virtual {p2, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 105
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    invoke-virtual {p2, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 107
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 108
    .local v0, "acceptable":Ljava/util/List;, "Ljava/util/List<Lcom/aor/droidedit/highlighting/base/Mode;>;"
    iget-object v2, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_3

    .line 115
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v5, :cond_4

    .line 117
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/highlighting/base/Mode;

    move-object v1, v2

    .line 158
    :goto_1
    return-object v1

    .line 108
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/aor/droidedit/highlighting/base/Mode;

    .line 110
    .local v1, "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v1, p1, p2, p3}, Lcom/aor/droidedit/highlighting/base/Mode;->accept(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 112
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 119
    .end local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v5, :cond_b

    .line 123
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 128
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_8

    .line 138
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_9

    .line 147
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_a

    .line 155
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/aor/droidedit/highlighting/base/Mode;

    move-object v1, v2

    goto :goto_1

    .line 128
    :cond_8
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/aor/droidedit/highlighting/base/Mode;

    .line 130
    .restart local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v1, p1, p2}, Lcom/aor/droidedit/highlighting/base/Mode;->acceptIdentical(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_1

    .line 138
    .end local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/aor/droidedit/highlighting/base/Mode;

    .line 140
    .restart local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v1, p1, p2}, Lcom/aor/droidedit/highlighting/base/Mode;->acceptFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 141
    invoke-virtual {v1, p3}, Lcom/aor/droidedit/highlighting/base/Mode;->acceptFirstLine(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto :goto_1

    .line 147
    .end local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/aor/droidedit/highlighting/base/Mode;

    .line 149
    .restart local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v1, p1, p2}, Lcom/aor/droidedit/highlighting/base/Mode;->acceptFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_1

    .line 158
    .end local v1    # "mode":Lcom/aor/droidedit/highlighting/base/Mode;
    :cond_b
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getModes()[Lcom/aor/droidedit/highlighting/base/Mode;
    .locals 5
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    iget-object v1, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :loop
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :done
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v2}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "common-"
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :loop
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :loop
    :done
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    move-result v1
    new-array v1, v1, [Lcom/aor/droidedit/highlighting/base/Mode;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Lcom/aor/droidedit/highlighting/base/Mode;
    return-object v0
.end method

.method public loadMode(Landroid/content/Context;Lcom/aor/droidedit/highlighting/base/Mode;Lcom/aor/droidedit/highlighting/syntax/XModeHandler;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mode"    # Lcom/aor/droidedit/highlighting/base/Mode;
    .param p3, "xmh"    # Lcom/aor/droidedit/highlighting/syntax/XModeHandler;

    .prologue
    .line 193
    const-string/jumbo v8, "file"

    invoke-virtual {p2, v8}, Lcom/aor/droidedit/highlighting/base/Mode;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 195
    .local v1, "fileName":Ljava/lang/String;
    const-string/jumbo v8, "NOTICE"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "Loading edit mode "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, p0, v9}, Lcom/aor/droidedit/highlighting/base/Logger;->log(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 200
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v6

    .line 201
    .local v6, "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v6}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v4

    .line 202
    .local v4, "newSAXParser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 210
    .local v5, "parser":Lorg/xml/sax/XMLReader;
    invoke-virtual {p3}, Lcom/aor/droidedit/highlighting/syntax/XModeHandler;->getTokenMarker()Lcom/aor/droidedit/highlighting/syntax/TokenMarker;

    move-result-object v8

    invoke-virtual {p2, v8}, Lcom/aor/droidedit/highlighting/base/Mode;->setTokenMarker(Lcom/aor/droidedit/highlighting/syntax/TokenMarker;)V

    .line 216
    :try_start_1
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "syntax/"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 224
    .local v2, "grammar":Ljava/io/InputStream;
    :try_start_2
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 226
    .local v3, "isrc":Lorg/xml/sax/InputSource;
    invoke-interface {v5, p3}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 227
    invoke-interface {v5, p3}, Lorg/xml/sax/XMLReader;->setDTDHandler(Lorg/xml/sax/DTDHandler;)V

    .line 228
    invoke-interface {v5, p3}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 229
    invoke-interface {v5, p3}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 230
    invoke-interface {v5, v3}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 232
    invoke-virtual {p3}, Lcom/aor/droidedit/highlighting/syntax/XModeHandler;->getModeProperties()Ljava/util/Hashtable;

    move-result-object v8

    invoke-virtual {p2, v8}, Lcom/aor/droidedit/highlighting/base/Mode;->setProperties(Ljava/util/Map;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3

    .line 238
    .end local v2    # "grammar":Ljava/io/InputStream;
    .end local v3    # "isrc":Lorg/xml/sax/InputSource;
    .end local v4    # "newSAXParser":Ljavax/xml/parsers/SAXParser;
    .end local v5    # "parser":Lorg/xml/sax/XMLReader;
    .end local v6    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v7

    .line 204
    .local v7, "saxe":Lorg/xml/sax/SAXException;
    const-string/jumbo v8, "DroidEdit"

    const-string/jumbo v9, ""

    invoke-static {v8, v9, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 206
    .end local v7    # "saxe":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v0

    .line 207
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    const-string/jumbo v8, "DroidEdit"

    const-string/jumbo v9, ""

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 217
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v4    # "newSAXParser":Ljavax/xml/parsers/SAXParser;
    .restart local v5    # "parser":Lorg/xml/sax/XMLReader;
    .restart local v6    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :catch_2
    move-exception v0

    .line 218
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "DroidEdit"

    const-string/jumbo v9, ""

    invoke-static {v8, v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 234
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "grammar":Ljava/io/InputStream;
    :catch_3
    move-exception v8

    goto :goto_0
.end method

.method public loadMode(Lcom/aor/droidedit/highlighting/base/Mode;Landroid/content/Context;)V
    .locals 2
    .param p1, "mode"    # Lcom/aor/droidedit/highlighting/base/Mode;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 243
    new-instance v0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider$1;

    invoke-virtual {p1}, Lcom/aor/droidedit/highlighting/base/Mode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1, p2, p2}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider$1;-><init>(Lcom/aor/droidedit/highlighting/syntax/ModeProvider;Ljava/lang/String;Landroid/content/Context;Landroid/content/Context;)V

    .line 262
    .local v0, "xmh":Lcom/aor/droidedit/highlighting/syntax/XModeHandler;
    invoke-virtual {p0, p2, p1, v0}, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->loadMode(Landroid/content/Context;Lcom/aor/droidedit/highlighting/base/Mode;Lcom/aor/droidedit/highlighting/syntax/XModeHandler;)V

    .line 263
    return-void
.end method

.method public removeAll()V
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/aor/droidedit/highlighting/syntax/ModeProvider;->modes:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 65
    return-void
.end method
