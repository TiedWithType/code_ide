#!/bin/sh
# Kompiluje src/ -> $OUT/classes2.dex (Java --release 8, dx --min-sdk-version=26).
# Zmienne: ANDROID_JAR (android.jar, API >= 23), DX (domyślnie dalvik-exchange), OUT (katalog wyjściowy).
set -e
HERE=$(cd "$(dirname "$0")" && pwd)
OUT=${OUT:-$HERE/../build/editor-2026-11}
ANDROID_JAR=${ANDROID_JAR:?ustaw ANDROID_JAR (android.jar)}
DX=${DX:-dalvik-exchange}
rm -rf "$OUT/stub_out" "$OUT/java_out" && mkdir -p "$OUT/stub_out" "$OUT/java_out"
javac --release 8 -nowarn -encoding UTF-8 -cp "$ANDROID_JAR" -d "$OUT/stub_out" $(find "$HERE/stubs" -name '*.java')
javac --release 8 -nowarn -encoding UTF-8 -cp "$ANDROID_JAR:$OUT/stub_out" -d "$OUT/java_out" $(find "$HERE/src" -name '*.java')
rm -f "$OUT/classes2.dex"
"$DX" --dex --min-sdk-version=26 --output="$OUT/classes2.dex" "$OUT/java_out"
echo "classes2.dex: $OUT/classes2.dex"
