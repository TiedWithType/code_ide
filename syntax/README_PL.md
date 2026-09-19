# Zaktualizowane definicje składni xmode

Wydanie: 2026-09-19. Paczka zawiera **227 plików definicji** i **231 unikalnych wpisów katalogu** (część wpisów to aliasy). Zachowuje format XML/xmode oraz dołączone DTD.

Aktualizacja obejmuje kontrolę strukturalną całej paczki, naprawy wykrytych błędów, modernizację wybranych popularnych języków i 11 nowych trybów. Nie oznacza pełnej implementacji najnowszej specyfikacji każdego z ponad 200 języków. To reguły kolorowania, nie kompilatory ani walidatory kodu.

## Nowe tryby

| Tryb | Rozpoznawane pliki | Zakres i powód dodania |
| --- | --- | --- |
| TypeScript | `.ts`, `.mts`, `.cts` | Osobne typy, dekoratory, `satisfies`, `infer`, modyfikatory; rozwój aplikacji WWW |
| JSX | `.jsx` | Znaczniki, atrybuty, fragmenty i wyrażenia; komponenty React |
| TSX | `.tsx` | JSX z typami TypeScript |
| Rust | `.rs` | Makra, lifetimes, raw strings, komentarze zagnieżdżone, słowa edycji 2024; narzędzia i backend |
| Kotlin | `.kt`, `.kts` | Adnotacje, interpolacja, raw strings, komentarze zagnieżdżone; Android i Gradle Kotlin DSL |
| Swift | `.swift` | Atrybuty, aktorzy, współbieżność, zwykła interpolacja, raw strings; aplikacje Apple |
| TOML | `.toml` | Klucze, tabele, daty, liczby i tekst wielowierszowy; Cargo i pyproject |
| GraphQL | `.graphql`, `.gql`, `.graphqls` | Zapytania, schematy SDL, zmienne i dyrektywy; API |
| Dockerfile | `Dockerfile`, `Dockerfile.*`, `*.Dockerfile`, `Containerfile`, `Containerfile.*` | Instrukcje, argumenty, zmienne, heredoc; kontenery |
| HCL / Terraform | `.hcl`, `.tf`, `.tfvars` | Bloki, typy, interpolacja, heredoc; konfiguracja infrastruktury |
| JSONC | `.jsonc`, `tsconfig.json`, `tsconfig.*.json`, `jsconfig.json` | JSON z komentarzami; konfiguracja projektów |

Dobór uwzględnia praktyczne zastosowania, a nie deklarowany ranking popularności. Języki już obecne, np. Python, Go, Java i C#, zostały zaktualizowane zamiast dodawania ich duplikatów.

## Najważniejsze poprawki

- Naprawiono wszystkie znalezione naruszenia DTD w ośmiu plikach: GCBASIC, HLSL, HXML, RTF, CPLEX LP, Dart, PL/SQL, Perl. Poprawiono kolejność `KEYWORDS`, niedozwolone atrybuty, przypadkowy tekst i błędnie umieszczone reguły. Nie rozszerzano DTD tylko po to, aby ukryć błędy.
- Usunięto 519 zduplikowanych wpisów słów kluczowych, zachowując ostatni wpis w danej tabeli. Usunięto też pusty wpis zgłaszany przez silnik w PowerDynamo.
- Naprawiono niekompilujące się wyrażenie regularne w regule wcięć FoxPro oraz rozpoznawanie bajtów szesnastkowych RTF.
- JSON: `true`, `false` i `null` mają spójny styl; `false` nie jest błędem. Klucze odróżniają się od wartości. Poprawiono wzorzec liczb.
- JSON5: osobna definicja zamiast kopii JavaScript; komentarze, klucze bez cudzysłowów, pojedyncze cudzysłowy, liczby hex, `Infinity`, `NaN`. JSONP przeniesiono do JavaScript.
- JavaScript: BigInt, separatory liczb, liczby `.5` i `1.`, pola prywatne, nowoczesne operatory, zagnieżdżona interpolacja. Ograniczono mylenie dzielenia z regexem. Rozdzielono pliki JS/TS/JSX/TSX.
- Python: słownictwo Python 3, `async`/`await`, `nonlocal`, kontekstowe `match`/`case` i deklaracje `type`, prefiksy napisów, f-strings i t-strings, nowoczesne operatory. Usunięto dawną listę wbudowanych nazw Python 2.
- Go: usunięto trójznaki C i stare typy; dodano komentarze blokowe, raw strings, liczby szesnastkowe zmiennoprzecinkowe, `any`, `comparable`, `clear`, `min`, `max`.
- HTML/CSS: naprawiono zakończenie komentarza JS przed końcem `<script>`, dodano skrypty JSON/JSON-LD/importmap, współczesne elementy HTML; poprawiono encje, pseudoklasy, zagnieżdżenia i powrót ze stylów do HTML. Rozszerzono właściwości i jednostki CSS.
- YAML: podstawowe literały schematu Core 1.2; `yes` i `on` są zwykłym tekstem; `#` w adresie URL nie rozpoczyna komentarza; poprawiono cytowane klucze i podwójny apostrof.
- Java: nowe słowa i text blocks. C/C++: wybrane słowa C23 i współczesnego C++, raw strings C++. C#: nowe słowa, interpolacja, verbatim/raw strings i liczby. Dart: słowa Dart 3, prefiks `r` i zagnieżdżenia interpolacji. PHP: `fn`, `match`, `readonly`, `enum`, atrybuty `#[...]` i nowe operatory.
- Markdown: bloki kodu z trzema lub większą liczbą znaków backtick/tylda, kolorowanie 27 oznaczeń języków/trybów, poprawione rozszerzenia.
- Uzupełniono katalog o 7 istniejących, wcześniej niezarejestrowanych plików. Stary `velocity.xml` ma nazwę `velocity-legacy`, aby nie zastępować dotychczasowego trybu `velocity`. Poprawiono względne odwołania do DTD.

## Instalacja

Rozpakuj archiwum i podmień katalog `syntax` w miejscu, z którego Twój edytor wczytuje te definicje. Zachowaj układ `syntax/xmode.dtd`, `syntax/catalog.dtd`, `syntax/modes/catalog` i plików `modes/*.xml`. Uruchom ponownie edytor albo przeładuj jego tryby.

Nie znamy nazwy i wersji docelowego edytora, dlatego nie podajemy konkretnej ścieżki Android/Termux. Jeśli aplikacja używa własnego rejestru języków zamiast `modes/catalog`, trzeba również zarejestrować w niej nowe nazwy. Same pliki XML nie mogą zmienić kodu aplikacji.

## Sprawdzenie jakości

Weryfikacja wykonana na Java 17.0.20 i silniku **jEdit 5.5.0** z pakietu Debian `5.5.0+dfsg-2`:

- 227/227 definicji zgodnych z dołączonym DTD; katalog również poprawny.
- Wszystkie odwołania `DELEGATE` i pliki katalogu istnieją; nazwy katalogu są unikalne.
- 231 wpisów katalogu wczytanych przez silnik bez zgłoszeń błędów.
- 1842 wyrażenia regularne skompilowane przez `java.util.regex.Pattern`.
- 36 scenariuszy, 190 sprawdzeń kolorowania i przypisania rozszerzeń: zero błędów.

Testy uwzględniają m.in. dzielenie JS, ukośnik w klasie znaków regexu, zagnieżdżone szablony, apostrof w tekście JSX, generyk `<T,>`, przejścia HTML/CSS/JS, fragment URL w YAML i znaczniki heredoc w środku wiersza. Pliki w `examples/` służą do ręcznego oglądania; część to krótkie fragmenty lub celowo niepoprawny kod testowy.

Uruchomienie z katalogu `syntax` (Python z `lxml`, JDK 17+ oraz własny plik `jedit.jar`):

```sh
python3 tests/validate.py
java tests/RegexCheck.java .
java -Djava.awt.headless=true -cp /sciezka/do/jedit.jar tests/EngineRegression.java .
```

JAR jEdit nie jest dołączony. `tests/EngineProbe.java` pozwala obejrzeć tokeny pojedynczego pliku; przyjmuje katalog paczki, nazwę trybu z katalogu i ścieżkę przykładu. Wyniki końcowego sprawdzenia zapisano w `TEST_RESULTS.txt`.

## Ograniczenia

- Test w silniku jEdit nie zastępuje sprawdzenia w nieznanej aplikacji docelowej ani przeglądu wyglądu jej motywu. Kolory wynikają z mapowania tokenów w edytorze.
- xmode nie analizuje pełnej gramatyki. Słowa kontekstowe mogą być wyróżniane także jako nazwy użytkownika. Reguły nie stanowią certyfikatu zgodności z pełnym standardem języka.
- Regex JavaScript jest rozpoznawany zachowawczo: na początku wiersza i po wybranych znakach rozpoczynających wyrażenie. Nie wszystkie regexy po `return` albo konstrukcjach sterujących zostaną wyróżnione. Prefiks i delimitery mają styl operatora.
- JSX/TSX może wymagać dopracowania dla niejednoznacznych generyków i złożonych wielowierszowych konstrukcji. Test obejmuje typowy zapis generycznej funkcji strzałkowej `<T,>`.
- Python: zaawansowane specyfikatory formatu i wszystkie przypadki ponownego użycia cudzysłowów w f/t-strings nie są pełnym parserem PEP 701/750.
- YAML: nie ma pełnego śledzenia wcięć skalarów `|`/`>` ani całej gramatyki zwykłych skalarów. TOML: wielowierszowe tablice mogą być wizualnie mylone z nagłówkiem tabeli. Te tryby nie sprawdzają poprawności danych.
- Swift: interpolacja w raw strings z dowolną liczbą `#` oraz regex literals nie są w pełni obsługiwane. C#: interpolowane raw strings są kolorowane jako tekst bez analizy wnętrza interpolacji. Kotlin: rozszerzenia eksperymentalne nie są celem paczki.
- Dockerfile/HCL: obsługiwane są podstawowe heredoc i szablony; brak pełnej gramatyki powłoki i walidacji reguł wcięć. Markdown: zagnieżdżenie ogrodzeń w listach/cytatach nie ma pełnego parsera CommonMark.
- Modernizacja Java/C/C++/C#/Dart/PHP jest celowana. Stare, specjalistyczne języki zachowały dotychczasową zawartość poza naprawami struktury, duplikatów i ścieżek DTD. Historyczne konflikty rozszerzeń, np. `.fx` i `.cfc`, nie zostały rozstrzygnięte arbitralnie.

Źródła dokumentacji i zakres odniesienia znajdują się w `SOURCES.md`. Szczegółowy wykaz zmienionych plików jest w `CHANGELOG_FILES.json`.
