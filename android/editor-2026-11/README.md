# Linia 2026.11 — wersja 20261117

Nakładka na **`com.code.ide.apk` 2026.11.14** (versionCode 20261114, minSdk 31 / targetSdk 34).
Baza ma SHA-256 `b45b72111b475af7870f57eceb523837d8c0e37427da190f1fa8d36fcb4b8e6f`.

> **To osobna linia od `android/overlay/`.** Overlay w repozytorium odpowiada wydaniu
> `editor-20260922` (versionCode 20260925/20260926, minSdk 26). Linia 2026.11 jest budowana na
> nowszym APK, którego źródeł pośrednich nie ma w repozytorium. Oba stany **nie zostały scalone**;
> katalog istnieje obok, niczego z `overlay/` nie nadpisuje. Klasa `EmmetSnippets` z `src/`
> zastępuje inną implementację niż ta z `android/improvements/src/` — nie mieszaj tych linii.

## Zmiany względem 20261114

1. **Crashlytics i RootTools usunięte** razem z wpisami w Ustawieniach, zasobami i osadzonym `RootTools.apk`.
2. **Piece table pod EditText**: `PieceTableEditable` (port AOSP `SpannableStringBuilder`, ta sama semantyka
   rozpiętości) włączany przez `PieceTableFactory` od 262144 znaków; `Document` trzyma tekst w `PieceTable`.
3. **Pliki > 1 MB**: `LargeFileGuard` zamiast limitu 1 000 000 B (twardy limit 32 MiB + zapas pamięci 16 B/bajt);
   zbyt duży plik wyrzuca wyjątek, nie jest otwierany, toast podaje powód. Duże teksty w `onSaveInstanceState`
   trafiają do pliku `files/state/spill_*.txt` (limit Binder).
4. **Emmet snippets**: `EmmetSnippetsActivity` (języki → grupy → snippety) i `EmmetSnippetEditActivity` zamiast
   AlertDialogów; import/eksport JSON (BOM, formaty v1/v2/Emmet, podgląd scalania); pola `${…}` w HTML poza `{}`/`[]`
   dają ostrzeżenie; pomoc `emmet.html#custom`; pojedynczy wpis w Ustawieniach.
5. **Błąd URI**: pliki otwierane z zewnątrz (`content://`) zapisują się do **oryginału** (`UriBridge`);
   awaryjnie kopia w cache z odsyłaniem do URI po każdym zapisie.
6. Wersja: versionCode **20261117**, versionName **Expressive You - 2026.11.17**.

## Odtworzenie APK

Wymagane: JDK 8+ (kompilacja `--release 8`), Apktool 2.9.3 (użyty przy weryfikacji; 2.12.1 z linii Assist nie był tu testowany), `android.jar` (API ≥ 23), `dalvik-exchange` (dx),
`zipalign`, `apksigner`, Python 3, `git` lub `patch`. Klucze podpisu nie należą do repozytorium.

```sh
java -jar apktool.jar d com.code.ide.apk -o android/build/project          # baza 20261114
python3 android/editor-2026-11/apply_editor_20261117.py android/build/project

ANDROID_JAR=/ścieżka/android.jar APKTOOL_JAR=/ścieżka/apktool.jar \
SIGN_KEY=/ścieżka/key.pk8 SIGN_CERT=/ścieżka/cert.pem \
android/editor-2026-11/build_editor.sh android/build/project Code-IDE-2026.11.17.apk
```

Nowy kod Java (`src/`) jest dołączany jako `classes2.dex` (a nie przez baksmali do drzewa, jak w linii Assist).
Skrypt nanoszący jest idempotentny. Odtworzenie sprawdzono: świeża dekompilacja bazy + skrypty dały
`classes.dex`, `classes2.dex`, `resources.arsc` i manifest bitowo identyczne z buildem referencyjnym.

SHA-256 podpisanego APK (`Code-IDE-2026.11.17.apk`): `c8b7f99cdc0931f8106e5dd3f2c07716cd1253a574aeb3e357276bbe7ef298f7`.

## Testy hosta (JVM)

```sh
ANDROID_JAR=/ścieżka/android.jar android/editor-2026-11/run_host_tests.sh
```

| Zestaw | Zakres |
|---|---|
| `SnippetDataTest` | JSON v1/v2/Emmet, BOM, scalanie, grupy, limity, wykrywanie pól poza `{}` |
| `PieceTableTest` | 40 ziaren × 4000 operacji vs `StringBuilder`, serializacja, plik stanu, wydajność |
| `LargeFileGuardTest` | normalizacja końców linii, limity, odmowa przy braku pamięci |
| `EditableDiffTest` | port vs **oryginalny kod AOSP**: 150×700 i 6×6000 losowych operacji (tekst, rozpiętości, flagi, priorytety, kursor, `getSpans`, watchery) |

## Ograniczenia

- **Brak testu na urządzeniu/emulatorze** — lista prób w [ZGODNOSC.md](../../ZGODNOSC.md).
- Nowy kod jest w Javie, wbrew punktowi 1 `reguły.md` (patrz POSTEPY.md — uzasadnienie i plan).
- Stałe limitów dużych plików (32 MiB, 16 B/bajt) to szacunki, nie pomiary z urządzenia.
