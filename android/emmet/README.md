# Emmet 2.4.11 for Code IDE

The Pro editor now expands abbreviations with the official MIT-licensed Emmet
core instead of the old Java XML subset. The bundled script runs offline in an
isolated Android WebView. The existing menu action and Ctrl+Space call the bridge.
The base activity's existing premium flow is unchanged.

Supported modes: HTML and HTML template modes, XHTML, XML/XSL/SVG, CSS/SCSS/Sass/
Stylus, JSX/TSX, and untyped text (HTML). Actual availability of language modes is
controlled by the app's syntax catalog. HTML context detection is intentionally
lightweight: style blocks/attributes, comments, scripts and implicit parent tags.
This is abbreviation expansion, not the full Emmet editor command suite.

The adapter preserves indentation and CRLF, replaces a selected abbreviation or
extracts one at the caret, and selects the first editable field. It supports Tab/Shift+Tab navigation and locally stored custom snippets from the
editor menu. Completion suggestions and linked-field mirroring are not implemented.
The bridge cancels stale results after editing, changing selection/document,
pausing or destroying the activity. Limits: 512 Ki UTF-16 code units per document,
4096 per abbreviation, 256 Ki output, bounded repetitions and a 10-second timeout.
No JavaScript interface, file/content access, remote scripts or network requests.

## Rebuild the JS bundle

Requires Node.js/npm. From this directory:

```sh
npm ci --ignore-scripts --no-audit --no-fund
npm run build
npm test
```

The build writes `../overlay/assets/emmet/emmet.js` and the upstream MIT LICENSE.
An alternate asset output directory can be passed to `node build.cjs PATH`.
An alternate bundle can be tested with `node test.cjs PATH/emmet.js`.

## Rebuild the Android bridge

The readable source is `src/com/code/ide/compat/EmmetBridge.java`.
Use JDK 8-compatible compilation, Android API 21 or later, Android D8 and baksmali:

```sh
javac --release 8 -cp "$ANDROID_JAR" -d build/classes src/com/code/ide/compat/EmmetBridge.java
java -cp "$R8_JAR" com.android.tools.r8.D8 --min-api 26 --lib "$ANDROID_JAR" --output build/dex build/classes/com/code/ide/compat/*.class
java -cp "$BAKSMALI_CLASSPATH" org.jf.baksmali.Main d build/dex/classes.dex -o build/smali
```

Create output directories first. Copy generated `com/code/ide/compat/EmmetBridge*.smali`
to the overlay's `smali/` tree. The overlay also contains the actual Pro activity
integration, lifecycle hooks in the base activity, localized strings and help.
Apply the overlay to the matching decoded APK, rebuild with Apktool 2.12.1 and
sign with the existing application key (not included here).

Release: versionCode 20260925, versionName `Expressive You - Editor 20260922`.
Validation: 43 JS regression cases, help/delegate integrity, APK resource/dex rebuild,
asset comparison and signing verification. Android device installation, WebView
execution and interaction with the editor's undo stack still need device testing.

Additional Android sources: see android/improvements/src (AppUi, EmmetFields, EmmetSnippets, FieldRanges, AtomicStore, StateIo, RecoveryTicker). Compile these together with EmmetBridge.
