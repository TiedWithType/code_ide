package com.code.ide.compat;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.provider.OpenableColumns;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Locale;

/**
 * Otwieranie plików z zewnątrz (content://) tak, aby zapis trafiał do ORYGINAŁU.
 *
 * 1. Próbuje rozwiązać prawdziwą ścieżkę pliku (DocumentsProvider / MediaStore / kolumna _data)
 *    i otwiera ją bezpośrednio - zapis idzie wprost do oryginału.
 * 2. Jeśli się nie da (np. FileProvider innej aplikacji), robi poprawną kopię w cache
 *    i zapamiętuje powiązanie kopia -> URI; po każdym zapisie dokumentu {@link #afterSave}
 *    odsyła zawartość kopii do oryginalnego URI przez ContentResolver.
 */
public final class UriBridge {
    private static final String PREFS = "uri_bridge";

    private UriBridge() {
    }

    /** Zwraca plik do otwarcia w edytorze albo null, gdy nie da się odczytać URI. */
    public static File open(Context ctx, Uri uri) {
        if (uri == null) {
            return null;
        }
        File real = resolveRealFile(ctx, uri);
        if (real != null) {
            return real;
        }
        return copyToCache(ctx, uri);
    }

    /** Wywoływane po zapisie pliku lokalnego; jeśli to kopia z URI - odsyła ją do oryginału. */
    public static void afterSave(final Context ctx, File f) {
        if (ctx == null || f == null) {
            return;+        }
        String uriStr = prefs(ctx).getString(f.getAbsolutePath(), null);
        if (uriStr == null) {
            return;
        }
        boolean ok = false;
        try {
            Uri uri = Uri.parse(uriStr);
            OutputStream os = ctx.getContentResolver().openOutputStream(uri, "wt");
            if (os != null) {
                try {
                    FileInputStream in = new FileInputStream(f);
                    try {
                        pump(in, os);
                    } finally {
                        in.close();
                    }
                } finally {
                    os.close();
                }
                ok = true;
            }
        } catch (Throwable ignored) {
        }
        if (!ok) {
            toast(ctx, "pl".equals(Locale.getDefault().getLanguage())
                    ? "Nie można zapisać do oryginalnego pliku (brak uprawnień do zapisu)"
                    : "Cannot write back to the original file (no write permission)");
        }
    }

    // ---------------------------------------------------------------- rozwiązywanie ścieżki

    static File resolveRealFile(Context ctx, Uri uri) {
        String path = null;
        try {
            if (DocumentsContract.isDocumentUri(ctx, uri)) {
                String auth = uri.getAuthority();
                String docId = DocumentsContract.getDocumentId(uri);
                if ("com.android.externalstorage.documents".equals(auth)) {
                    int c = docId.indexOf(':');
                    if (c > 0) {
                        String vol = docId.substring(0, c);
                        String rel = docId.substring(c + 1);
                        if ("primary".equalsIgnoreCase(vol)) {
                            path = Environment.getExternalStorageDirectory().getAbsolutePath() + "/" + rel;
                        } else {
                            path = "/storage/" + vol + "/" + rel;
                        }
                    }
                } else if ("com.android.providers.downloads.documents".equals(auth)) {
                    if (docId.startsWith("raw:")) {
                        path = docId.substring(4);
                    } else if (docId.matches("\\d+")) {
                        path = queryData(ctx, ContentUris.withAppendedId(
                                Uri.parse("content://downloads/public_downloads"), Long.parseLong(docId)));
                    }
                } else if ("com.android.providers.media.documents".equals(auth)) {
                    int c = docId.indexOf(':');
                    if (c > 0) {
                        String type = docId.substring(0, c);
                        long id = Long.parseLong(docId.substring(c + 1));
                        Uri base;
                        if ("image".equals(type)) {
                            base = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                        } else if ("video".equals(type)) {
                            base = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
                        } else if ("audio".equals(type)) {
                            base = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
                        } else {
                            base = MediaStore.Files.getContentUri("external");
                        }
                        path = queryData(ctx, ContentUris.withAppendedId(base, id));
                    }
                }
            }
            if (path == null) {
                path = queryData(ctx, uri);
            }
        } catch (Throwable ignored) {
            path = null;
        }
        if (path == null || path.length() == 0) {
            return null;
        }
        try {
            File f = new File(path).getCanonicalFile();
            if (isAllowedLocation(ctx, f) && f.isFile() && f.canRead() && f.canWrite()) {
                return f;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** Ścieżka musi leżeć w pamięci współdzielonej - nigdy w prywatnych danych tej aplikacji. */
    private static boolean isAllowedLocation(Context ctx, File f) throws Exception {
        String p = f.getPath();
        String ext = Environment.getExternalStorageDirectory().getCanonicalPath();
        String own = ctx.getApplicationInfo().dataDir;
        if (own != null && p.startsWith(new File(own).getCanonicalPath())) {
            return false;
        }
        return p.startsWith(ext + "/") || p.startsWith("/storage/") || p.startsWith("/sdcard/");
    }

    private static String queryData(Context ctx, Uri uri) {
        Cursor c = null;
        try {
            c = ctx.getContentResolver().query(uri, new String[]{"_data"}, null, null, null);
            if (c != null && c.moveToFirst()) {
                int i = c.getColumnIndex("_data");
                if (i >= 0) {
                    return c.getString(i);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) {
                c.close();
            }
        }
        return null;
    }

    // ---------------------------------------------------------------- kopia awaryjna

    private static File copyToCache(Context ctx, Uri uri) {
        ContentResolver cr = ctx.getContentResolver();
        InputStream in = null;
        try {
            in = cr.openInputStream(uri);
            if (in == null) {
                return null;
            }
            File dir = new File(new File(ctx.getCacheDir(), "uri_docs"), sha1(uri.toString()));
            dir.mkdirs();
            File out = new File(dir, safeName(displayName(cr, uri)));
            FileOutputStream os = new FileOutputStream(out);
            try {
                pump(in, os);
            } finally {
                os.close();
            }
            prefs(ctx).edit().putString(out.getAbsolutePath(), uri.toString()).apply();
            try {
                cr.takePersistableUriPermission(uri,
                        Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            } catch (Throwable ignored) {
            }
            return out;
        } catch (Throwable t) {
            return null;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    private static String displayName(ContentResolver cr, Uri uri) {
        Cursor c = null;
        try {
            c = cr.query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null);
            if (c != null && c.moveToFirst()) {
                int i = c.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (i >= 0) {
                    return c.getString(i);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) {
                c.close();
            }
        }
        String last = uri.getLastPathSegment();
        return last;
    }

    private static String safeName(String name) {
        if (name == null) {
            return "untitled.txt";
        }
        name = name.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        if (name.length() == 0 || name.equals(".") || name.equals("..")) {
            return "untitled.txt";
        }
        return name;
    }

    // ---------------------------------------------------------------- narzędzia

    private static void pump(InputStream in, OutputStream out) throws Exception {
        byte[] buf = new byte[16 * 1024];
        int n;
        while ((n = in.read(buf)) != -1) {
            out.write(buf, 0, n);
        }
        out.flush();
    }

    private static String sha1(String s) throws Exception {
        byte[] d = MessageDigest.getInstance("SHA-1").digest(s.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(String.format("%02x", d[i] & 0xff));
        }
        return sb.toString();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static void toast(final Context ctx, final String msg) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                Toast.makeText(ctx.getApplicationContext(), msg, Toast.LENGTH_LONG).show();
            }
        });
    }
}
