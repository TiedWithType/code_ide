# Code IDE — dziennik postępów

## Zasady
- Bez push, commita zdalnego i publikacji GitHub Release.
- Baza: Emmet 2.4.11, commit 9d261b6, versionCode 20260923.
- Zakres: ikona i tytuł potwierdzenia zamknięcia niezapisanego pliku.

## Postępy
- [x] Zlokalizowano closeDocument(I) w DroidEditActivity.smali.
- [x] Potwierdzono użycie systemowej ikony alertu 0x1080027 i standardowego tytułu.
- [x] Odczytano wzorzec ikony informacji: grafika 21dp, pole 32dp, padding 4dp, odstęp 20dp, lewy inset 5dp.
- [x] Zastąpić alert konturową ikoną wykrzyknika i własnym tytułem XML.
- [x] Przebudować APK i sprawdzić podpis oraz zasoby gotowej paczki.
- [x] Przygotować APK, źródła poprawki i dziennik do przekazania; zaproponować dalsze prace.

## Propozycje z 2026-09-21 — stan historyczny; wdrożenie poniżej
1. Ujednolicić pozostałe okna ostrzeżeń i potwierdzeń na wspólnym układzie XML.
2. Dodać opcję „Zapisz i zamknij” do ostrzeżenia niezapisanych zmian.
3. Przetłumaczyć względne daty plików („hours ago”, „minutes ago”) i nazwę „untitled”.
4. Rozszerzyć Emmet o przechodzenie Tab/Shift+Tab między polami i własne snippety.
5. Przetestować Emmet na Androidzie: anulowanie operacji, cofanie, CSS w HTML, duże dokumenty.
6. Sprawdzić i wzmocnić istniejące zapisywanie stanu: odzyskiwanie niezapisanych dokumentów po ubiciu procesu.
7. Zweryfikować zależności i zgodność z nowszym Androidem przed podnoszeniem targetSdk.

- Wdrożono lokalnie: konturowe ! w okręgu, układ identyczny z i. Zachowano tekst i przyciski oraz logikę zamknięcia. Nowy versionCode: 20260924.

- Kontrola XML: rozmiary, odstępy i wyrównanie zgodne z nagłówkiem wyboru systemu plików.
- Przebudowa Apktool 2.12.1 zakończona powodzeniem.

## Wynik
- Podpis APK v2/v3 zweryfikowany dotychczasowym certyfikatem.
- Ponowna dekompilacja gotowego APK: nowy wektor, układ tytułu i versionCode prawidłowe.
- Brak urządzenia/emulatora: wygląd na Androidzie pozostaje do potwierdzenia.
- Nie wykonano push, zmiany tagu ani publikacji wydania.
- APK: Code-IDE-Emmet-2.4.11-UI1.apk
- SHA-256: f1ff8daae35c3438974b8e12581d2041faf2c99e868fe2a62a4c8c91b887ed34

# Aktualizacja 2026-09-22 — wdrożenie propozycji

Zakres zatwierdzony: dialogi i Quicksand, zapis i zamknięcie, lokalizacja, Emmet, odzyskiwanie i przegląd zgodności. Nadal bez push/release.

- [x] Odczytano zgłoszenie fix_quicksand_close_dialog.md. Font res/font/default.ttf to Quicksand; systemowy AlertDialog nadpisuje część krojów.
- [x] Sprawdzono zapis: stan serializowany bezpośrednio do droidedit.tmp; przerwanie zapisu może uszkodzić jedyną kopię.
- [x] Sprawdzono zapis pliku: sukces uploadu zeruje changed także po nowszej edycji — wymaga ochrony przed utratą zmian.
- [x] Wdrożyć wspólny nagłówek ostrzeżeń i Quicksand w dialogach.
- [x] Wdrożyć „Zapisz i zamknij” dopiero po udanym zapisie niezmienionej treści.
- [x] Przenieść untitled i daty względne do zasobów PL/EN.
- [x] Dodać pola Tab/Shift+Tab oraz edytor snippetów Emmet.
- [x] Atomowy zapis sesji, zapasowa kopia i okresowy checkpoint.
- [x] Przegląd Androida i zależności: ZGODNOSC.md. Testy hosta, podpis oraz kontrola gotowej paczki zakończone pomyślnie.

## Weryfikacja implementacji
- 43 przypadki JS Emmet: poprawne skróty, własne snippety HTML/CSS/JSX, pozycje pól, Unicode, limity.
- 14 przypadków modelu pól: Tab/Shift+Tab, przesunięcia po wpisywaniu/usuwaniu i anulowanie nieprawidłowego zakresu.
- 9 przypadków trwałości sesji: brak pliku, poprawne zastąpienie, uszkodzony plik, nieudana serializacja, przerwany obrót kopii, Unicode.
- Nazwa Bez nazwy i daty względne są zasobami XML; polskie plurale one/few/many/other.
- Quicksand zastosowany do nagłówków, komunikatów i przycisków natywnych dialogów; motyw globalny bez zmian.
- Własne snippety: menu Snippety Emmet, walidacja JSON przed zapisem, bez zewnętrznych plików i sieci.
- Pola Emmeta nie synchronizują powtórzeń tego samego placeholdera.

- Pierwsza pełna przebudowa nowych klas i zasobów zakończona powodzeniem.
- targetSdk pozostaje 34. JSch 0.1.48 i provider kryptograficzny v1.46 zidentyfikowane jako osobny zakres migracji.

## Wynik końcowy — 2026-09-22
- [x] Wdrożone: zapis i zamknięcie, ochrona zmian podczas zapisu, polskie nazwy i daty, Quicksand w dialogach, pola i snippety Emmet, checkpoint oraz kopia zapasowa sesji.
- [x] 66 przypadków testowych hosta (43 + 14 + 9) — bez błędów.
- [x] Kontrola katalogu składni, delegatów i lokalnych linków pomocy — bez błędów.
- [x] Pełna przebudowa Apktool, podpis v2/v3, ponowna dekompilacja, kontrola zasobów i wywołań smali.
- [x] Przygotowane APK, pełne źródła i aktualny dziennik do przekazania.
- [x] Bez commit/push na GitHub i bez publikacji nowego wydania.
- [ ] Test instalacji i interakcji na urządzeniu Android — brak urządzenia/emulatora w środowisku. Lista prób w ZGODNOSC.md.
- [ ] Migracja starszego JSch i providera kryptograficznego oraz podniesienie targetSdk — osobny zakres po przeglądzie, niewdrożony w tej paczce.

APK: Code-IDE-Editor-20260922.apk
VersionName: Expressive You - Editor 20260922
VersionCode: 20260925
SHA-256: 3b73cb5537d64ac091adafe5c8c2c3b58627e26dabdf48b295ac6b934b9d185d

## Publikacja — 2026-09-22

- Użytkownik polecił wypchnąć zmiany i APK do TiedWithType/code_ide.
- Przygotowano źródła, dokumentację i podpisany APK 20260925.
- Tag wydania: `editor-20260922`. Stan publikacji potwierdza strona GitHub Releases.

### Publikacja zakończona

- [x] Zmiany wypchnięte na main: 0f4ebf83a4b0f7da2458f53a98e175b47256644f.
- [x] Wydanie editor-20260922 opublikowane jako Latest.
- [x] Code-IDE-Editor-20260922.apk dodany do wydania; 6284629 bajtów.
- [x] SHA-256 na GitHubie zgodny z lokalnym APK: 3b73cb5537d64ac091adafe5c8c2c3b58627e26dabdf48b295ac6b934b9d185d.
- Release: https://github.com/TiedWithType/code_ide/releases/tag/editor-20260922
- Klucze podpisu nie zostały opublikowane. Test urządzenia nadal pozostaje do wykonania.

## Asystent pisania — 2026-09-22 (APK do testów)

- [x] Podpowiedzi Emmet po 350 ms bezczynności, do 3 widocznych propozycji z podglądem.
- [x] Własne snippety, kontekst HTML/CSS/JSX, wspólny silnik rozwijania, zachowanie ustawienia wcięć.
- [x] Odrzucanie nieaktualnego wyniku po edycji, ruchu kursora i zmianie dokumentu; brak dostępu do sieci.
- [x] Formularz snippetów: język, skrót, treść, edycja, usuwanie po potwierdzeniu, kontrola duplikatów.
- [x] Import/eksport JSON przez systemowy wybór pliku, limit rozmiaru, potwierdzenie zastąpienia zestawu.
- [x] Przełączniki podpowiedzi i automatycznego domykania w Asystencie pisania.
- [x] Nawiasy i cudzysłowy, otaczanie zaznaczenia, przejście przez istniejące zamknięcie, usuwanie pustej pary.
- [x] Domykanie HTML/XML z pominięciem znaczników pustych, samozamykających, komentarzy i bloków script/style.
- [x] Hook rzeczywistego wpisywania IME/klawiatury fizycznej, bez przepisywania otwieranych plików i wieloznakowych wklejeń.
- [x] Teksty PL/EN w XML, Quicksand panelu podpowiedzi i dialogów, zaktualizowana pomoc.
- [x] 43 przypadki regresji Emmeta + 15 podpowiedzi + 25 par znaków przeszły.
- [ ] Test urządzenia: różne klawiatury IME, położenie panelu nad klawiaturą, cofanie i ponawianie, import/eksport.

Wersja: Expressive You - Assist 20260922, versionCode 20260926.
Ta paczka jest przeznaczona do testów użytkownika; bez nowego push/release.
Podpowiedzi obejmują bieżący skrót, własny zestaw i popularne skróty, nie pełne LSP.
Podgląd w liście jest skrócony do dwóch linii. Rozpoznawanie kontekstu domykania jest leksykalne.

- [x] Dodatkowe 14 testów pól i 9 odzyskiwania przeszło — razem 106 przypadków.
- [x] Podpisany APK przebudowano i ponownie zdekompilowano; sprawdzono hooki, wersję i zgodność assets.
- [x] Podpisy v2/v3 zgodne z dotychczasowym certyfikatem.
- SHA-256: 90c8c0a29fb7e9c16357ba9e6ff2ff64f9210eea568a1eb107141e38026d5dd7

# Aktualizacja 2026-11-17 — linia 2026.11 (versionCode 20261117)

Zakres: zmiany użytkownika na bazie `com.code.ide.apk` 2026.11.14 (SHA-256 `b45b72111b475af7870f57eceb523837d8c0e37427da190f1fa8d36fcb4b8e6f`). Źródła: `android/editor-2026-11/`.

- [x] Crash przy starcie: baza 20261114 zawiera już poprawkę tła ikony (gradient radialny → liniowy) oraz `try/catch` wokół `Crashlytics.start()`. Przyczyny nie potwierdzono logiem z urządzenia; Crashlytics usunięto całkowicie.
- [x] Usunięto Crashlytics i RootTools (kod, zasoby, `RootTools.apk`, wpisy Bug reports/Root mode w Ustawieniach); typ systemu plików ROOT mapuje się na lokalny.
- [x] `Document` korzysta z `PieceTable`; `PieceTableEditable` (port AOSP `SpannableStringBuilder`) podpięty pod `ObservableEditText` od 262144 znaków.
- [x] Limit 1 MB zastąpiony `LargeFileGuard` (twardy limit 32 MiB + zapas pamięci); zbyt duży plik → wyjątek, plik nie jest otwierany.
- [x] Duże dokumenty w `onSaveInstanceState` zapisują się do pliku (`files/state/`), by nie przekroczyć limitu Binder.
- [x] Snippety Emmet: `EmmetSnippetsActivity` + `EmmetSnippetEditActivity`, grupy, import/eksport JSON naprawione (obsługa wyniku w Ustawieniach, BOM, spójne limity), pomoc `emmet.html#custom`. Ostrzeżenie o polach `${…}` poza `{}`/`[]` w HTML.
- [x] Błąd URI: zapis do oryginału zamiast do pliku tymczasowego (`UriBridge`).
- [x] Podpis dołączonym kluczem; certyfikat SHA-256 `1cb5322e4d92a990d1a2fa996e68f058da3fd04fc6d526556b1ad10e18fbef57` (zgodny z `com.code.ide.apk` 2026.11.14).

## Weryfikacja

- [x] Testy hosta: SnippetData, PieceTable, LargeFileGuard oraz test różnicowy portu z oryginalnym AOSP (150×700 + 6×6000 operacji) — bez błędów.
- [x] Odtwarzalność: świeża dekompilacja bazy + `apply_editor_20261117.py` + `build_editor.sh` → `classes.dex`, `classes2.dex`, `resources.arsc`, manifest identyczne z buildem referencyjnym.
- [x] Spójność wersji: apktool.yml (20261117 / `Expressive You - 2026.11.17`), `assets/help/index.html` (20261117), ta dokumentacja.
- [x] Kontrola sygnatur wywołań smali → klasy Java (0 braków).
- Artefakt: `Code-IDE-2026.11.17.apk`, SHA-256 `c8b7f99cdc0931f8106e5dd3f2c07716cd1253a574aeb3e357276bbe7ef298f7`.

## Odstępstwa i ryzyka (reguły.md)

- Nowy kod napisano w **Javie**, nie w Kotlinie (pkt 1). Uzasadnienie: `PieceTableEditable` jest portem kodu Java z AOSP weryfikowanym testem różnicowym; reszta to nowe helpery spójne z istniejącymi w `android/improvements/src/`. Migracja do Kotlina — osobny etap z testami regresji (pkt 2). Kandydaci: `SnippetData`, `LargeFileGuard`, `UriBridge`, aktywności snippetów.
- `classes2.dex` dołączany przy pakowaniu zamiast baksmali do drzewa (inna droga niż linia Assist; pkt 10 spełnione przez `apply_editor_20261117.py` + `build_editor.sh`).
- Dwa pliki pochodne od AOSP są na licencji Apache-2.0: `android/editor-2026-11/NOTICE.md`.
- **Dwie linie, niescalone**: `android/overlay/` = wydanie `editor-20260922` (minSdk 26); linia 2026.11 = minSdk 31, nowsza baza, bez pośrednich źródeł w repo.
- **Certyfikat różni się od opublikowanego wydania `editor-20260922`**: tamto APK jest podpisane `CN=Android Test Key` (SHA-256 `fc02a40e04cbd0c9e31f97e1917e42ba87684528d923d367f133bc47a227de1f`), nowe `CN=Android APK Signing` (`1cb5322e…`). Ten sam pakiet `com.code.ide`, więc aktualizacja nad wydaniem 20260922 **nie zainstaluje się** (wymaga odinstalowania). Wymaga decyzji przed publikacją.

## Niewykonane

- [ ] Test na urządzeniu Android (brak urządzenia/emulatora) — lista w ZGODNOSC.md.
- [ ] Pomiary czasu/pamięci dla dużych plików; stałe 32 MiB i 16 B/bajt to szacunki.
- [ ] Commit, push, tag i GitHub Release — **nie wykonano** (pkt 4 reguł; wymagają wyraźnej zgody). Proponowany tag: `editor-20261117`, plik wydania: `Code-IDE-2026.11.17.apk`.

