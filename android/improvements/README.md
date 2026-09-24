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
Brak testu urządzenia Android. Nie wykonano push ani publikacji release.

## Asystent pisania (20260926)

EditorAssist integruje podpowiedzi i InputConnection z istniejącym edytorem. PairRules zawiera testowalne przekształcenia par znaków. EmmetSnippets udostępnia formularz i systemowy import/eksport JSON. hooks.py dokumentuje jednorazowe zmiany względem Editor 20260922 — nie uruchamiać ponownie na aktualnej nakładce.
Nowe testy: PairRulesTest.java (25) i suggestions.test.cjs (15). Gotowy APK do testów, bez publikacji na GitHubie.

## Odtwarzalny hook Assist

Repozytorium nie duplikuje pełnych dużych plików smali tylko po to, aby zapisać kilka wstawek.
Po skopiowaniu `android/overlay/` do świeżej dekompilacji uruchom:

```sh
python android/improvements/apply_assist.py android/build/project
```

Skrypt jest idempotentny: dodaje hooki `EditorAssist` do aktywności, pola edycji oraz listenerów,
a także ustawia versionCode 20260926 / `Expressive You - Assist 20260922`.
Jego wynik dla pięciu modyfikowanych plików został porównany bajt po bajcie ze zweryfikowanym drzewem
użytym do `Code-IDE-Assist-20260922.apk`.
