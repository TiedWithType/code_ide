package com.code.ide.compat;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * Model własnych snippetów Emmet: język -> (skrót -> wpis{treść, grupa}).
 * Czysta logika (bez UI i Androida poza org.json), dzięki czemu da się ją testować na JVM.
 *
 * Formaty JSON przy imporcie:
 *  v1     {"html":{"card":"article.card"}, "css":{"brand":"color:#000"}}
 *  v2     {"format":"code-ide-emmet-snippets","version":2,
 *          "groups":{"html":["Layout"]},
 *          "snippets":{"html":{"card":{"body":"article.card","group":"Layout"}}}}
 *  emmet  {"html":{"snippets":{"card":"article.card"}}}   (konfiguracja Emmet)
 * Eksport zawsze w formacie v2.
 */
final class SnippetData {
    static final String[] MODES = {"html", "xhtml", "xml", "jsx", "css", "scss", "sass", "stylus"};
    static final int MAX_SNIPPETS = 300;
    static final int MAX_KEY = 64;
    static final int MAX_BODY = 4096;
    static final int MAX_GROUP = 40;
    static final int MAX_TOTAL_CHARS = 262144;
    static final int MAX_FILE_BYTES = 1048576;
    static final String FORMAT = "code-ide-emmet-snippets";

    static final int MERGE_KEEP = 0;
    static final int MERGE_OVERWRITE = 1;
    static final int REPLACE_ALL = 2;

    static final class Entry {
        final String body;
        final String group;

        Entry(String body, String group) {
            this.body = body;
            this.group = group == null ? "" : group;
        }
    }

    /** Błąd formatu; message to klucz tekstu (patrz T). */
    static final class FormatException extends Exception {
        FormatException(String key) {
            super(key);
        }
    }

    static final class Parsed {
        SnippetData data = new SnippetData();
        int skipped;
        final List<String> problems = new ArrayList<String>();
    }

    final Map<String, TreeMap<String, Entry>> snippets = new LinkedHashMap<String, TreeMap<String, Entry>>();
    final Map<String, TreeSet<String>> groups = new LinkedHashMap<String, TreeSet<String>>();

    // ------------------------------------------------------------------ zapytania

    static boolean isMode(String m) {
        for (String s : MODES) {
            if (s.equals(m)) {
                return true;
            }
        }
        return false;
    }

    int count() {
        int n = 0;
        for (TreeMap<String, Entry> m : snippets.values()) {
            n += m.size();
        }
        return n;
    }

    int count(String mode) {
        TreeMap<String, Entry> m = snippets.get(mode);
        return m == null ? 0 : m.size();
    }

    int count(String mode, String group) {
        TreeMap<String, Entry> m = snippets.get(mode);
        int n = 0;
        if (m != null) {
            for (Entry e : m.values()) {
                if (e.group.equals(group)) {
                    n++;
                }
            }
        }
        return n;
    }

    Entry get(String mode, String shortcut) {
        TreeMap<String, Entry> m = snippets.get(mode);
        return m == null ? null : m.get(shortcut);
    }

    /** Nazwy grup (jawne + używane), bez pustej "bez grupy", sortowane bez względu na wielkość liter. */
    List<String> groupNames(String mode) {
        TreeSet<String> all = new TreeSet<String>(String.CASE_INSENSITIVE_ORDER);
        TreeSet<String> explicit = groups.get(mode);
        if (explicit != null) {
            all.addAll(explicit);
        }
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m != null) {
            for (Entry e : m.values()) {
                if (e.group.length() > 0) {
                    all.add(e.group);
                }
            }
        }
        return new ArrayList<String>(all);
    }

    /** Skróty w grupie (group == "" -> bez grupy), posortowane. */
    List<String> shortcuts(String mode, String group) {
        List<String> out = new ArrayList<String>();
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m != null) {
            for (Map.Entry<String, Entry> e : m.entrySet()) {
                if (e.getValue().group.equals(group)) {
                    out.add(e.getKey());
                }
            }
        }
        Collections.sort(out, new Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                return a.compareToIgnoreCase(b);
            }
        });
        return out;
    }

    // ------------------------------------------------------------------ zmiany

    void put(String mode, String shortcut, String body, String group) {
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m == null) {
            m = new TreeMap<String, Entry>();
            snippets.put(mode, m);
        }
        m.put(shortcut, new Entry(body, group));
    }

    boolean remove(String mode, String shortcut) {
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m == null) {
            return false;
        }
        boolean r = m.remove(shortcut) != null;
        if (m.isEmpty()) {
            snippets.remove(mode);
        }
        return r;
    }

    void addGroup(String mode, String name) {
        TreeSet<String> g = groups.get(mode);
        if (g == null) {
            g = new TreeSet<String>();
            groups.put(mode, g);
        }
        g.add(name);
    }

    boolean hasGroup(String mode, String name) {
        for (String g : groupNames(mode)) {
            if (g.equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    /** Zmienia nazwę grupy; scala z istniejącą o tej samej nazwie. */
    void renameGroup(String mode, String oldName, String newName) {
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m != null) {
            for (Map.Entry<String, Entry> e : new ArrayList<Map.Entry<String, Entry>>(m.entrySet())) {
                if (e.getValue().group.equals(oldName)) {
                    m.put(e.getKey(), new Entry(e.getValue().body, newName));
                }
            }
        }
        TreeSet<String> g = groups.get(mode);
        if (g != null && g.remove(oldName)) {
            g.add(newName);
        }
    }

    /** Usuwa grupę; snippety przechodzą do "bez grupy" albo są usuwane. */
    void deleteGroup(String mode, String name, boolean deleteSnippets) {
        TreeMap<String, Entry> m = snippets.get(mode);
        if (m != null) {
            for (Map.Entry<String, Entry> e : new ArrayList<Map.Entry<String, Entry>>(m.entrySet())) {
                if (e.getValue().group.equals(name)) {
                    if (deleteSnippets) {
                        m.remove(e.getKey());
                    } else {
                        m.put(e.getKey(), new Entry(e.getValue().body, ""));
                    }
                }
            }
            if (m.isEmpty()) {
                snippets.remove(mode);
            }
        }
        TreeSet<String> g = groups.get(mode);
        if (g != null) {
            g.remove(name);
        }
    }

    SnippetData copy() {
        SnippetData d = new SnippetData();
        for (Map.Entry<String, TreeMap<String, Entry>> e : snippets.entrySet()) {
            d.snippets.put(e.getKey(), new TreeMap<String, Entry>(e.getValue()));
        }
        for (Map.Entry<String, TreeSet<String>> e : groups.entrySet()) {
            d.groups.put(e.getKey(), new TreeSet<String>(e.getValue()));
        }
        return d;
    }

    /** Liczy: [0]=nowe, [1]=istniejące (kolidujące) po stronie other względem this. */
    int[] diff(SnippetData other) {
        int added = 0;
        int existing = 0;
        for (Map.Entry<String, TreeMap<String, Entry>> e : other.snippets.entrySet()) {
            for (String k : e.getValue().keySet()) {
                if (get(e.getKey(), k) == null) {
                    added++;
                } else {
                    existing++;
                }
            }
        }
        return new int[]{added, existing};
    }

    /** Scala other do this. Zwraca [dodane, zaktualizowane, pominięte]. */
    int[] merge(SnippetData other, int how) {
        int added = 0;
        int updated = 0;
        int skipped = 0;
        if (how == REPLACE_ALL) {
            snippets.clear();
            groups.clear();
        }
        for (Map.Entry<String, TreeMap<String, Entry>> e : other.snippets.entrySet()) {
            for (Map.Entry<String, Entry> s : e.getValue().entrySet()) {
                Entry cur = get(e.getKey(), s.getKey());
                if (cur == null) {
                    put(e.getKey(), s.getKey(), s.getValue().body, s.getValue().group);
                    added++;
                } else if (how == MERGE_OVERWRITE) {
                    put(e.getKey(), s.getKey(), s.getValue().body, s.getValue().group);
                    updated++;
                } else {
                    skipped++;
                }
            }
        }
        for (Map.Entry<String, TreeSet<String>> g : other.groups.entrySet()) {
            for (String name : g.getValue()) {
                addGroup(g.getKey(), name);
            }
        }
        return new int[]{added, updated, skipped};
    }

    // ------------------------------------------------------------------ walidacja

    static boolean isMarkup(String mode) {
        return "html".equals(mode) || "xhtml".equals(mode) || "xml".equals(mode) || "jsx".equals(mode);
    }

    /**
     * W składni znaczników Emmet pole ${1:x} / ${0} jest polem tylko wewnątrz {tekst} lub [atrybut];
     * poza nimi "$" to numerator, a "{...}" tekst, więc powstaje błędny znacznik (np. <1>).
     * Zwraca true, gdy treść ma "${" poza takimi nawiasami (dla języków CSS zawsze false).
     */
    static boolean hasFieldOutsideBraces(String mode, String body) {
        if (!isMarkup(mode) || body == null) {
            return false;
        }
        int braces = 0;
        int brackets = 0;
        for (int i = 0; i < body.length(); i++) {
            char c = body.charAt(i);
            if (c == '\\') {
                i++;
            } else if (c == '$' && i + 1 < body.length() && body.charAt(i + 1) == '{') {
                if (braces == 0 && brackets == 0) {
                    return true;
                }
                braces++;
                i++;
            } else if (c == '{') {
                braces++;
            } else if (c == '}') {
                if (braces > 0) {
                    braces--;
                }
            } else if (c == '[') {
                brackets++;
            } else if (c == ']') {
                if (brackets > 0) {
                    brackets--;
                }
            }
        }
        return false;
    }

    /** Zwraca klucz błędu (T) albo null. */
    static String validateShortcut(String s) {
        if (s == null || s.length() == 0) {
            return "err_required";
        }
        if (s.length() > MAX_KEY) {
            return "err_key_long";
        }
        for (int i = 0; i < s.length(); i++) {
            if (Character.isWhitespace(s.charAt(i))) {
                return "err_space";
            }
        }
        return null;
    }

    static String validateBody(String b) {
        if (b == null || b.length() == 0) {
            return "err_body_empty";
        }
        if (b.length() > MAX_BODY) {
            return "err_body_long";
        }
        return null;
    }

    static String validateGroup(String g) {
        if (g != null && g.length() > MAX_GROUP) {
            return "err_group_long";
        }
        return null;
    }

    static String cleanGroup(String g) {
        if (g == null) {
            return "";
        }
        return g.replaceAll("\\s+", " ").trim();
    }

    /** Całkowity rozmiar JSON-a przekazywanego silnikowi. */
    int engineChars() {
        return toEngine().toString().length();
    }

    // ------------------------------------------------------------------ JSON

    /** Mapa dla silnika Emmet: {tryb:{skrót:treść}} - bez grup. */
    JSONObject toEngine() {
        JSONObject root = new JSONObject();
        try {
            for (Map.Entry<String, TreeMap<String, Entry>> e : snippets.entrySet()) {
                if (e.getValue().isEmpty()) {
                    continue;
                }
                JSONObject mode = new JSONObject();
                for (Map.Entry<String, Entry> s : e.getValue().entrySet()) {
                    mode.put(s.getKey(), s.getValue().body);
                }
                root.put(e.getKey(), mode);
            }
        } catch (JSONException ignored) {
        }
        return root;
    }

    /** Eksport v2: czytelny, posortowany, bez ucieczki "\/" (UTF-8). */
    String toJson() {
        StringBuilder sb = new StringBuilder();
        sb.append("{\n  \"format\": ").append(q(FORMAT)).append(",\n  \"version\": 2,\n");
        sb.append("  \"groups\": {");
        boolean firstMode = true;
        for (String mode : MODES) {
            List<String> names = groupNames(mode);
            if (names.isEmpty()) {
                continue;
            }
            sb.append(firstMode ? "\n" : ",\n");
            firstMode = false;
            sb.append("    ").append(q(mode)).append(": [");
            for (int i = 0; i < names.size(); i++) {
                sb.append(i == 0 ? "" : ", ").append(q(names.get(i)));
            }
            sb.append("]");
        }
        sb.append(firstMode ? "},\n" : "\n  },\n");
        sb.append("  \"snippets\": {");
        firstMode = true;
        for (String mode : MODES) {
            TreeMap<String, Entry> m = snippets.get(mode);
            if (m == null || m.isEmpty()) {
                continue;
            }
            sb.append(firstMode ? "\n" : ",\n");
            firstMode = false;
            sb.append("    ").append(q(mode)).append(": {");
            boolean first = true;
            for (Map.Entry<String, Entry> s : m.entrySet()) {
                sb.append(first ? "\n" : ",\n");
                first = false;
                sb.append("      ").append(q(s.getKey())).append(": {\"body\": ").append(q(s.getValue().body));
                if (s.getValue().group.length() > 0) {
                    sb.append(", \"group\": ").append(q(s.getValue().group));
                }
                sb.append("}");
            }
            sb.append("\n    }");
        }
        sb.append(firstMode ? "}\n}\n" : "\n  }\n}\n");
        return sb.toString();
    }

    static String q(String s) {
        StringBuilder sb = new StringBuilder(s.length() + 2);
        sb.append('"');
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '"':
                    sb.append("\\\"");
                    break;
                case '\\':
                    sb.append("\\\\");
                    break;
                case '\n':
                    sb.append("\\n");
                    break;
                case '\r':
                    sb.append("\\r");
                    break;
                case '\t':
                    sb.append("\\t");
                    break;
                case '\b':
                    sb.append("\\b");
                    break;
                case '\f':
                    sb.append("\\f");
                    break;
                default:
                    if (c < 0x20 || c == '\u2028' || c == '\u2029') {
                        sb.append(String.format("\\u%04x", (int) c));
                    } else {
                        sb.append(c);
                    }
            }
        }
        return sb.append('"').toString();
    }

    /** Wczytuje zapisane dane: v2 (jeśli poprawne), inaczej stary format (tylko mapa silnika). */
    static SnippetData fromStored(String v2, String legacy) {
        if (v2 != null && v2.length() > 0) {
            try {
                return parse(v2).data;
            } catch (FormatException ignored) {
            }
        }
        if (legacy != null && legacy.length() > 0) {
            try {
                return parse(legacy).data;
            } catch (FormatException ignored) {
            }
        }
        return new SnippetData();
    }

    static Parsed parse(String text) throws FormatException {
        if (text == null) {
            throw new FormatException("import_fail_json");
        }
        if (text.length() > 0 && text.charAt(0) == '\uFEFF') {
            text = text.substring(1);
        }
        text = text.trim();
        if (text.length() == 0) {
            throw new FormatException("import_fail_json");
        }
        JSONObject root;
        try {
            Object v = new org.json.JSONTokener(text).nextValue();
            if (!(v instanceof JSONObject)) {
                throw new FormatException("import_fail_json");
            }
            root = (JSONObject) v;
        } catch (JSONException e) {
            throw new FormatException("import_fail_json");
        }
        Parsed out = new Parsed();
        boolean v2 = root.optJSONObject("snippets") != null && (root.has("version") || root.has("format"));
        JSONObject body = v2 ? root.optJSONObject("snippets") : root;
        Iterator<String> modes = body.keys();
        while (modes.hasNext()) {
            String mode = modes.next();
            Object mv = body.opt(mode);
            if (!isMode(mode)) {
                if (!v2 && isMetaKey(mode)) {
                    continue;
                }
                out.skipped++;
                addProblem(out, "problem_mode", mode);
                continue;
            }
            if (!(mv instanceof JSONObject)) {
                out.skipped++;
                addProblem(out, "problem_type", mode);
                continue;
            }
            JSONObject mo = (JSONObject) mv;
            Object inner = mo.opt("snippets");
            if (inner instanceof JSONObject) {
                mo = (JSONObject) inner; // konfiguracja Emmet: {"html":{"snippets":{...}}}
            }
            Iterator<String> keys = mo.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                Object val = mo.opt(key);
                String b = null;
                String g = "";
                if (val instanceof String) {
                    b = (String) val;
                } else if (val instanceof JSONObject) {
                    b = ((JSONObject) val).optString("body", null);
                    g = cleanGroup(((JSONObject) val).optString("group", ""));
                }
                String err = validateShortcut(key);
                if (err == null && b != null) {
                    b = b.replace("\r\n", "\n").replace('\r', '\n');
                    err = validateBody(b);
                } else if (err == null) {
                    err = "err_body_empty";
                }
                if (err == null) {
                    err = validateGroup(g);
                }
                if (err != null) {
                    out.skipped++;
                    addProblem(out, "problem_entry", mode + " · " + key);
                    continue;
                }
                out.data.put(mode, key, b, g);
                if (out.data.count() > MAX_SNIPPETS) {
                    throw new FormatException("import_fail_many");
                }
            }
        }
        JSONObject gr = v2 ? root.optJSONObject("groups") : null;
        if (gr != null) {
            Iterator<String> gm = gr.keys();
            while (gm.hasNext()) {
                String mode = gm.next();
                org.json.JSONArray arr = gr.optJSONArray(mode);
                if (arr == null || !isMode(mode)) {
                    continue;
                }
                for (int i = 0; i < arr.length(); i++) {
                    String name = cleanGroup(arr.optString(i, ""));
                    if (name.length() > 0 && validateGroup(name) == null) {
                        out.data.addGroup(mode, name);
                    }
                }
            }
        }
        if (out.data.engineChars() > MAX_TOTAL_CHARS) {
            throw new FormatException("import_fail_big");
        }
        return out;
    }

    private static boolean isMetaKey(String k) {
        return "format".equals(k) || "version".equals(k) || "groups".equals(k) || "$schema".equals(k);
    }

    private static void addProblem(Parsed p, String key, String arg) {
        if (p.problems.size() < 5) {
            p.problems.add(key + "|" + arg);
        }
    }
}
