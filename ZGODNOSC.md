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
