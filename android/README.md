# Zmodyfikowane źródła Androida

`overlay/` jest bazową nakładką na dekompilację `Code IDE.apk`. Wersja Assist jest składana
source-first: czytelne źródła helperów i adaptera Emmet są kompilowane podczas przygotowania drzewa,
a kilka małych hooków do dużych istniejących plików smali nakłada `apply_assist.py`.

Aktualna konfiguracja: **minSdk 26 / targetSdk 34**.

## Odtworzenie Assist

Wymagane: Java/JDK, Python 3, Node.js/npm, Apktool 2.12.1, Android `android.jar`, R8/D8 oraz baksmali.
Bazowy APK ma SHA-256:
`d18dc8805bae05e0895b1b99dcf4b7a77d171c95ca283064598cf21f0c926f41`.

```sh
java -jar /path/to/apktool.jar d '/path/to/Code IDE.apk' -o android/build/project
cp -R android/overlay/. android/build/project/
mkdir -p android/build/project/assets/syntax/modes
cp syntax/modes/* android/build/project/assets/syntax/modes/
cp syntax/*.dtd android/build/project/assets/syntax/

ANDROID_JAR=/path/to/android.jar \
R8_JAR=/path/to/r8.jar \
BAKSMALI_CLASSPATH=/path/to/baksmali-and-deps.jar \
android/assist/build_assist.sh android/build/project

java -jar /path/to/apktool.jar b android/build/project -o android/build/Code-IDE-unsigned.apk
```

Po złożeniu APK należy wykonać `zipalign`, podpisać przez `apksigner` dotychczasowym prywatnym
certyfikatem i zweryfikować podpis. Klucze nie należą do repozytorium.

## Assist 20260922

VersionName: `Expressive You - Assist 20260922`  
VersionCode: `20260926`

Funkcje: podpowiedzi Emmet, własne snippety i import/eksport JSON, parowanie nawiasów/cudzysłowów,
leksykalne domykanie HTML/XML oraz integracja z rzeczywistym wpisywaniem IME/klawiatury fizycznej.
Emmet pozostaje lokalny/offline.

Weryfikacja hosta: **106 przypadków** (43 Emmet + 15 podpowiedzi + 25 par + 14 pól + 9 odzyskiwania).
SHA-256 podpisanego APK: `90c8c0a29fb7e9c16357ba9e6ff2ff64f9210eea568a1eb107141e38026d5dd7`.
Test na urządzeniu Android nadal pozostaje do wykonania.

Szczegóły: [assist/README.md](assist/README.md), [improvements/README.md](improvements/README.md),
[POSTEPY.md](../POSTEPY.md), [ZGODNOSC.md](../ZGODNOSC.md) i [MAPA_KODU.md](../MAPA_KODU.md).
