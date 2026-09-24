# Mapa kodu Code IDE

## Główne punkty wejścia

- `POSTEPY.md` — chronologiczny dziennik zmian, wersji, testów i publikacji.
- `ZGODNOSC.md` — zgodność Androida, zależności, ograniczenia i plan testów urządzenia.
- `reguły.md` — zasady pracy nad repozytorium.
- `android/README.md` — sposób odtworzenia APK z bazowej dekompilacji i nakładki.

## Android

- `android/overlay/` — minimalna nakładka nakładana na projekt Apktool. Dla Assist jest uzupełniana idempotentnym krokiem `android/improvements/apply_assist.py`, który modyfikuje kilka dużych istniejących plików smali bez duplikowania ich w repo.
- `android/overlay/smali/com/aor/droidedit/` — hooki w istniejącym edytorze i UI aplikacji.
- `android/overlay/smali/com/code/ide/compat/` — skompilowane helpery dodane przez projekt.
- `android/overlay/assets/emmet/emmet.js` — lokalny bundle Emmet używany przez WebView.
- `android/overlay/res/values*/` — teksty, identyfikatory i lokalizacja zmian.

## Źródła pomocnicze

- `android/emmet/adapter.js` — adapter Emmet, rozwijanie i podpowiedzi.
- `android/emmet/src/com/code/ide/compat/EmmetBridge.java` — mostek Android ↔ lokalny WebView/Emmet; docelowo kandydat do migracji Kotlin.
- `android/emmet/test.cjs` — regresja Emmet.
- `android/improvements/src/com/code/ide/compat/` — źródła własnych helperów Androida; główny obszar migracji Java → Kotlin.
- `android/improvements/apply_assist.py` — odtwarzalny i idempotentny krok integracji Assist na drzewie Apktool.
- `android/improvements/hooks.py` — historyczny zapis jednorazowych hooków użytych przy tworzeniu paczki testowej.
- `android/improvements/patch_hooks.py` — wcześniejsze hooki integracyjne.
- `android/improvements/patch_ui.py` — modyfikacje UI/zasobów.
- `android/improvements/verify_apk.py` — kontrola gotowej zdekompilowanej paczki.

## Asystent pisania

- `EditorAssist` — cykl podpowiedzi, popup, InputConnection oraz integracja wpisywania/klawiatury.
- `PairRules` — testowalna logika par nawiasów/cudzysłowów i domykania HTML/XML.
- `EmmetSnippets` — własne snippety, formularz oraz import/eksport JSON.
- `EmmetBridge` + `adapter.js` — obliczanie rozwinięć i podpowiedzi Emmet offline.

## Testy

- `android/emmet/test.cjs` — 43 przypadki Emmet.
- `android/improvements/suggestions.test.cjs` — 15 przypadków podpowiedzi.
- `android/improvements/PairRulesTest.java` — 25 przypadków par znaków.
- `android/improvements/FieldRangesTest.java` — 14 przypadków pól/tabstopów.
- `android/improvements/AtomicStoreTest.java` — 9 przypadków odzyskiwania.

Łącznie dla wersji Assist: 106 przypadków hosta. Test urządzenia Android pozostaje osobnym etapem.
