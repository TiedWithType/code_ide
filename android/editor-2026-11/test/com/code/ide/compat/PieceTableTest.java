package com.code.ide.compat;

import java.util.Random;

public class PieceTableTest {
    static int fails = 0;
    static void check(boolean c, String m) { if (!c) { fails++; System.out.println("FAIL: " + m); } }

    public static void main(String[] a) {
        for (long seed = 1; seed <= 40; seed++) {
            Random r = new Random(seed);
            StringBuilder ref = new StringBuilder();
            String init = rnd(r, r.nextInt(300));
            ref.append(init);
            PieceTable pt = PieceTable.of(init);
            for (int step = 0; step < 4000; step++) {
                int op = r.nextInt(10);
                int len = ref.length();
                if (op < 4) { // insert
                    int pos = r.nextInt(len + 1); String s = rnd(r, 1 + r.nextInt(r.nextInt(8) == 0 ? 40 : 3));
                    ref.insert(pos, s); pt.replace(pos, 0, s);
                } else if (op < 6 && len > 0) { // delete
                    int pos = r.nextInt(len); int d = 1 + r.nextInt(Math.min(len - pos, r.nextInt(6) == 0 ? 50 : 3));
                    ref.delete(pos, pos + d); pt.replace(pos, d, "");
                } else if (op < 7 && len > 0) { // replace
                    int pos = r.nextInt(len); int d = 1 + r.nextInt(Math.min(len - pos, 5)); String s = rnd(r, r.nextInt(6));
                    ref.replace(pos, pos + d, s); pt.replace(pos, d, s);
                } else if (op < 8) { // typing at end / sequential
                    String s = rnd(r, 1); ref.append(s); pt.replace(ref.length() - 1, 0, s);
                } else if (len > 0) { // reads
                    int i = r.nextInt(len); check(pt.charAt(i) == ref.charAt(i), "charAt seed " + seed + " step " + step);
                    int x = r.nextInt(len + 1), y = x + r.nextInt(len - x + 1);
                    check(pt.substring(x, y).equals(ref.substring(x, y)), "substring seed " + seed + " step " + step);
                }
                check(pt.length() == ref.length(), "length seed " + seed + " step " + step);
                if (step % 97 == 0) check(pt.toString().equals(ref.toString()), "toString seed " + seed + " step " + step);
                if (fails > 5) { System.out.println("za dużo błędów"); System.exit(1); }
            }
            check(pt.toString().equals(ref.toString()), "final seed " + seed);
            check(pt.pieces() <= 2049, "pieces bounded: " + pt.pieces());
        }
        // applyEdit: zgodne i rozjechane
        PieceTable pt = PieceTable.of("hello world");
        StringBuilder ed = new StringBuilder("hello world");
        ed.replace(5, 6, ", big "); // editor: "hello, big world"? (replace " " with ", big ")
        String[] r = pt.applyEdit(ed, 5, 1, 6);
        check(r != null && r[0].equals(" ") && r[1].equals(", big ") && pt.toString().equals(ed.toString()), "applyEdit zgodny");
        // rozjazd: edytor zmieniony bez powiadomienia
        ed.insert(0, "XX");
        ed.insert(3, "Y"); // zgłaszamy tylko ostatnią zmianę
        r = pt.applyEdit(ed, 3, 0, 1);
        check(r == null && pt.toString().equals(ed.toString()), "applyEdit resynchronizacja");
        // podwójne zastosowanie tej samej wstawki
        pt = PieceTable.of("abc"); ed = new StringBuilder("aXbc");
        r = pt.applyEdit(ed, 1, 0, 1); check(r != null && pt.toString().equals("aXbc"), "wstawka 1");
        r = pt.applyEdit(ed, 1, 0, 1); check(pt.toString().equals(ed.toString()), "wstawka 2x -> zsynchronizowane");
        // serializacja
        try {
            PieceTable sp = PieceTable.of("abc def"); sp.replace(3, 0, "XYZ"); sp.replace(0, 1, "");
            java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
            java.io.ObjectOutputStream oo = new java.io.ObjectOutputStream(bo); oo.writeObject(sp); oo.close();
            PieceTable back = (PieceTable) new java.io.ObjectInputStream(new java.io.ByteArrayInputStream(bo.toByteArray())).readObject();
            check(back.toString().equals(sp.toString()) && back.length() == sp.length(), "serializacja round-trip");
            back.replace(1, 0, "q"); check(back.charAt(1) == 'q', "po deserializacji działa");
        } catch (Exception e) { check(false, "serializacja: " + e); }
        // serializacja dużego tekstu przez plik (omijanie limitu Bundle)
        try {
            java.io.File dir = java.nio.file.Files.createTempDirectory("spill").toFile();
            PieceTable.spillDir = dir;
            StringBuilder sb = new StringBuilder(); for (int i = 0; i < 30000; i++) sb.append("zażółć gęślą jaźń ").append(i).append('\n');
            PieceTable big = PieceTable.of(sb.toString()); big.replace(5, 0, "EDIT");
            java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
            java.io.ObjectOutputStream oo = new java.io.ObjectOutputStream(bo); oo.writeObject(big); oo.close();
            check(bo.size() < 2000, "strumień mały dla dużego tekstu: " + bo.size() + " B");
            check(dir.list().length == 1, "powstał plik stanu");
            PieceTable back = (PieceTable) new java.io.ObjectInputStream(new java.io.ByteArrayInputStream(bo.toByteArray())).readObject();
            check(back.toString().equals(big.toString()), "odczyt z pliku stanu");
            for (java.io.File f : dir.listFiles()) f.delete();
            back = (PieceTable) new java.io.ObjectInputStream(new java.io.ByteArrayInputStream(bo.toByteArray())).readObject();
            check(back.length() == 0, "brak pliku -> pusty tekst, bez wyjątku");
            PieceTable.spillDir = null;
        } catch (Exception e) { check(false, "spill: " + e); }
        // duży plik: wydajność
        StringBuilder big = new StringBuilder(); for (int i = 0; i < 200000; i++) big.append("line ").append(i).append('\n');
        String bigS = big.toString();
        PieceTable bp = PieceTable.of(bigS);
        long t0 = System.nanoTime();
        for (int i = 0; i < 20000; i++) bp.replace(bigS.length() / 2 + i, 0, "x");
        long t1 = System.nanoTime();
        System.out.println("20000 wstawień w środku " + bigS.length() / 1024 + " KiB: " + (t1 - t0) / 1000000 + " ms, kawałków: " + bp.pieces());
        StringBuilder sb = new StringBuilder(bigS);
        long t2 = System.nanoTime();
        for (int i = 0; i < 20000; i++) { String s = sb.toString(); sb.insert(bigS.length() / 2 + i, "x"); }
        System.out.println("odniesienie (toString + insert, jak stary kod): " + (System.nanoTime() - t2) / 1000000 + " ms");
        System.out.println(fails == 0 ? "WSZYSTKIE OK" : fails + " BŁĘDÓW");
        System.exit(fails == 0 ? 0 : 1);
    }

    static String rnd(Random r, int n) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) sb.append("ab c\nżó".charAt(r.nextInt(7)));
        return sb.toString();
    }
}
