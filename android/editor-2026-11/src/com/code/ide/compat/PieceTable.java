package com.code.ide.compat;

/**
 * Bufor tekstu typu "piece table": tekst to lista kawałków (pieces) wskazujących na dwa bufory -
 * niezmienny oryginał (wczytany plik) oraz bufor dopisywany (tylko append). Wstawianie i usuwanie
 * zmienia wyłącznie listę kawałków, więc koszt edycji zależy od liczby kawałków i rozmiaru zmiany,
 * a nie od rozmiaru dokumentu (stary kod kopiował cały String przy każdym naciśnięciu klawisza).
 *
 * Kolejne wpisywane znaki dopisują się do ostatniego kawałka (scalanie), a przy zbyt wielu
 * kawałkach bufor jest kompaktowany do jednego.
 * Metody są synchronizowane - dokument bywa czytany z wątków w tle (zapis, kolorowanie).
 */
public final class PieceTable implements CharSequence, java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private static final int MAX_PIECES = 2048;

    // Wszystko transient: serializowany jest tylko tekst (Document trafia do onSaveInstanceState).
    private transient String original = "";
    private transient StringBuilder added = new StringBuilder();
    private transient int[] src = new int[16];   // 0 = original, 1 = added
    private transient int[] start = new int[16];
    private transient int[] len = new int[16];
    private transient int n;
    private transient int total;
    private transient String cache = "";
    private transient int cacheIdx = -1;
    private transient int cacheOff;

    /** Powyżej tylu znaków tekst nie idzie do Bundle (limit Binder ~1 MB), tylko do pliku; w strumieniu zostaje ścieżka. */
    static final int SPILL_THRESHOLD = 65536;
    /** Katalog na pliki stanu (ustawiany przez PieceTableFactory.install); null = zawsze w strumieniu. */
    static volatile java.io.File spillDir;

    private synchronized void writeObject(java.io.ObjectOutputStream out) throws java.io.IOException {
        out.defaultWriteObject();
        String text = toString();
        java.io.File dir = spillDir;
        if (dir != null && text.length() > SPILL_THRESHOLD) {
            try {
                dir.mkdirs();
                java.io.File f = new java.io.File(dir, "spill_" + System.nanoTime() + "_" + System.identityHashCode(this) + ".txt");
                java.io.OutputStream os = new java.io.FileOutputStream(f);
                try {
                    os.write(text.getBytes("UTF-8"));
                } finally {
                    os.close();
                }
                out.writeBoolean(true);
                out.writeObject(f.getAbsolutePath());
                out.writeInt(text.length());
                return;
            } catch (java.io.IOException ignored) {
                // brak miejsca / uprawnień: zapis w strumieniu
            }
        }
        out.writeBoolean(false);
        out.writeObject(text);
    }

    private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, ClassNotFoundException {
        in.defaultReadObject();
        added = new StringBuilder();
        src = new int[16];
        start = new int[16];
        len = new int[16];
        cacheIdx = -1;
        String text;
        if (in.readBoolean()) {
            String path = (String) in.readObject();
            int expected = in.readInt();
            text = readSpill(path, expected);
        } else {
            text = (String) in.readObject();
        }
        set(text);
    }

    private static String readSpill(String path, int expectedChars) {
        try {
            java.io.File f = new java.io.File(path);
            byte[] data = new byte[(int) f.length()];
            java.io.InputStream is = new java.io.FileInputStream(f);
            try {
                int off = 0;
                int n;
                while (off < data.length && (n = is.read(data, off, data.length - off)) >= 0) {
                    off += n;
                }
            } finally {
                is.close();
            }
            String t = new String(data, "UTF-8");
            return t.length() == expectedChars ? t : "";
        } catch (Exception e) {
            return "";
        }
    }

    public PieceTable() {
        set("");
    }

    public static PieceTable of(String s) {
        PieceTable p = new PieceTable();
        p.set(s);
        return p;
    }

    // ------------------------------------------------------------------ CharSequence

    @Override
    public synchronized int length() {
        return total;
    }

    @Override
    public synchronized char charAt(int index) {
        if (index < 0 || index >= total) {
            throw new IndexOutOfBoundsException("index " + index + ", length " + total);
        }
        int i = findPiece(index);
        int k = start[i] + (index - cacheOff);
        return src[i] == 0 ? original.charAt(k) : added.charAt(k);
    }

    @Override
    public CharSequence subSequence(int a, int b) {
        return substring(a, b);
    }

    public synchronized String substring(int a, int b) {
        if (a < 0 || b > total || a > b) {
            throw new IndexOutOfBoundsException("range " + a + ".." + b + ", length " + total);
        }
        if (a == b) {
            return "";
        }
        if (a == 0 && b == total) {
            return toString();
        }
        StringBuilder out = new StringBuilder(b - a);
        int i = findPiece(a);
        int off = cacheOff;
        int pos = a;
        while (pos < b) {
            int from = start[i] + (pos - off);
            int take = Math.min(len[i] - (pos - off), b - pos);
            if (src[i] == 0) {
                out.append(original, from, from + take);
            } else {
                out.append(added, from, from + take);
            }
            pos += take;
            off += len[i];
            i++;
        }
        return out.toString();
    }

    /** Kopiuje [a, b) do dest od pozycji off (jak String.getChars). */
    public synchronized void getChars(int a, int b, char[] dest, int off) {
        if (a < 0 || b > total || a > b) {
            throw new IndexOutOfBoundsException("range " + a + ".." + b + ", length " + total);
        }
        if (a == b) {
            return;
        }
        int i = findPiece(a);
        int base = cacheOff;
        int pos = a;
        while (pos < b) {
            int from = start[i] + (pos - base);
            int take = Math.min(len[i] - (pos - base), b - pos);
            if (src[i] == 0) {
                original.getChars(from, from + take, dest, off + (pos - a));
            } else {
                added.getChars(from, from + take, dest, off + (pos - a));
            }
            pos += take;
            base += len[i];
            i++;
        }
    }

    @Override
    public synchronized String toString() {
        if (cache == null) {
            StringBuilder out = new StringBuilder(total);
            for (int i = 0; i < n; i++) {
                if (src[i] == 0) {
                    out.append(original, start[i], start[i] + len[i]);
                } else {
                    out.append(added, start[i], start[i] + len[i]);
                }
            }
            cache = out.toString();
        }
        return cache;
    }

    // ------------------------------------------------------------------ zmiany

    /** Zastępuje cały zawartość (np. po wczytaniu pliku). Nie kopiuje - String staje się oryginałem. */
    public synchronized void set(String s) {
        original = s == null ? "" : s;
        added.setLength(0);
        n = 0;
        total = original.length();
        if (total > 0) {
            addPiece(n, 0, 0, total);
        }
        cache = original;
        cacheIdx = -1;
    }

    /** Zastępuje [pos, pos+deleteLen) fragmentem [insStart, insEnd) tekstu ins (bez kopiowania pośredniego). */
    public synchronized void replace(int pos, int deleteLen, CharSequence ins, int insStart, int insEnd) {
        if (insStart < 0 || insEnd < insStart || insEnd > ins.length()) {
            throw new IndexOutOfBoundsException("ins " + insStart + ".." + insEnd);
        }
        replace(pos, deleteLen, insStart == 0 && insEnd == ins.length() ? ins : new StringBuilder(insEnd - insStart).append(ins, insStart, insEnd));
    }

    /** Zastępuje [pos, pos+deleteLen) tekstem ins. */
    public synchronized void replace(int pos, int deleteLen, CharSequence ins) {
        if (pos < 0 || deleteLen < 0 || pos + deleteLen > total) {
            throw new IndexOutOfBoundsException("replace " + pos + "+" + deleteLen + ", length " + total);
        }
        if (deleteLen > 0) {
            delete(pos, deleteLen);
        }
        if (ins != null && ins.length() > 0) {
            insert(pos, ins);
        }
        if (n > MAX_PIECES) {
            set(toString());
        }
    }

    /**
     * Stosuje do bufora zmianę zgłoszoną przez edytor (TextWatcher.onTextChanged): na pozycji start
     * "before" znaków zastąpiono "count" znakami; "now" to aktualny tekst edytora.
     * Zwraca {stary fragment, nowy fragment}. Jeśli bufor rozjechał się z edytorem (np. zmiana
     * programowa bez powiadomienia), synchronizuje się pełną kopią i zwraca null - tak jak dawny
     * kod, który przy każdej zmianie nadpisywał cały tekst.
     */
    public synchronized String[] applyEdit(CharSequence now, int s, int before, int count) {
        try {
            if (s < 0 || before < 0 || count < 0 || s + before > total || s + count > now.length()) {
                throw new IndexOutOfBoundsException();
            }
            String oldPart = substring(s, s + before);
            String newPart = now.subSequence(s, s + count).toString();
            replace(s, before, newPart);
            if (total == now.length() && regionEquals(s, newPart)) {
                return new String[]{oldPart, newPart};
            }
        } catch (RuntimeException ignored) {
        }
        set(now.toString());
        return null;
    }

    private boolean regionEquals(int s, String part) {
        return part.equals(substring(s, s + part.length()));
    }

    // ------------------------------------------------------------------ wnętrze

    private int findPiece(int pos) {
        int i;
        int off;
        if (cacheIdx >= 0 && cacheIdx < n) {
            i = cacheIdx;
            off = cacheOff;
        } else {
            i = 0;
            off = 0;
        }
        if (pos < off) {
            while (i > 0 && pos < off) {
                i--;
                off -= len[i];
            }
        } else {
            while (i < n - 1 && pos >= off + len[i]) {
                off += len[i];
                i++;
            }
        }
        cacheIdx = i;
        cacheOff = off;
        return i;
    }

    private void insert(int pos, CharSequence cs) {
        int l = cs.length();
        cache = null;
        int base = added.length();
        if (n == 0) {
            added.append(cs);
            addPiece(0, 1, base, l);
        } else if (pos == total) {
            int last = n - 1;
            if (src[last] == 1 && start[last] + len[last] == base) {
                added.append(cs);
                len[last] += l;
            } else {
                added.append(cs);
                addPiece(n, 1, base, l);
            }
        } else {
            int i = findPiece(pos);
            int k = pos - cacheOff;
            if (k == 0) {
                if (i > 0 && src[i - 1] == 1 && start[i - 1] + len[i - 1] == base) {
                    added.append(cs);
                    len[i - 1] += l;
                } else {
                    added.append(cs);
                    addPiece(i, 1, base, l);
                }
            } else {
                int tailStart = start[i] + k;
                int tailLen = len[i] - k;
                int tailSrc = src[i];
                len[i] = k;
                added.append(cs);
                addPiece(i + 1, 1, base, l);
                addPiece(i + 2, tailSrc, tailStart, tailLen);
            }
        }
        total += l;
        cacheIdx = -1;
    }

    private void delete(int pos, int count) {
        cache = null;
        int i = findPiece(pos);
        int k = pos - cacheOff;
        int remaining = count;
        if (k > 0) {
            int avail = len[i] - k;
            if (remaining < avail) {
                addPiece(i + 1, src[i], start[i] + k + remaining, avail - remaining);
                len[i] = k;
                remaining = 0;
            } else {
                len[i] = k;
                remaining -= avail;
                i++;
            }
        }
        while (remaining > 0) {
            if (len[i] <= remaining) {
                remaining -= len[i];
                removePiece(i);
            } else {
                start[i] += remaining;
                len[i] -= remaining;
                remaining = 0;
            }
        }
        total -= count;
        cacheIdx = -1;
    }

    private void addPiece(int index, int s, int st, int l) {
        if (n == src.length) {
            int cap = n * 2;
            src = java.util.Arrays.copyOf(src, cap);
            start = java.util.Arrays.copyOf(start, cap);
            len = java.util.Arrays.copyOf(len, cap);
        }
        if (index < n) {
            System.arraycopy(src, index, src, index + 1, n - index);
            System.arraycopy(start, index, start, index + 1, n - index);
            System.arraycopy(len, index, len, index + 1, n - index);
        }
        src[index] = s;
        start[index] = st;
        len[index] = l;
        n++;
    }

    private void removePiece(int index) {
        if (index < n - 1) {
            System.arraycopy(src, index + 1, src, index, n - index - 1);
            System.arraycopy(start, index + 1, start, index, n - index - 1);
            System.arraycopy(len, index + 1, len, index, n - index - 1);
        }
        n--;
    }

    /** Do testów: liczba kawałków. */
    synchronized int pieces() {
        return n;
    }
}
