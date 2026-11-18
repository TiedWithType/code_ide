import android.text.*;
import com.code.ide.compat.PieceTableEditable;
import java.util.*;

public class EditableDiffTest {
    static class Mark { final int id; Mark(int id) { this.id = id; } }
    static class Watch extends Mark implements TextWatcher, SpanWatcher {
        List<String> log;
        Watch(int id, List<String> log) { super(id); this.log = log; }
        public void beforeTextChanged(CharSequence s, int st, int c, int a) { log.add("before " + s.length() + " " + st + " " + c + " " + a); }
        public void onTextChanged(CharSequence s, int st, int b, int c) { log.add("on " + s.length() + " " + st + " " + b + " " + c); }
        public void afterTextChanged(Editable e) { log.add("after " + e.length()); }
        public void onSpanAdded(Spannable t, Object w, int s, int e) { log.add("sadd " + idOf(w) + " " + s + " " + e); }
        public void onSpanRemoved(Spannable t, Object w, int s, int e) { log.add("srem " + idOf(w) + " " + s + " " + e); }
        public void onSpanChanged(Spannable t, Object w, int os, int oe, int ns, int ne) { log.add("schg " + idOf(w) + " " + os + " " + oe + " " + ns + " " + ne); }
    }
    static int idOf(Object o) { return o instanceof Mark ? ((Mark) o).id : -1 - o.getClass().getName().hashCode() % 7; }

    static final int[] FLAGS = {Spanned.SPAN_INCLUSIVE_INCLUSIVE, Spanned.SPAN_INCLUSIVE_EXCLUSIVE, Spanned.SPAN_EXCLUSIVE_INCLUSIVE,
            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE, Spanned.SPAN_PARAGRAPH, Spanned.SPAN_INCLUSIVE_INCLUSIVE | (3 << 16), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE | (7 << 16)};

    static class Side {
        Editable ed; List<String> log = new ArrayList<String>(); Mark[] pool;
        Side(Editable e, int n) { ed = e; pool = new Mark[n]; for (int i = 0; i < n; i++) pool[i] = (i % 3 == 0) ? new Watch(i, log) : new Mark(i); }
    }
    static final Mark[] SRC_MARKS = {new Mark(1000), new Mark(1001), new Mark(1002)};

    static int fails = 0;
    static String rnd(Random r, int n) { StringBuilder sb = new StringBuilder(); for (int i = 0; i < n; i++) sb.append("ab c\n\u017C".charAt(r.nextInt(6))); return sb.toString(); }

    public static void main(String[] args) {
        int seeds = Integer.getInteger("seeds", 150), steps = Integer.getInteger("steps", 700), initLen = Integer.getInteger("init", 60);
        for (long seed = 1; seed <= seeds && fails == 0; seed++) {
            Random r = new Random(seed);
            String init = rnd(r, initLen == 60 ? r.nextInt(60) : initLen);
            Side R = new Side(new SpannableStringBuilder(init), 9);
            Side M = new Side(new PieceTableEditable(init), 9);
            Side[] both = {R, M};
            for (int step = 0; step < steps && fails == 0; step++) {
                int len = R.ed.length();
                int op = r.nextInt(16);
                int a = len == 0 ? 0 : r.nextInt(len + 1), b = len == 0 ? 0 : r.nextInt(len + 1);
                int lo = Math.min(a, b), hi = Math.max(a, b);
                String txt = rnd(r, r.nextInt(r.nextInt(10) == 0 ? 30 : 5));
                int pi = r.nextInt(9), fl = FLAGS[r.nextInt(FLAGS.length)];
                int sel2 = r.nextInt(len + 1);
                // źródło ze spanami (wspólne obiekty)
                SpannableStringBuilder src = new SpannableStringBuilder(rnd(r, 8));
                for (Mark m : SRC_MARKS) if (r.nextInt(2) == 0) { int x = r.nextInt(src.length() + 1), y = r.nextInt(src.length() + 1); src.setSpan(m, Math.min(x, y), Math.max(x, y), FLAGS[r.nextInt(4)]); }
                boolean rare12 = r.nextInt(12) == 0, rare25 = r.nextInt(25) == 0;
                String[] ex = new String[2];
                for (int k = 0; k < 2; k++) {
                    Side s = both[k];
                    try {
                        switch (op) {
                            case 0: case 1: case 2: s.ed.replace(lo, hi, txt); break;
                            case 3: s.ed.insert(a, txt); break;
                            case 4: s.ed.delete(lo, hi); break;
                            case 5: s.ed.append(txt); break;
                            case 6: case 7: case 8: s.ed.setSpan(s.pool[pi], lo, hi, fl); break;
                            case 9: s.ed.removeSpan(s.pool[pi]); break;
                            case 10: Selection.setSelection(s.ed, lo, hi); break;
                            case 11: Selection.setSelection(s.ed, a); break;
                            case 12: s.ed.replace(lo, hi, src, 0, src.length()); break;
                            case 13: s.ed.replace(lo, hi, txt, 0, txt.length()); break;
                            case 14: if (rare12) s.ed.clearSpans(); else s.ed.insert(a, src); break;
                            case 15: if (rare25) s.ed.clear(); else s.ed.replace(0, len, txt); break;+                        }
                    } catch (Throwable t) { ex[k] = t.getClass().getName(); }
                }
                String ctx = "seed " + seed + " step " + step + " op " + op;
                if (!Objects.equals(ex[0], ex[1])) { fail(ctx + " wyjątki: " + ex[0] + " vs " + ex[1]); break; }
                compare(R, M, r, ctx);
                R.log.clear(); M.log.clear();
            }
        }
        System.out.println(fails == 0 ? "WSZYSTKIE OK (" + seeds + " ziaren x " + steps + " operacji)" : "BŁĘDY: " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }

    static void fail(String m) { fails++; System.out.println("FAIL: " + m); }

    static String describe(Side s) {
        StringBuilder sb = new StringBuilder();
        List<Object> all = new ArrayList<Object>(Arrays.asList(s.pool));
        all.addAll(Arrays.asList(SRC_MARKS));
        for (Object o : all) sb.append(idOf(o)).append(':').append(s.ed.getSpanStart(o)).append(',').append(s.ed.getSpanEnd(o)).append(',').append(s.ed.getSpanFlags(o)).append(' ');
        return sb.toString();
    }

    static String order(Side s, int a, int b, Class<?> k) {
        Object[] o = s.ed.getSpans(a, b, k);
        StringBuilder sb = new StringBuilder();
        for (Object x : o) sb.append(idOf(x)).append(' ');
        return sb.toString();
    }

    static void compare(Side R, Side M, Random r, String ctx) {
        if (!R.ed.toString().equals(M.ed.toString())) { fail(ctx + " tekst:\n" + R.ed + "\n" + M.ed); return; }
        if (R.ed.length() != M.ed.length()) { fail(ctx + " długość"); return; }
        int len = R.ed.length();
        if (len > 0) { int i = r.nextInt(len); if (R.ed.charAt(i) != M.ed.charAt(i)) fail(ctx + " charAt"); }
        String dr = describe(R), dm = describe(M);
        if (!dr.equals(dm)) { fail(ctx + " rozpiętości:\n" + dr + "\n" + dm); return; }
        int a = r.nextInt(len + 1), b = r.nextInt(len + 1);
        int lo = Math.min(a, b), hi = Math.max(a, b);
        if (!order(R, 0, len, Object.class).equals(order(M, 0, len, Object.class))) { fail(ctx + " getSpans(all):\n" + order(R, 0, len, Object.class) + "\n" + order(M, 0, len, Object.class)); return; }
        if (!order(R, lo, hi, Mark.class).equals(order(M, lo, hi, Mark.class))) { fail(ctx + " getSpans(range)"); return; }
        if (R.ed.nextSpanTransition(lo, len, Object.class) != M.ed.nextSpanTransition(lo, len, Object.class)) { fail(ctx + " nextSpanTransition"); return; }
        if (Selection.getSelectionStart(R.ed) != Selection.getSelectionStart(M.ed) || Selection.getSelectionEnd(R.ed) != Selection.getSelectionEnd(M.ed)) { fail(ctx + " selection"); return; }
        if (!R.log.equals(M.log)) { fail(ctx + " zdarzenia watcherów:\n" + R.log + "\n" + M.log); return; }
        if (len > 3 && !R.ed.subSequence(lo, hi).toString().equals(M.ed.subSequence(lo, hi).toString())) { fail(ctx + " subSequence"); return; }
        char[] c1 = new char[hi - lo], c2 = new char[hi - lo];
        ((GetChars) R.ed).getChars(lo, hi, c1, 0); ((GetChars) M.ed).getChars(lo, hi, c2, 0);
        if (!Arrays.equals(c1, c2)) fail(ctx + " getChars");
    }
}
