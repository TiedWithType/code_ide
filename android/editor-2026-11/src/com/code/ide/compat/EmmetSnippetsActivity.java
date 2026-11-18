package com.code.ide.compat;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Zarządzanie własnymi snippetami Emmet. Jedna aktywność, kilka poziomów (extra "view"):
 *   0 - języki + asystent pisania, 1 - grupy w języku, 2 - snippety w grupie.
 * Import ma własny ekran podglądu (scalanie / zastępowanie) w tej samej aktywności.
 * Nie używa AlertDialog: pola nazw i potwierdzenia są wbudowane w ekran, usuwanie ma "Cofnij".
 */
public class EmmetSnippetsActivity extends Activity {
    static final int V_ROOT = 0;
    static final int V_LANG = 1;
    static final int V_GROUP = 2;
    private static final int REQ_IMPORT = 1;
    private static final int REQ_EXPORT = 2;

    private static final int R_HEADER = 0;
    private static final int R_ITEM = 1;
    private static final int R_SWITCH = 2;
    private static final int R_RADIO = 3;
    private static final int R_NOTE = 4;

    private static SnippetData.Parsed pending;

    private static final class Row {
        int type;
        String title;
        String sub;
        boolean checked;
        Runnable click;
        Runnable longClick;
        CompoundButton.OnCheckedChangeListener onCheck;
    }

    private interface InputHandler {
        /** Zwraca klucz błędu albo null, gdy przyjęto. */
        String accept(String text);
    }

    private int view;
    private String mode;
    private String group = "";
    private SnippetData data = new SnippetData();
    private final List<Row> rows = new ArrayList<Row>();
    private Adapter adapter;
    private ListView listView;
    private LinearLayout inputPanel;
    private EditText inputEdit;
    private InputHandler inputHandler;
    private LinearLayout previewBar;
    private LinearLayout undoBar;
    private TextView undoText;
    private SnippetData undoSnapshot;
    private boolean preview;
    private int mergeHow = SnippetData.MERGE_KEEP;
    private final Handler ui = new Handler(Looper.getMainLooper());
    private final Runnable hideUndo = new Runnable() {
        @Override
        public void run() {
            undoBar.setVisibility(View.GONE);
            undoSnapshot = null;
        }
    };

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        view = getIntent().getIntExtra("view", V_ROOT);
        mode = getIntent().getStringExtra("mode");
        String g = getIntent().getStringExtra("group");
        group = g == null ? "" : g;
        if (view != V_ROOT && !SnippetData.isMode(mode)) {
            view = V_ROOT;
        }
        buildLayout();
        if (getActionBar() != null) {
            getActionBar().setDisplayHomeAsUpEnabled(true);
        }
        if (state == null && view == V_ROOT) {
            int auto = getIntent().getIntExtra("auto", 0);
            getIntent().removeExtra("auto");
            if (auto == 1) {
                startImport();
            } else if (auto == 2) {
                startExport();
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        rebuild();
    }

    @Override
    protected void onDestroy() {
        ui.removeCallbacks(hideUndo);
        super.onDestroy();
    }

    // ------------------------------------------------------------------ układ

    private void buildLayout() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);

        inputPanel = new LinearLayout(this);
        inputPanel.setOrientation(LinearLayout.HORIZONTAL);
        inputPanel.setGravity(Gravity.CENTER_VERTICAL);
        int p = Ui.dp(this, 12);
        inputPanel.setPadding(p, p / 2, p, p / 2);
        inputEdit = new EditText(this);
        inputEdit.setSingleLine();
        inputPanel.addView(inputEdit, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        inputPanel.addView(Ui.button(this, T.t("ok"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submitInput();+            }
        }));
        inputPanel.addView(Ui.button(this, T.t("cancel"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                hideInput();
            }
        }));
        inputPanel.setVisibility(View.GONE);
        root.addView(inputPanel, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        listView = new ListView(this);
        adapter = new Adapter();
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                Row r = rows.get(position);
                if (r.click != null) {
                    r.click.run();
                }
            }
        });
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View v, int position, long id) {
                Row r = rows.get(position);
                if (r.longClick != null) {
                    r.longClick.run();
                    return true;
                }
                return false;
            }
        });
        root.addView(listView, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        previewBar = new LinearLayout(this);
        previewBar.setOrientation(LinearLayout.HORIZONTAL);
        previewBar.setPadding(p, p / 2, p, p / 2);
        Button apply = Ui.button(this, T.t("apply"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                applyImport();
            }
        });
        Button cancel = Ui.button(this, T.t("cancel"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                endPreview();
            }
        });
        previewBar.addView(apply, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        previewBar.addView(cancel, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        previewBar.setVisibility(View.GONE);
        root.addView(previewBar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        undoBar = new LinearLayout(this);
        undoBar.setOrientation(LinearLayout.HORIZONTAL);
        undoBar.setGravity(Gravity.CENTER_VERTICAL);
        undoBar.setBackgroundColor(0xFF323232);
        undoBar.setPadding(p, p / 2, p, p / 2);
        undoText = Ui.text(this, "", 15, false, 0xFFFFFFFF);
        undoBar.addView(undoText, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button undo = Ui.button(this, T.t("undo"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                doUndo();
            }
        });
        undoBar.addView(undo);
        undoBar.setVisibility(View.GONE);
        root.addView(undoBar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        setContentView(root);
        AppUi.applyFont(root);
    }

    // ------------------------------------------------------------------ dane i wiersze

    private void rebuild() {
        data = EmmetSnippets.load(this);
        rows.clear();
        if (preview && pending != null) {
            buildPreviewRows();
        } else if (view == V_ROOT) {
            buildRootRows();
        } else if (view == V_LANG) {
            buildLangRows();
        } else {
            buildGroupRows();
        }
        setTitle(titleText());
        previewBar.setVisibility(preview ? View.VISIBLE : View.GONE);
        adapter.notifyDataSetChanged();
        invalidateOptionsMenu();
    }

    private String titleText() {
        if (preview) {
            return T.t("import_preview");
        }
        if (view == V_ROOT) {
            return T.t("title");
        }
        if (view == V_LANG) {
            return mode.toUpperCase();
        }
        return mode.toUpperCase() + " · " + (group.length() == 0 ? T.t("ungrouped") : group);
    }

    private Row row(int type, String title, String sub) {
        Row r = new Row();
        r.type = type;
        r.title = title;
        r.sub = sub;
        rows.add(r);
        return r;
    }

    private void buildRootRows() {
        row(R_HEADER, T.t("languages"), null);
        for (final String m : SnippetData.MODES) {
            int n = data.count(m);
            Row r = row(R_ITEM, m.toUpperCase(), T.snippets(n) + " · " + T.groupsN(data.groupNames(m).size()));
            r.click = new Runnable() {
                @Override
                public void run() {
                    openLevel(V_LANG, m, "");
                }
            };
        }
        row(R_HEADER, T.t("assistant"), null);
        addSwitch("suggestions", T.t("suggestions"));
        addSwitch("pairs", T.t("pairs"));
    }

    private void addSwitch(final String key, String label) {
        final SharedPreferences prefs = getSharedPreferences(EmmetSnippets.PREFS, 0);
        Row r = row(R_SWITCH, label, null);
        r.checked = prefs.getBoolean(key, true);
        r.onCheck = new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean checked) {
                prefs.edit().putBoolean(key, checked).apply();
                EditorAssist.dismiss(EmmetSnippetsActivity.this);
            }
        };
    }

    private void buildLangRows() {
        row(R_HEADER, T.t("groups"), null);
        List<String> names = data.groupNames(mode);
        int ungrouped = data.count(mode, "");
        if (ungrouped > 0 || names.isEmpty()) {
            addGroupRow("", T.t("ungrouped"), ungrouped);
        }
        for (String g : names) {
            addGroupRow(g, g, data.count(mode, g));
        }
        if (data.count(mode) == 0 && names.isEmpty()) {
            row(R_NOTE, T.t("empty"), null);
        }
    }

    private void addGroupRow(final String g, String title, int count) {
        Row r = row(R_ITEM, title, T.snippets(count));
        r.click = new Runnable() {
            @Override
            public void run() {
                openLevel(V_GROUP, mode, g);
            }
        };
    }

    private void buildGroupRows() {
        row(R_HEADER, T.t("snippets"), null);
        List<String> keys = data.shortcuts(mode, group);
        if (keys.isEmpty()) {
            row(R_NOTE, T.t("empty"), null);
        }
        for (final String k : keys) {
            String body = data.get(mode, k).body;
            int nl = body.indexOf('\n');
            String line = nl >= 0 ? body.substring(0, nl) + " …" : body;
            if (line.length() > 90) {
                line = line.substring(0, 90) + "…";
            }
            Row r = row(R_ITEM, k, line);
            r.click = new Runnable() {
                @Override
                public void run() {
                    openEditor(mode, k, group);
                }
            };
            r.longClick = new Runnable() {
                @Override
                public void run() {
                    mutate("deleted", new Runnable() {
                        @Override
                        public void run() {
                            data.remove(mode, k);
                        }
                    });
                }
            };
        }
    }

    private void buildPreviewRows() {
        int[] d = data.diff(pending.data);
        int total = pending.data.count();
        row(R_NOTE, T.f("import_summary", total, d[0], d[1]), null);
        if (pending.skipped > 0) {
            row(R_NOTE, T.f("import_skipped", pending.skipped), null);
            for (String pr : pending.problems) {
                row(R_NOTE, "• " + T.problem(pr), null);
            }
        }
        addRadio(SnippetData.MERGE_KEEP, T.t("merge_keep"));
        addRadio(SnippetData.MERGE_OVERWRITE, T.t("merge_overwrite"));
        addRadio(SnippetData.REPLACE_ALL, T.t("replace_all"));
    }

    private void addRadio(final int how, String label) {
        Row r = row(R_RADIO, label, null);
        r.checked = mergeHow == how;
        r.click = new Runnable() {
            @Override
            public void run() {
                mergeHow = how;
                rebuild();
            }
        };
    }

    // ------------------------------------------------------------------ nawigacja i akcje

    private void openLevel(int v, String m, String g) {
        Intent i = new Intent(this, EmmetSnippetsActivity.class);
        i.putExtra("view", v);
        i.putExtra("mode", m);
        i.putExtra("group", g);
        startActivity(i);
    }

    private void openEditor(String m, String shortcut, String g) {
        Intent i = new Intent(this, EmmetSnippetEditActivity.class);
        i.putExtra("mode", m == null ? "html" : m);
        if (shortcut != null) {
            i.putExtra("shortcut", shortcut);
        }
        i.putExtra("group", g == null ? "" : g);
        startActivity(i);
    }

    private void openHelp() {
        EmmetSnippets.openHelp(this);
    }

    private boolean saveData() {
        try {
            EmmetSnippets.save(this, data);
            return true;
        } catch (IOException e) {
            toast(T.t(e.getMessage()));
            return false;
        }
    }

    /** Zmienia dane z możliwością cofnięcia (zamiast okien potwierdzenia). */
    private void mutate(String messageKey, Runnable change) {
        SnippetData before = data.copy();
        change.run();
        if (saveData()) {
            showUndo(T.t(messageKey), before);
        }
        rebuild();
    }

    private void showUndo(String message, SnippetData before) {
        undoSnapshot = before;
        undoText.setText(message);
        undoBar.setVisibility(View.VISIBLE);
        ui.removeCallbacks(hideUndo);
        ui.postDelayed(hideUndo, 6000);
    }

    private void doUndo() {
        if (undoSnapshot != null) {
            data = undoSnapshot;
            saveData();
        }
        ui.removeCallbacks(hideUndo);
        hideUndo.run();
        rebuild();
    }

    // ------------------------------------------------------------------ pole tekstowe (nowa grupa / zmiana nazwy)

    private void showInput(String initial, InputHandler h) {
        inputHandler = h;
        inputEdit.setHint(T.t("group_name"));
        inputEdit.setText(initial);
        inputEdit.setError(null);
        inputPanel.setVisibility(View.VISIBLE);
        inputEdit.requestFocus();
        inputEdit.setSelection(inputEdit.getText().length());
        InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.showSoftInput(inputEdit, 0);
        }
    }

    private void hideInput() {
        inputPanel.setVisibility(View.GONE);
        inputHandler = null;
        InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.hideSoftInputFromWindow(inputEdit.getWindowToken(), 0);
        }
    }

    private void submitInput() {
        if (inputHandler == null) {
            return;
        }
        String err = inputHandler.accept(SnippetData.cleanGroup(inputEdit.getText().toString()));
        if (err != null) {
            inputEdit.setError(T.t(err));
        } else {
            hideInput();
            rebuild();
        }
    }

    // ------------------------------------------------------------------ import / eksport

    private void startImport() {
        try {
            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            i.setType("*/*");
            i.addCategory(Intent.CATEGORY_OPENABLE);
            startActivityForResult(i, REQ_IMPORT);
        } catch (Exception e) {
            toast(T.t("import_fail_read"));
        }
    }

    private void startExport() {
        try {
            Intent i = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            i.setType("application/json");
            i.addCategory(Intent.CATEGORY_OPENABLE);
            i.putExtra(Intent.EXTRA_TITLE, "emmet-snippets.json");
            startActivityForResult(i, REQ_EXPORT);
        } catch (Exception e) {
            toast(T.t("export_fail"));
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent result) {
        super.onActivityResult(requestCode, resultCode, result);
        if (resultCode != RESULT_OK || result == null || result.getData() == null) {
            return;
        }
        final Uri uri = result.getData();
        if (requestCode == REQ_IMPORT) {
            readImport(uri);
        } else if (requestCode == REQ_EXPORT) {
            writeExport(uri, EmmetSnippets.load(this).toJson());
        }
    }

    private void readImport(final Uri uri) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                String error = null;
                SnippetData.Parsed parsed = null;
                try {
                    InputStream in = getContentResolver().openInputStream(uri);
                    if (in == null) {
                        throw new IOException();
                    }
                    ByteArrayOutputStream bo = new ByteArrayOutputStream();
                    try {
                        byte[] buf = new byte[8192];
                        int n;
                        while ((n = in.read(buf)) != -1) {
                            bo.write(buf, 0, n);
                            if (bo.size() > SnippetData.MAX_FILE_BYTES) {
                                throw new SnippetData.FormatException("import_fail_big");
                            }
                        }
                    } finally {
                        in.close();
                    }
                    parsed = SnippetData.parse(new String(bo.toByteArray(), "UTF-8"));
                } catch (SnippetData.FormatException e) {
                    error = e.getMessage();
                } catch (Throwable t) {
                    error = "import_fail_read";
                }
                final String err = error;
                final SnippetData.Parsed res = parsed;
                ui.post(new Runnable() {
                    @Override
                    public void run() {
                        if (isFinishing()) {
                            return;
                        }
                        if (err != null) {
                            toast(T.t(err));
                        } else {
                            pending = res;
                            preview = true;
                            mergeHow = SnippetData.MERGE_KEEP;
                            rebuild();
                        }
                    }
                });
            }
        }, "SnippetImport").start();
    }

    private void writeExport(final Uri uri, final String json) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                boolean ok = false;
                try {
                    OutputStream os = getContentResolver().openOutputStream(uri, "wt");
                    if (os != null) {
                        try {
                            os.write(json.getBytes("UTF-8"));
                            os.flush();
                            ok = true;
                        } finally {
                            os.close();
                        }
                    }
                } catch (Throwable ignored) {
                }
                final boolean done = ok;
                ui.post(new Runnable() {
                    @Override
                    public void run() {
                        toast(T.t(done ? "exported" : "export_fail"));
                    }
                });
            }
        }, "SnippetExport").start();
    }

    private void applyImport() {
        if (pending == null) {
            endPreview();
            return;
        }
        SnippetData next = data.copy();
        int[] r = next.merge(pending.data, mergeHow);
        try {
            EmmetSnippets.save(this, next);
        } catch (IOException e) {
            toast(T.t(e.getMessage()));
            return;
        }
        toast(T.f("imported", r[0], r[1], r[2]));
        endPreview();
    }

    private void endPreview() {
        preview = false;
        pending = null;
        rebuild();
    }

    @Override
    public void onBackPressed() {
        if (inputPanel.getVisibility() == View.VISIBLE) {
            hideInput();
        } else if (preview) {
            endPreview();
        } else {
            super.onBackPressed();
        }
    }

    // ------------------------------------------------------------------ menu

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        if (preview) {
            return true;
        }
        if (view == V_ROOT) {
            menu.add(0, 1, 0, T.t("add")).setIcon(android.R.drawable.ic_menu_add).setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
            menu.add(0, 2, 1, T.t("import")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            menu.add(0, 3, 2, T.t("export")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            menu.add(0, 4, 3, T.t("help")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        } else if (view == V_LANG) {
            menu.add(0, 1, 0, T.t("add")).setIcon(android.R.drawable.ic_menu_add).setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
            menu.add(0, 5, 1, T.t("new_group")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            menu.add(0, 4, 2, T.t("help")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        } else {
            menu.add(0, 1, 0, T.t("add")).setIcon(android.R.drawable.ic_menu_add).setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
            if (group.length() > 0) {
                menu.add(0, 6, 1, T.t("rename_group")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
                menu.add(0, 7, 2, T.t("delete_group")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            }
            menu.add(0, 4, 3, T.t("help")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        }
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
            case 1:
                openEditor(view == V_ROOT ? "html" : mode, null, view == V_GROUP ? group : "");
                return true;
            case 2:
                startImport();
                return true;
            case 3:
                startExport();
                return true;
            case 4:
                openHelp();
                return true;
            case 5:
                showInput("", new InputHandler() {
                    @Override
                    public String accept(String name) {
                        if (name.length() == 0) {
                            return "err_required";
                        }
                        String e = SnippetData.validateGroup(name);
                        if (e != null) {
                            return e;
                        }
                        if (data.hasGroup(mode, name)) {
                            return "err_group_exists";
                        }
                        data.addGroup(mode, name);
                        return saveData() ? null : "err_save";
                    }
                });
                return true;
            case 6:
                showInput(group, new InputHandler() {
                    @Override
                    public String accept(String name) {
                        if (name.length() == 0) {
                            return "err_required";
                        }
                        String e = SnippetData.validateGroup(name);
                        if (e != null) {
                            return e;
                        }
                        if (!name.equalsIgnoreCase(group) && data.hasGroup(mode, name)) {
                            return "err_group_exists";
                        }
                        data.renameGroup(mode, group, name);
                        group = name;
                        return saveData() ? null : "err_save";
                    }
                });
                return true;
            case 7:
                mutate("group_deleted", new Runnable() {
                    @Override
                    public void run() {
                        data.deleteGroup(mode, group, false);
                    }
                });
                group = "";
                rebuild();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_LONG).show();
    }

    // ------------------------------------------------------------------ adapter

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Object getItem(int i) {
            return rows.get(i);
        }

        @Override
        public long getItemId(int i) {
            return i;
        }

        @Override
        public boolean isEnabled(int i) {
            Row r = rows.get(i);
            return r.type != R_HEADER && r.type != R_NOTE || r.click != null;
        }

        @Override
        public View getView(int i, View convert, ViewGroup parent) {
            Row r = rows.get(i);
            Activity c = EmmetSnippetsActivity.this;
            int p = Ui.dp(c, 16);
            LinearLayout box = new LinearLayout(c);
            box.setOrientation(LinearLayout.VERTICAL);
            if (r.type == R_HEADER) {
                box.setPadding(p, p, p, Ui.dp(c, 4));
                box.addView(Ui.text(c, r.title, 13, true, Ui.secondary(c)));
            } else if (r.type == R_NOTE) {
                box.setPadding(p, Ui.dp(c, 8), p, Ui.dp(c, 8));
                box.addView(Ui.text(c, r.title, 15, false, Ui.primary(c)));
            } else if (r.type == R_SWITCH) {
                LinearLayout line = new LinearLayout(c);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setPadding(p, Ui.dp(c, 8), p, Ui.dp(c, 8));
                line.addView(Ui.text(c, r.title, 16, false, Ui.primary(c)), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                Switch sw = new Switch(c);
                sw.setChecked(r.checked);
                final Row row = r;
                sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(CompoundButton b, boolean checked) {
                        row.checked = checked;
                        if (row.onCheck != null) {
                            row.onCheck.onCheckedChanged(b, checked);
                        }
                    }
                });
                line.addView(sw);
                box.addView(line);
                final Switch fsw = sw;
                r.click = new Runnable() {
                    @Override
                    public void run() {
                        fsw.toggle();
                    }
                };
            } else if (r.type == R_RADIO) {
                box.setPadding(p, Ui.dp(c, 12), p, Ui.dp(c, 12));
                box.addView(Ui.text(c, (r.checked ? "◉  " : "○  ") + r.title, 16, r.checked, Ui.primary(c)));
            } else {
                box.setPadding(p, Ui.dp(c, 10), p, Ui.dp(c, 10));
                box.addView(Ui.text(c, r.title, 17, false, Ui.primary(c)));
                if (r.sub != null) {
                    box.addView(Ui.text(c, r.sub, 13, false, Ui.secondary(c)));
                }
            }
            AppUi.applyFont(box);
            return box;
        }
    }
}
