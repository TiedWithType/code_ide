# Lokalne poprawki edytora — 2026-09-22

Źródłem gotowej paczki jest pełny katalog decoded/ w archiwum. Skrypty patch_ui.py
oraz patch_hooks.py dokumentują modyfikację bazy UI1; nie uruchamiaj ich ponownie
na już zmodyfikowanym drzewie. Nie są idempotentne.

Nowe klasy Java znajdują się w src/com/code/ide/compat/. EmmetBridge.java znajduje
się w android/emmet/src/com/code/ide/compat/ i należy kompilować go wraz z tymi klasami.
Kompilacja: Java --release 8, android.jar API 21+, D8 --min-api 26, następnie baksmali.
Gotowe smali oraz zasoby są już w decoded/.

Testy czystego modelu pól i trwałości plików:
- AtomicStoreTest.java + src/.../AtomicStore.java: 9 przypadków.
- FieldRangesTest.java + src/.../FieldRanges.java: 14 przypadków.
- android/emmet/test.cjs: 43 przypadki na zbudowanym pakiecie emmet.js.
- verify_apk.py: kontrola zdekompilowanej paczki końcowej; ścieżki odnoszą się do
  oryginalnego katalogu roboczego i przy odtwarzaniu trzeba podać własne.

Przebudowa pakietu JS z android/emmet/:
  npm ci --ignore-scripts --no-audit --no-fund
  node build.cjs ../../decoded/assets/emmet
  node test.cjs ../../decoded/assets/emmet/emmet.js

APK:
  apktool b decoded -o unsigned.apk
Następnie podpisz tym samym kluczem co wcześniejsze wydanie. Kluczy nie ma w archiwum.

Ograniczenia i zakres kontroli: POSTEPY.md oraz ZGODNOSC.md w głównym katalogu archiwum.
Brak testu urządzenia Android. Publikacja: tag editor-20260922.

W repozytorium gotowe smali i zasoby znajdują się w android/overlay/.
Nałóż tę nakładkę na bazowy projekt zgodnie z android/README.md.
Katalog decoded/ dotyczy pełnego archiwum źródeł, nie układu repozytorium.
