# Definicje kolorowania Code IDE

Aktualizacja 2026-09-20: 232 pliki XML i 236 wpisów katalogu, w tym 5 modułów
wspólnych. Nazwy katalogu są WIELKIMI LITERAMI i posortowane A–Z.
Wewnętrzne identyfikatory pozostają małymi literami; wymagana jest również
nakładka Androida opisana w [android/README.md](../android/README.md).

## Wspólne reguły

- `common-ecmascript.xml`: literały, komentarze, liczby i operatory.
- `common-js-keywords.xml`: słowa JavaScript i standardowe obiekty/funkcje.
- `common-web-platform.xml`: console, DOM, fetch, customElements, API przeglądarki i Node.js.
- `common-ts-types.xml`: słowa i typy pomocnicze TypeScript.
- `common-entities.xml`: encje HTML i JSX.

JS, TS, JSX i TSX importują wspólne reguły, zachowując własny kontekst
interpolacji. Nazwy metod console, np. log/warn/error, mają styl funkcji także
w innych obiektach. TypeScript obejmuje m.in. Partial, ReturnType i NoInfer.
Poprawiono mylenie `Partial<User>` ze znacznikiem JSX.

## Rozszerzenia i pomoc

Katalog poprawia przypisania m.in. XML, Verilog/VHDL, Makefile, HLSL,
Fortran/Forth, VB/VBScript, CFScript/ColdFusion, Objective-C i JSONC.
Pełna tabela znajduje się w pomocy aplikacji:
[syntax.html](../android/overlay/assets/help/pages/syntax.html).
Dla niejednoznacznych rozszerzeń, np. .h lub .sql, wybierz język ręcznie.
Zapamiętane przypisania użytkownika mają pierwszeństwo przed detekcją.

## Weryfikacja

W katalogu `syntax`, z Pythonem/lxml, Javą 17+ i własnym JAR jEdit 5.5.0:

```sh
python3 tests/validate.py
java tests/RegexCheck.java .
java -Djava.awt.headless=true -cp /path/to/jedit.jar tests/EngineRegression.java .
```

44 scenariusze, 274 sprawdzenia tokenów i rozszerzeń: zero błędów.
Szczegóły w `TEST_RESULTS.txt`. Testy obejmują też przejścia HTML/CSS/JS,
interpolacje TypeScript, encje i typy generyczne w TSX.

Reguły xmode są kolorowaniem leksykalnym, nie parserem ani kompilatorem.
Słowa kontekstowe mogą kolorować nazwy użytkownika. Złożone JSX/TSX i regexy JS
pozostają heurystyczne. Silnik jEdit nie zastępuje testu interfejsu na Androidzie.
Pozostałe przykłady i historyczne raporty modernizacji zachowano w repozytorium.
