# Reguły projektu Code IDE

1. Nowy własny kod Androida pisz w Kotlinie, jeśli jest to technicznie możliwe i nie pogarsza zgodności z rekonstruowaną aplikacją.
2. Istniejący własny kod Java migruj do Kotlina etapami, z testami regresji i bez przepisywania dekompilowanego kodu aplikacji tylko dla samej zmiany języka.
3. Smali oraz kod pochodzący z oryginalnej/dekompilowanej aplikacji pozostawiaj w obecnej postaci, jeżeli migracja nie daje wyraźnej korzyści albo zwiększa ryzyko regresji.
4. Nie wykonuj commit, push, tag ani GitHub Release bez wyraźnej zgody użytkownika. Zgoda dotyczy tylko wskazanego zakresu operacji.
5. Nie publikuj kluczy podpisu ani innych sekretów. APK do wydania może być publikowany wyłącznie jako artefakt Release.
6. Przed publikacją sprawdź testy hosta, spójność wersji, sumę SHA-256 APK i — jeśli środowisko na to pozwala — podpis APK.
7. Testy hosta, przebudowa i ponowna dekompilacja nie zastępują testu na rzeczywistym Androidzie. Niewykonane testy urządzenia zapisuj jawnie.
8. Ważne decyzje, stan wersji i ograniczenia zapisuj w dokumentacji projektu. Mapa kodu znajduje się w `MAPA_KODU.md`.
9. Nie wrzucaj do repo pełnej dekompilacji ani plików roboczych, jeżeli wystarcza minimalna nakładka `android/overlay/` oraz odtwarzalne źródła pomocnicze.
10. Zachowuj kompatybilność obecnego procesu budowania: źródła pomocnicze + `android/overlay/` + jawne kroki build-time (np. `apply_assist.py`) muszą odtwarzać opublikowane APK.
