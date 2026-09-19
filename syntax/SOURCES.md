# Dokumentacja wykorzystana przy aktualizacji

Sprawdzono 2026-09-19. Poniższe dokumenty wyznaczają kierunek aktualizacji reguł leksykalnych; nie są deklaracją pełnej implementacji ich gramatyk. Przykłady testowe w paczce są przygotowane dla tego zadania.

- [jEdit — SPAN](https://www.jedit.org/users-guide/mode-rule-span.html) i [SPAN_REGEXP](https://www.jedit.org/users-guide/mode-rule-span-regexp.html): delegowanie, dopasowania i delimitery.
- [ECMA-262, wydanie 2026](https://ecma-international.org/publications-and-standards/standards/ecma-262/): punkt odniesienia dla JavaScript.
- [TypeScript 6.0](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-6-0.html), [typy](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html), [JSX](https://www.typescriptlang.org/docs/handbook/jsx.html).
- [Python 3.14 — lexical analysis](https://docs.python.org/3/reference/lexical_analysis.html): prefiksy, literały, f/t-strings i słowa kontekstowe.
- [Rust Reference — tokens](https://doc.rust-lang.org/reference/tokens.html).
- [Kotlin — keywords and operators](https://kotlinlang.org/docs/keyword-reference.html).
- [Swift — lexical structure](https://docs.swift.org/latest/documentation/the-swift-programming-language/lexicalstructure/): strona referencyjna; pobieranie treści przez narzędzie było ograniczone, dlatego nie deklarujemy weryfikacji całej gramatyki Swift.
- [Go specification](https://go.dev/ref/spec).
- [TOML 1.1.0](https://toml.io/en/v1.1.0).
- [GraphQL, September 2025](https://spec.graphql.org/September2025/).
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/).
- [Terraform configuration syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration).
- [YAML 1.2.2](https://yaml.org/spec/1.2.2/).
- [JSON — RFC 8259](https://www.rfc-editor.org/rfc/rfc8259).
- [WHATWG HTML — script](https://html.spec.whatwg.org/multipage/scripting.html#the-script-element).
- [W3C CSS Nesting](https://www.w3.org/TR/css-nesting-1/): dokument modułu CSS, nie dowód wsparcia każdej funkcji przez wszystkie przeglądarki.
- [C# keywords](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/).
- [Dart keywords](https://dart.dev/language/keywords).
- [PHP keywords](https://www.php.net/manual/en/reserved.keywords.php).
- [CommonMark 0.31.2 — fenced code blocks](https://spec.commonmark.org/0.31.2/#fenced-code-blocks).
- [ISO/IEC 9899:2024 — C](https://www.iso.org/standard/82075.html): identyfikacja aktualnego opublikowanego standardu, bez dostępu do jego płatnej pełnej treści.

Nie wszystkie wersje języków mają nowy zestaw tokenów: zmiany typowania, bibliotek czy zachowania kompilatora nie wymagają osobnej reguły kolorowania. Ograniczenia konkretnej implementacji opisuje README_PL.md.
