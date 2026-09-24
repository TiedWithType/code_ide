#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PROJECT="${1:-$ROOT/android/build/project}"
: "${ANDROID_JAR:?Set ANDROID_JAR to android.jar (API 21+)}"
: "${R8_JAR:?Set R8_JAR to an R8/D8 jar}"
: "${BAKSMALI_CLASSPATH:?Set BAKSMALI_CLASSPATH to the baksmali classpath}"

[[ -d "$PROJECT" ]] || { echo "Missing Apktool project: $PROJECT" >&2; exit 2; }

# Resources/help specific to Assist.
cp -R "$ROOT/android/assist/res/." "$PROJECT/res/"
mkdir -p "$PROJECT/assets/help/pages"
cp "$ROOT/android/assist/assets/help/pages/emmet.html" "$PROJECT/assets/help/pages/emmet.html"

# Rebuild the offline Emmet bundle from pinned sources.
(
  cd "$ROOT/android/emmet"
  npm ci --ignore-scripts --no-audit --no-fund
  node build.cjs "$PROJECT/assets/emmet"
  node test.cjs "$PROJECT/assets/emmet/emmet.js"
)
node "$ROOT/android/improvements/suggestions.test.cjs" "$PROJECT/assets/emmet/emmet.js"

# Rebuild all readable compatibility helpers and overwrite generated helper smali.
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/classes" "$TMP/dex" "$TMP/smali"
mapfile -t SOURCES < <(find "$ROOT/android/improvements/src" -name '*.java' -type f -print)
SOURCES+=("$ROOT/android/emmet/src/com/code/ide/compat/EmmetBridge.java")
javac --release 8 -cp "$ANDROID_JAR" -d "$TMP/classes" "${SOURCES[@]}"
jar cf "$TMP/helpers.jar" -C "$TMP/classes" .
java -cp "$R8_JAR" com.android.tools.r8.D8 --min-api 26 --lib "$ANDROID_JAR" --output "$TMP/dex" "$TMP/helpers.jar"
java -cp "$BAKSMALI_CLASSPATH" org.jf.baksmali.Main d "$TMP/dex/classes.dex" -o "$TMP/smali"
mkdir -p "$PROJECT/smali/com/code/ide"
rm -rf "$PROJECT/smali/com/code/ide/compat"
cp -R "$TMP/smali/com/code/ide/compat" "$PROJECT/smali/com/code/ide/compat"

python "$ROOT/android/improvements/apply_assist.py" "$PROJECT"
echo "Assist sources prepared in: $PROJECT"
