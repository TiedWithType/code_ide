package com.code.ide.compat;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Teksty interfejsu snippetów Emmet (pl / en). */
final class T {
    private static final Map<String, String[]> M = new HashMap<String, String[]>();

    private static void a(String k, String en, String pl) {
        M.put(k, new String[]{en, pl});
    }

    static {
        a("title", "Emmet snippets", "Snippety Emmet");
        a("languages", "Languages", "Języki");
        a("groups", "Groups", "Grupy");
        a("snippets", "Snippets", "Snippety");
        a("ungrouped", "Ungrouped", "Bez grupy");
        a("assistant", "Typing assistant", "Asystent pisania");
        a("suggestions", "Emmet suggestions", "Podpowiedzi Emmet");
        a("pairs", "Auto-close pairs and HTML", "Domykanie par i HTML");
        a("help", "Help: custom snippets", "Pomoc: własne snippety");
        a("add", "Add snippet", "Dodaj snippet");
        a("edit", "Edit snippet", "Edytuj snippet");
        a("import", "Import JSON", "Importuj JSON");
        a("export", "Export JSON", "Eksportuj JSON");
        a("new_group", "New group", "Nowa grupa");
        a("rename_group", "Rename group", "Zmień nazwę grupy");
        a("delete_group", "Delete group", "Usuń grupę");
        a("group_name", "Group name", "Nazwa grupy");
        a("ok", "OK", "OK");
        a("cancel", "Cancel", "Anuluj");
        a("save", "Save", "Zapisz");
        a("delete", "Delete", "Usuń");
        a("delete_again", "Tap again to delete", "Dotknij ponownie, aby usunąć");
        a("undo", "Undo", "Cofnij");
        a("deleted", "Deleted", "Usunięto");
        a("group_deleted", "Group deleted", "Grupę usunięto");
        a("language", "Language", "Język");
        a("group", "Group (optional)", "Grupa (opcjonalnie)");
        a("shortcut", "Shortcut, e.g. card", "Skrót, np. card");
        a("body", "Body, e.g. article.card>h2{${1:Title}}", "Treść, np. article.card>h2{${1:Tytuł}}");
        a("field_help_markup", "HTML/XML/JSX: fields only work inside {text} or [attribute], e.g. h1{${1:field}${0}}. ${0} = final cursor.", "HTML/XML/JSX: pola działają tylko wewnątrz {tekst} lub [atrybut], np. h1{${1:pole}${0}}. ${0} = końcowy kursor.");
        a("field_help_style", "CSS/SCSS/Sass/Stylus: fields work anywhere, e.g. color: ${1:#000};${0}", "CSS/SCSS/Sass/Stylus: pola działają wszędzie, np. color: ${1:#000};${0}");
        a("warn_fields", "Outside {…} or […] this field becomes a wrong tag (e.g. <1>). Write h1{${1:field}${0}} instead of h1>${1:field}${0}.", "Poza {…} lub […] to pole stanie się błędnym znacznikiem (np. <1>). Zapisz h1{${1:pole}${0}} zamiast h1>${1:pole}${0}.");
        a("empty", "Nothing here yet.", "Nic tu jeszcze nie ma.");
        a("err_required", "Enter a shortcut without spaces.", "Wpisz skrót bez spacji.");
        a("err_space", "Shortcut cannot contain spaces.", "Skrót nie może zawierać spacji.");
        a("err_key_long", "Shortcut is too long (max 64).", "Skrót jest za długi (maks. 64).");
        a("err_body_empty", "Body is required.", "Treść jest wymagana.");
        a("err_body_long", "Body is too long (max 4096).", "Treść jest za długa (maks. 4096).");
        a("err_group_long", "Group name is too long (max 40).", "Nazwa grupy jest za długa (maks. 40).");
        a("err_dup", "This shortcut already exists for this language.", "Ten skrót już istnieje w tym języku.");
        a("err_limit", "Snippet limit reached (300).", "Osiągnięto limit snippetów (300).");
        a("err_total", "Snippets are too large in total (max 256 Ki chars).", "Snippety są łącznie za duże (maks. 256 Ki znaków).");
        a("err_group_exists", "This group already exists.", "Ta grupa już istnieje.");
        a("err_save", "Could not save snippets.", "Nie udało się zapisać snippetów.");
        a("saved", "Saved", "Zapisano");
        a("discard_hint", "Press back again to discard changes", "Naciśnij wstecz ponownie, aby odrzucić zmiany");
        a("exported", "Snippets exported.", "Wyeksportowano snippety.");
        a("export_fail", "Export failed.", "Eksport nie powiódł się.");
        a("import_fail_read", "Could not read the file.", "Nie udało się odczytać pliku.");
        a("import_fail_json", "This is not a valid JSON file.", "To nie jest poprawny plik JSON.");
        a("import_fail_big", "The file is too large.", "Plik jest za duży.");
        a("import_fail_many", "The file has too many snippets (max 300).", "Plik ma za dużo snippetów (maks. 300).");
        a("import_preview", "Import preview", "Podgląd importu");
        a("import_summary", "In file: %d snippets (%d new, %d already exist)", "W pliku: %d snippetów (%d nowych, %d już istnieje)");
        a("import_skipped", "Skipped invalid entries: %d", "Pominięto błędnych wpisów: %d");
        a("problem_mode", "unknown language: ", "nieznany język: ");
        a("problem_type", "wrong value type: ", "zły typ wartości: ");
        a("problem_entry", "invalid entry: ", "błędny wpis: ");
        a("merge_keep", "Merge, keep mine on conflict", "Scal, zachowaj moje przy konflikcie");
        a("merge_overwrite", "Merge, overwrite mine on conflict", "Scal, nadpisz moje przy konflikcie");
        a("replace_all", "Replace all my snippets", "Zastąp wszystkie moje snippety");
        a("apply", "Import", "Importuj");
        a("imported", "Imported: %d added, %d updated, %d skipped", "Zaimportowano: %d dodanych, %d zaktualizowanych, %d pominiętych");
    }

    static boolean pl() {
        return "pl".equals(Locale.getDefault().getLanguage());
    }

    static String t(String key) {
        String[] v = M.get(key);
        return v == null ? key : v[pl() ? 1 : 0];
    }

    static String f(String key, Object... args) {
        return String.format(Locale.getDefault(), t(key), args);
    }

    /** "1 snippet", "3 snippety", "5 snippetów" / "1 group", "2 groups". */
    static String snippets(int n) {
        if (!pl()) {
            return n + (n == 1 ? " snippet" : " snippets");
        }
        return n + " " + (n == 1 ? "snippet" : (n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 12 || n % 100 > 14)) ? "snippety" : "snippetów");
    }

    static String groupsN(int n) {
        if (!pl()) {
            return n + (n == 1 ? " group" : " groups");
        }
        return n + " " + (n == 1 ? "grupa" : (n % 10 >= 2 && n % 10 <= 4 && (n % 100 < 12 || n % 100 > 14)) ? "grupy" : "grup");
    }

    /** Problem z parsera "klucz|arg" -> tekst. */
    static String problem(String p) {
        int i = p.indexOf('|');
        return i < 0 ? p : t(p.substring(0, i)) + p.substring(i + 1);
    }
}
