# Zmodyfikowane źródła Androida

`overlay/` zawiera 26 zmienionych lub dodanych plików względem dekompilacji
przesłanego `Code IDE.apk` (com.code.ide, versionCode 20260919).
To nakładka na projekt Apktool, nie kompletny projekt ani źródła Java/Kotlin.
Istniejący katalog `syntax/` repozytorium nie jest przez nią modyfikowany.

## Zakres zmian

- Dostęp do plików: żądanie uprawnień, ponawianie listowania, obsługa błędów
  i niedostępnego ostatniego katalogu, poprawki kopiowania.
- Korekty XML panelu plików, wierszy i edytora; włączanie dodatkowej klawiatury.
- Wieloliniowy typ wejścia dla klawiatury systemowej (w tym emoji).
- Usunięcie GET_ACCOUNTS, MANAGE_ACCOUNTS i USE_CREDENTIALS.
- POST_NOTIFICATIONS i żądanie zgody od Androida 13.
- FileProvider do udostępniania plików, exported, immutable PendingIntent
  oraz kontrole dostępu do sieci lokalnej w FTP/SFTP.

Aktualna konfiguracja to **minSdk 26 / targetSdk 34**, nie targetSdk 37.
Target 34 pozostawiono ze względu na problemy starego UI z edge-to-edge.
Nie deklarujemy pełnej migracji do najnowszego API ani potwierdzonego działania UI.

## Odtworzenie projektu

Wymagane: Java, Apktool 2.12.1 oraz dokładnie ten sam bazowy APK.
SHA-256 bazowego APK:
`d18dc8805bae05e0895b1b99dcf4b7a77d171c95ca283064598cf21f0c926f41`.

Z głównego katalogu repozytorium, używając nowego katalogu roboczego:

```sh
java -jar /path/to/apktool.jar d '/path/to/Code IDE.apk' -o android/build/project
cp -R android/overlay/. android/build/project/
java -jar /path/to/apktool.jar b android/build/project -o android/build/Code-IDE-unsigned.apk
```

To tworzy **niepodpisany** APK. Do wydania wyrównaj go przez `zipalign`,
następnie podpisz przez `apksigner` z Android SDK Build Tools, używając
prywatnie przechowywanych `modded.pk8` i `modded.x509.pem`, i sprawdź podpis
przez `apksigner verify --verbose`. Klucze i APK nie są częścią repozytorium.
Poprzedni lokalny APK podpisano wyłącznie schematem JAR/v1; przed publikacją
na nowe Androidy należy przygotować i zweryfikować podpis v2 lub nowszy.

## Weryfikacja i ograniczenia

Dotychczas wykonano kompilację Apktool i ponowną dekompilację APK,
sprawdzenie XML oraz zachowania identyfikatorów zasobów i assets.
Nie wykonano testów na telefonie/emulatorze. W szczególności przesunięcie
edytora, przewijanie panelu, paski systemowe i wprowadzanie emoji wymagają
potwierdzenia na urządzeniu. Raport nie oznacza, że te błędy zostały
potwierdzone jako naprawione w działającej aplikacji.
