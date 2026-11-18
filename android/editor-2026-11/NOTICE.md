# Uwagi licencyjne

Licencja repozytorium (`LICENSE`) to Unlicense (domena publiczna). Dwa pliki w `src/` są
**pochodne od kodu Android Open Source Project** i podlegają **Apache License 2.0**:

- `src/com/code/ide/compat/PieceTableEditable.java` — port `android.text.SpannableStringBuilder`
  (AOSP, tag `android-14.0.0_r1`) z zamienionym magazynem znaków; nagłówek praw autorskich AOSP zachowano.
- `src/com/code/ide/compat/Grow.java` — kopia `com.android.internal.util.GrowingArrayUtils` bez ukrytych API.

Oba są generowane przez `reference/port_ssb.py` z oryginału. `reference/make_reference.py` pobiera
w czasie testu oryginalne źródła AOSP (nie są przechowywane w repozytorium).
Tekst licencji: https://www.apache.org/licenses/LICENSE-2.0

Przed publikacją należy świadomie zdecydować, jak oznaczyć te pliki względem reszty repozytorium
(np. dopisać Apache-2.0 do dokumentacji licencji). Nie jest to porada prawna.
