package com.code.ide.compat;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.MenuItem;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

/**
 * Fasada własnych snippetów Emmet. Zachowuje dawne API (get/menu/handle/edit/options/form/file/result),
 * z którego korzystają EmmetBridge, EditorAssist, DroidEditActivity i Ustawienia, ale zamiast
 * AlertDialogów otwiera {@link EmmetSnippetsActivity} i {@link EmmetSnippetEditActivity}.
 *
 * Przechowywanie (SharedPreferences "emmet"):
 *  "snippets"    - mapa dla silnika {tryb:{skrót:treść}} (jak dotychczas; czytają ją EmmetBridge i EditorAssist)
 *  "snippets_v2" - pełny model z grupami (źródło prawdy)
 */
public final class EmmetSnippets {
    public static final int MENU_ID = 2113929473;
    static final String PREFS = "emmet";
    static final String[] MODES = SnippetData.MODES;

    private EmmetSnippets() {
    }

    public static void menu(Activity activity, Menu menu) {
    }

    public static boolean handle(Activity activity, MenuItem item) {
        if (item.getItemId() != MENU_ID) {
            return false;
        }
        edit(activity);
        return true;
    }

    /** Wynik wyboru pliku obsługuje teraz EmmetSnippetsActivity - tu nic nie przechwytujemy. */
    public static boolean result(Activity activity, int requestCode, int resultCode, Intent data) {
        return false;
    }

    /** Mapa dla silnika: {tryb:{skrót:treść}}. */
    public static JSONObject get(Context context) {
        try {
            return new JSONObject(context.getSharedPreferences(PREFS, 0).getString("snippets", "{}"));
        } catch (JSONException e) {
            return new JSONObject();
        }
    }

    static SnippetData load(Context context) {
        SharedPreferences p = context.getSharedPreferences(PREFS, 0);
        return SnippetData.fromStored(p.getString("snippets_v2", null), p.getString("snippets", null));
    }

    static void save(Context context, SnippetData data) throws IOException {
        if (data.count() > SnippetData.MAX_SNIPPETS) {
            throw new IOException("err_limit");
        }
        String engine = data.toEngine().toString();
        if (engine.length() > SnippetData.MAX_TOTAL_CHARS) {
            throw new IOException("err_total");
        }
        boolean ok = context.getSharedPreferences(PREFS, 0).edit()
                .putString("snippets_v2", data.toJson())
                .putString("snippets", engine)
                .putInt("snippets_schema", 2)
                .commit();
        if (!ok) {
            throw new IOException("err_save");
        }
    }

    // ------------------------------------------------------------------ wejścia z reszty aplikacji

    /** Pojedynczy wpis w Ustawieniach, który od razu otwiera ekran snippetów (zamiast podekranu z listą). */
    public static android.preference.Preference preference(Activity activity) {
        android.preference.Preference p = new android.preference.Preference(activity);
        p.setTitle(AppUi.text(activity, "emmet_snippets_title"));
        p.setSummary(AppUi.text(activity, "emmet_snippets_help"));
        int icon = activity.getResources().getIdentifier("preferences", "drawable", activity.getPackageName());
        if (icon != 0) {
            p.setIcon(icon);
        }
        p.setIntent(new Intent(activity, EmmetSnippetsActivity.class));
        return p;
    }

    static void openHelp(Activity activity) {
        try {
            Intent i = new Intent();
            i.setClassName(activity.getPackageName(), "com.aor.droidedit.custom.HelpPageViewer");
            i.putExtra("help_url", "file:///android_asset/help/pages/emmet.html#custom");
            activity.startActivity(i);
        } catch (Exception ignored) {
        }
    }

    public static void edit(Activity activity) {
        activity.startActivity(new Intent(activity, EmmetSnippetsActivity.class));
    }

    public static void options(Activity activity) {
        edit(activity);
    }

    public static void form(Activity activity, String mode, String shortcut) {
        Intent i = new Intent(activity, EmmetSnippetEditActivity.class);
        i.putExtra("mode", mode);
        if (shortcut != null) {
            i.putExtra("shortcut", shortcut);
        }
        activity.startActivity(i);
    }

    public static void file(Activity activity, boolean export) {
        Intent i = new Intent(activity, EmmetSnippetsActivity.class);
        i.putExtra("auto", export ? 2 : 1);
        activity.startActivity(i);
    }
}
