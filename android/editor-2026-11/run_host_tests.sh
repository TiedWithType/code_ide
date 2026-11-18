#!/bin/sh
# Testy hosta linii 2026.11 (JVM, bez urządzenia). Zmienne: ANDROID_JAR, JSON_JAR (org.json dla JVM).
set -e
HERE=$(cd "$(dirname "$0")" && pwd)
OUT=${OUT:-$HERE/../build/editor-2026-11/host}
ANDROID_JAR=${ANDROID_JAR:?ustaw ANDROID_JAR}
JSON_JAR=${JSON_JAR:-/usr/share/java/com.android.json-android-10.0.0.jar}
SRC="$HERE/src/com/code/ide/compat"; TST="$HERE/test/com/code/ide/compat"
rm -rf "$OUT" && mkdir -p "$OUT"
javac -nowarn -encoding UTF-8 -cp "$JSON_JAR" -d "$OUT" "$SRC/SnippetData.java" "$TST/SnippetDataTest.java"
echo "== SnippetData (JSON v1/v2/Emmet, BOM, scalanie, pola poza {})"; java -Dfile.encoding=UTF-8 -cp "$OUT:$JSON_JAR" com.code.ide.compat.SnippetDataTest | grep -E "FAIL|WSZYSTKIE|BŁĘD"
javac -nowarn -encoding UTF-8 -d "$OUT" "$SRC/PieceTable.java" "$TST/PieceTableTest.java"
echo "== PieceTable (40 ziaren x 4000 operacji, serializacja, plik stanu)"; java -Dfile.encoding=UTF-8 -cp "$OUT" com.code.ide.compat.PieceTableTest | grep -E "FAIL|WSZYSTKIE|BŁĘD"
javac -nowarn -encoding UTF-8 -cp "$ANDROID_JAR" -d "$OUT" "$SRC/LargeFileGuard.java" "$TST/LargeFileGuardTest.java"
echo "== LargeFileGuard (normalizacja, limity, pamięć)"; java -Xmx96m -Dfile.encoding=UTF-8 -cp "$OUT:$ANDROID_JAR" com.code.ide.compat.LargeFileGuardTest | grep -E "FAIL|WSZYSTKIE|BŁĘD"
echo "== PieceTableEditable vs AOSP (test różnicowy)"; "$HERE/reference/run_reference_test.sh" | grep -E "FAIL|WSZYSTKIE|BŁĘD|differ"
