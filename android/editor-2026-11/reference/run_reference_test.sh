#!/bin/sh
# Test różnicowy: PieceTableEditable (port) vs oryginalny SpannableStringBuilder z AOSP, na JVM.
# Zmienna: ANDROID_JAR. Wynik: WSZYSTKIE OK albo opis pierwszej różnicy.
set -e
HERE=$(cd "$(dirname "$0")" && pwd)
SRC="$HERE/../src/com/code/ide/compat"
WORK=${WORK:-$HERE/../../build/editor-2026-11/reference}
ANDROID_JAR=${ANDROID_JAR:?ustaw ANDROID_JAR}
export ANDROID_JAR
mkdir -p "$WORK"
python3 "$HERE/make_reference.py" "$WORK"
# generator portu musi dawać dokładnie to, co leży w src/
mkdir -p "$WORK/regen" && python3 "$HERE/port_ssb.py" "$WORK/aosp" "$WORK/regen" >/dev/null
diff "$WORK/regen/PieceTableEditable.java" "$SRC/PieceTableEditable.java"
diff "$WORK/regen/Grow.java" "$SRC/Grow.java"
rm -rf "$WORK/mine_out" "$WORK/test_out" && mkdir "$WORK/mine_out" "$WORK/test_out"
javac -nowarn -proc:none -cp "$WORK/shim_out:$ANDROID_JAR" -d "$WORK/mine_out" "$SRC/PieceTable.java" "$SRC/PieceTableEditable.java" "$SRC/Grow.java"
javac -nowarn -proc:none -cp "$WORK/shim_out:$WORK/mine_out:$ANDROID_JAR" -d "$WORK/test_out" "$HERE/EditableDiffTest.java"
CP="$WORK/test_out:$WORK/mine_out:$WORK/shim_out:$ANDROID_JAR"
java -Dfile.encoding=UTF-8 -cp "$CP" EditableDiffTest
java -Dseeds=6 -Dsteps=6000 -Dinit=20000 -Dfile.encoding=UTF-8 -cp "$CP" EditableDiffTest
