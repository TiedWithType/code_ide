package com.code.ide.compat;

import android.content.Intent;

/** Adres strony pomocy do otwarcia w HelpPageViewer (domyślnie indeks; tylko własne zasoby pomocy). */
public final class HelpLink {
    private static final String BASE = "file:///android_asset/help/";

    private HelpLink() {
    }

    public static String url(Intent intent) {
        String u = intent == null ? null : intent.getStringExtra("help_url");
        if (u != null && u.startsWith(BASE) && u.indexOf("..") < 0) {
            return u;
        }
        return BASE + "index.html";
    }
}
