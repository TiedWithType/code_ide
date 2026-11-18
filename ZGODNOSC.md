# Przegląd zgodności — 2026-09-22

## Potwierdzone w aplikacji

- minSdk 26, targetSdk 34. W tej poprawce nie podniesiono targetSdk.
- Nowe klasy skompilowano jako Java 8, D8 min-api 26, bez bibliotek natywnych.
- Brak plików .so w głównej aplikacji. To nie jest test urządzenia z pamięcią 16 KiB ani test dołączonego narzędzia RootTools.apk.
- WebView uruchamia lokalny pakiet Emmet. Zablokowane są połączenia sieciowe, dostęp do plików i zawartości; brak mostka JavaScriptInterface.
- Nie dodano uprawnień ani eksportowanych komponentów. W istniejącym manifeście są FileProvider, obsługa powiadomień i dostęp do plików z wcześniejszych poprawek.
- Quicksand pochodzi z istniejącego res/font/default.ttf; identyczne bajty w assets/fonts/quicksand.ttf pozwalają jawnie ustawić font dialogu bez zmiany motywu aplikacji.

## Zależności

| Składnik | Potwierdzony stan | Wniosek |
|---|---|---|
| Emmet | 2.4.11, wersja przypięta w package-lock.json | Zachowano wersję i rozszerzono adapter |
| esbuild | 0.25.10, zależność budowania | Nie trafia do APK jako narzędzie wykonywalne |
| JSch | 0.1.48 (stała VERSION w smali) | Wymaga osobnego planu migracji i testów SFTP; nie podmieniano biblioteki bez weryfikacji |
| SpongyCastle/BouncyCastle | Provider deklaruje v1.46 | Stary stos kryptograficzny, wymaga osobnego przeglądu zależności |
| Android support-v4, stare Google API/Ads, Apache Commons | Pakiety obecne w smali, nie wszystkie wersje dają się wiarygodnie ustalić | Samo złożenie APK nie potwierdza aktualności ani bezpieczeństwa tych bibliotek |

To inwentaryzacja, nie pełny audyt podatności. Nie deklarujemy aktualizacji wszystkich zależności.

## Podnoszenie targetSdk

Dokumentacja Androida opisuje wymuszenie edge-to-edge po przejściu na targetSdk 35 na Androidzie 15. Dla tego edytora trzeba wcześniej przetestować insets, klawiaturę, pasek narzędzi, dialogi i nawigację wstecz. Zmiana samej liczby w manifeście nie wystarcza.

Źródła:
- https://developer.android.com/about/versions/15/behavior-changes-15
- https://developer.android.com/develop/ui/views/layout/edge-to-edge
- https://developer.android.com/guide/practices/page-sizes

## Testy urządzenia — niewykonane w tym środowisku

1. Android 8/13/15/16: otwarcie, zapis, nadpisanie i anulowanie wyboru miejsca zapisu.
2. Zapis i zamknięcie: nowy dokument, istniejący plik, błąd uprawnień, zmiana treści podczas zapisu.
3. Quicksand: tytuł, wiadomość i trzy przyciski, skalowanie fontu oraz wąski ekran.
4. Emmet: Ctrl+Space, Tab/Shift+Tab, tab aplikacji, cofanie i przełączanie dokumentów.
5. Odzyskiwanie: ubić proces po checkpointcie i podczas zapisu; sprawdzić treść i pozycję kursora.
6. Duże dokumenty: checkpoint serializuje model na głównym wątku, więc należy zmierzyć opóźnienie przed planowaniem dalszej optymalizacji.

Ograniczenia: brak emulatora/urządzenia Android; testy hosta, kompilacja i dekompilacja nie zastępują tych prób.

# Przegląd zgodności — 2026-11-17 (linia 2026.11)

## Potwierdzone w paczce

- minSdk 31, targetSdk 34. Nowe klasy: Java 8, `dx --min-sdk-version=26`, dołączone jako `classes2.dex` (multi-dex natywny od API 21).
- Usunięto RootTools i Crashlytics (kod, zasoby, osadzony `RootTools.apk`); brak ich śladów w `classes*.dex` poza stałą nazwy w `R$string`.
- `PieceTableEditable` korzysta wyłącznie z publicznego API (`Selection.SELECTION_START/END` są publiczne); nie używa refleksji ani ukrytych metod. Ukryte `GraphicsOperations` pominięto; zakładamy, że `Canvas`/`Paint` użyją wtedy ścieżki przez `TextUtils.getChars` (do potwierdzenia na urządzeniu).
- Dokument w `onSaveInstanceState`: tekst > 65 536 znaków trafia do `files/state/spill_*.txt`; pliki starsze niż 7 dni są sprzątane. Przy braku pliku stanu tekst wraca pusty (rzadki przypadek; nie wykonano próby ubicia procesu).

## Zmiana certyfikatu podpisu

Wydanie `editor-20260922` jest podpisane `CN=Android Test Key` (SHA-256 `fc02a40e…de1f`). Linia 2026.11 jest podpisana
dostarczonym kluczem `CN=Android APK Signing` (SHA-256 `1cb5322e…ef57`). Pakiet jest ten sam (`com.code.ide`), więc Android
odrzuci aktualizację nad wydaniem 20260922. Do decyzji: zachować nowy klucz i poinformować o odinstalowaniu, albo podpisać dawnym kluczem.

## Testy urządzenia — niewykonane w tym środowisku

1. Start aplikacji po zmianach (w tym ikona/tło i brak Crashlytics); Ustawienia bez pozycji Bug reports/Root mode.
2. Otwieranie z zewnątrz: `externalstorage`, Pobrane (`raw:`/numeryczne), `media`, `FileProvider` obcej aplikacji; zapis trafia do oryginału; kopia awaryjna i odsyłanie do URI; brak uprawnień do zapisu.
3. Snippety Emmet: wpis w Ustawieniach, grupy, edycja, „Cofnij”, import/eksport (BOM; formaty v1/v2/Emmet; tryby scalania), obrót ekranu, motyw i font.
4. Duże pliki: 1, 5, 20 i 32 MB; komunikat odmowy przy małej pamięci; edycja w `PieceTableEditable` (kursor, zaznaczenie, IME, podpowiedzi, cofanie/ponawianie, wyszukiwanie, zawijanie); numery linii.
5. Zejście do tła i przywracanie po ubiciu procesu dużego dokumentu (plik stanu).
6. Pomiar opóźnień i pamięci: `updateLineCount`/zawijanie wykonują się w O(n) w tle — nie zoptymalizowano; stałe 32 MiB i 16 B/bajt to szacunki.
7. Aktualizacja nad zainstalowanym wydaniem 20260922 (spodziewane odrzucenie z powodu certyfikatu).

Ograniczenia: brak emulatora/urządzenia; testy hosta, kompilacja i dekompilacja nie zastępują tych prób.

