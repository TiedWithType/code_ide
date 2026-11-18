#!/bin/sh
# Składa podpisany APK z drzewa Apktool (po apply_editor_20261117.py) i classes2.dex.
# Użycie: build_editor.sh <drzewo_apktool> <wynik.apk>
# Zmienne: APKTOOL_JAR, SIGN_KEY (pk8), SIGN_CERT (pem), opcjonalnie OUT (jak w build_java.sh).
# Klucze NIE należą do repozytorium (reguły.md, pkt 5): podaj je z własnego miejsca.
set -e
HERE=$(cd "$(dirname "$0")" && pwd)
OUT=${OUT:-$HERE/../build/editor-2026-11}
TREE=${1:?podaj drzewo Apktool}; APK=${2:?podaj plik wynikowy}
APKTOOL_JAR=${APKTOOL_JAR:?ustaw APKTOOL_JAR}
SIGN_KEY=${SIGN_KEY:?ustaw SIGN_KEY (key.pk8)}; SIGN_CERT=${SIGN_CERT:?ustaw SIGN_CERT (cert.pem)}
"$HERE/build_java.sh"
TMP=$(mktemp -d)
java -jar "$APKTOOL_JAR" b "$TREE" -o "$TMP/unsigned.apk"
cp "$TMP/unsigned.apk" "$TMP/dex.apk"
(cd "$OUT" && zip -q -0 "$TMP/dex.apk" classes2.dex)
zipalign -p -f 4 "$TMP/dex.apk" "$TMP/aligned.apk"
rm -f "$APK"
apksigner sign --min-sdk-version 31 --key "$SIGN_KEY" --cert "$SIGN_CERT" --out "$APK" "$TMP/aligned.apk"
apksigner verify --print-certs -v "$APK" | grep -E "Verifies|scheme|SHA-256"
rm -rf "$TMP" "$APK.idsig"
sha256sum "$APK"
