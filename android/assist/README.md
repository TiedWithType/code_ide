# Assist 20260922

Warstwa źródłowa wersji `Expressive You - Assist 20260922` (versionCode `20260926`).
Nie przechowuje kopii całej dekompilacji ani wygenerowanych klas smali.

Po przygotowaniu świeżego projektu Apktool i skopiowaniu `android/overlay/` uruchom:

```sh
ANDROID_JAR=/path/to/android.jar \
R8_JAR=/path/to/r8.jar \
BAKSMALI_CLASSPATH=/path/to/baksmali-and-deps.jar \
android/assist/build_assist.sh android/build/project
```

Skrypt:
1. kopiuje zasoby PL/EN i stronę pomocy Assist,
2. buduje lokalny bundle Emmet 2.4.11 i uruchamia testy Emmet + podpowiedzi,
3. kompiluje czytelne helpery Java 8, D8 min-api 26 i generuje smali,
4. nakłada idempotentne hooki do istniejącego edytora oraz ustawia versionCode/versionName.

`apply_assist.py` zweryfikowano przez odtworzenie pięciu zmienianych plików dokładnie bajt-po-bajcie
względem drzewa użytego do podpisanego APK. Gotowy APK ma SHA-256:
`90c8c0a29fb7e9c16357ba9e6ff2ff64f9210eea568a1eb107141e38026d5dd7`.

Test urządzenia Android pozostaje do wykonania.
