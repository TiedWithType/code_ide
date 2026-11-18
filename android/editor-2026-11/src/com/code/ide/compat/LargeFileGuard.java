package com.code.ide.compat;

import android.content.Context;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;

/**
 * Wczytywanie dużych plików do edytora. Zamiast sztywnego limitu 1 MB sprawdza, czy edytor jest w stanie
 * plik przetworzyć: rozmiar nie może przekraczać {@link #HARD_CAP}, a dostępna pamięć sterty musi
 * wystarczyć na {@link #FACTOR} bajtów na każdy bajt pliku (bufor odczytu, dekodowanie, tekst dokumentu,
 * bufor EditText, układ wierszy i numery linii). Gdy nie wystarcza - rzuca {@link TooBigException}
 * i plik nie jest otwierany. OutOfMemoryError podczas odczytu jest traktowany tak samo.
 */
public final class LargeFileGuard {
    /** Górna granica niezależna od pamięci: układ tekstu rośnie z liczbą wierszy. */
    static final long HARD_CAP = 32L << 20;
    /** Zapas pamięci na bajt pliku (szczyt przy wczytywaniu to ok. 7x, stan ustalony 3-4x). */
    static final int FACTOR = 16;

    public static final class TooBigException extends IOException {
        TooBigException(String message) {
            super(message);
        }
    }

    private LargeFileGuard() {
    }

    /** Wczytuje size bajtów ze strumienia, dekoduje i normalizuje końce linii. Zawsze zamyka strumień. */
    public static String read(Context ctx, InputStream in, long size, String charset) throws IOException {
        try {
            check(size);
            byte[] bts = new byte[(int) size];
            int off = 0;
            int n;
            while (off < bts.length && (n = in.read(bts, off, bts.length - off)) >= 0) {
                off += n;
            }
            String s = new String(bts, 0, off, charset);
            bts = null;
            return normalize(s);
        } catch (OutOfMemoryError e) {
            throw tooBig(size);
        } finally {
            try {
                in.close();
            } catch (IOException ignored) {
            }
        }
    }
+    /** Rzuca TooBigException, gdy edytor nie poradzi sobie z plikiem o takim rozmiarze. */
    static void check(long size) throws TooBigException {
        if (size > HARD_CAP) {
            throw tooBig(size);
        }
        if (size * FACTOR > available()) {
            System.gc();
            if (size * FACTOR > available()) {
                throw tooBig(size);
            }
        }
    }

    /** Największy plik, jaki edytor przyjmie przy obecnym stanie pamięci. */
    static long maxFileSize() {
        return Math.min(HARD_CAP, Math.max(0, available() / FACTOR));
    }

    private static long available() {
        Runtime rt = Runtime.getRuntime();
        return rt.maxMemory() - (rt.totalMemory() - rt.freeMemory());
    }

    private static TooBigException tooBig(long size) {
        String file = mb(size);
        String limit = mb(maxFileSize());
        boolean pl = "pl".equals(Locale.getDefault().getLanguage());
        return new TooBigException(pl
                ? "Plik (" + file + ") jest za duży dla edytora. Przy obecnej dostępnej pamięci można otworzyć pliki do ok. " + limit + "."
                : "The file (" + file + ") is too large for the editor. With the memory currently available you can open files up to about " + limit + ".");
    }

    private static String mb(long bytes) {
        return String.format(Locale.US, "%.1f MB", bytes / 1048576.0);
    }

    /** CRLF i samotne CR -> LF w jednym przebiegu (to samo co dwa replaceAll, bez kopii pośrednich). */
    static String normalize(String s) {
        if (s.indexOf('\r') < 0) {
            return s;
        }
        int n = s.length();
        char[] out = new char[n];
        int j = 0;
        for (int i = 0; i < n; i++) {
            char c = s.charAt(i);
            if (c == '\r') {
                out[j++] = '\n';
                if (i + 1 < n && s.charAt(i + 1) == '\n') {
                    i++;
                }
            } else {
                out[j++] = c;
            }
        }
        return new String(out, 0, j);
    }

    /** Toast z błędu otwierania: dla zbyt dużego pliku konkretny komunikat, inaczej standardowy tekst. */
    public static void report(Context ctx, Exception e, int defaultMessageRes) {
        if (e instanceof TooBigException) {
            Toast.makeText(ctx, e.getMessage(), Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(ctx, defaultMessageRes, Toast.LENGTH_SHORT).show();
        }
    }
}
