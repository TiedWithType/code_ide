package com.code.ide.compat;

public class SnippetDataTest {
    static int fails = 0;
    static void check(boolean c, String m) { if (!c) { fails++; System.out.println("FAIL: " + m); } else System.out.println("ok: " + m); }

    public static void main(String[] a) throws Exception {
        // v1 + BOM
        SnippetData.Parsed p = SnippetData.parse("\uFEFF{\"html\":{\"card\":\"article.card>h2{${1:T}}\"},\"css\":{\"brand\":\"color: #6750a4;\"}}");
        check(p.data.count() == 2 && p.skipped == 0, "v1 z BOM");
        // emmet config
        p = SnippetData.parse("{\"html\":{\"snippets\":{\"x\":\"div.x\"}}}");
        check(p.data.get("html", "x") != null, "format Emmet snippets");
        // v2 round trip with tricky content
        SnippetData d = new SnippetData();
        d.put("html", "card", "line1\n\t\"q\" \\ / </div> \u2028 ąę", "Layout");
        d.put("html", "plain", "p", "");
        d.put("css", "b", "color:red;", "");
        d.addGroup("html", "Empty");
        String json = d.toJson();
        check(json.indexOf("\\/") < 0, "brak ucieczki \\/");
        SnippetData.Parsed r = SnippetData.parse(json);
        check(r.data.count() == 3, "round-trip liczba");
        check("line1\n\t\"q\" \\ / </div> \u2028 ąę".equals(r.data.get("html", "card").body), "round-trip treść");
        check("Layout".equals(r.data.get("html", "card").group), "round-trip grupa");
        check(r.data.groupNames("html").contains("Empty"), "pusta grupa zachowana");
        // puste
        check(SnippetData.parse("{}").data.count() == 0, "{} poprawne");
        // błędy
        try { SnippetData.parse("nie json"); check(false, "błędny JSON"); } catch (SnippetData.FormatException e) { check("import_fail_json".equals(e.getMessage()), "błędny JSON"); }
        p = SnippetData.parse("{\"php\":{\"a\":\"b\"},\"html\":{\"bad key\":\"x\",\"ok\":\"y\",\"n\":5}}");
        check(p.data.count() == 1 && p.skipped == 3, "pominięte: " + p.skipped);
        // merge
        SnippetData m = new SnippetData(); m.put("html", "card", "OLD", ""); 
        SnippetData o = new SnippetData(); o.put("html", "card", "NEW", "G"); o.put("html", "n", "N", "");
        int[] df = m.diff(o);
        check(df[0] == 1 && df[1] == 1, "diff");
        SnippetData k = m.copy(); int[] r1 = k.merge(o, SnippetData.MERGE_KEEP);
        check(r1[0] == 1 && r1[2] == 1 && "OLD".equals(k.get("html", "card").body), "merge keep");
        k = m.copy(); r1 = k.merge(o, SnippetData.MERGE_OVERWRITE);
        check(r1[1] == 1 && "NEW".equals(k.get("html", "card").body), "merge overwrite");
        k = m.copy(); k.merge(o, SnippetData.REPLACE_ALL);
        check(k.count() == 2, "replace all");
        // grupy
        d.renameGroup("html", "Layout", "Struktura");
        check("Struktura".equals(d.get("html", "card").group), "rename group");
        d.deleteGroup("html", "Struktura", false);
        check("".equals(d.get("html", "card").group), "delete group -> ungrouped");
        // silnik
        check(d.toEngine().getJSONObject("html").has("card"), "toEngine");
        // limit
        StringBuilder big = new StringBuilder("{\"html\":{");
        for (int i = 0; i < 301; i++) big.append(i == 0 ? "" : ",").append("\"k").append(i).append("\":\"x\"");
        big.append("}}");
        try { SnippetData.parse(big.toString()); check(false, "limit"); } catch (SnippetData.FormatException e) { check("import_fail_many".equals(e.getMessage()), "limit 300"); }
        // pola poza {} w znacznikach
        check(SnippetData.hasFieldOutsideBraces("html", "h1>${1:pole}${0}"), "pole poza {} -> ostrzeżenie");
        check(!SnippetData.hasFieldOutsideBraces("html", "h1{${1:pole}${0}}"), "pole w {} OK");
        check(!SnippetData.hasFieldOutsideBraces("html", "a[href=${1:url}]{${2:t}}"), "pole w [] i {} OK");
        check(SnippetData.hasFieldOutsideBraces("jsx", "div{x}+${0}"), "${0} na końcu poza {}");
        check(!SnippetData.hasFieldOutsideBraces("css", "color: ${1:#000};${0}"), "css: pola wszędzie");
        check(!SnippetData.hasFieldOutsideBraces("html", "ul>li.item$*3"), "numerator $ bez {");
        System.out.println(fails == 0 ? "WSZYSTKIE OK" : fails + " BŁĘDÓW");
        System.exit(fails == 0 ? 0 : 1);
    }
}
