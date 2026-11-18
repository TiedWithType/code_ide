package com.code.ide.compat;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Formularz jednego snippetu (dodawanie / edycja): język, grupa, skrót, treść.
 * Extras: mode, shortcut (null = nowy), group (domyślna grupa). Bez AlertDialog.
 */
public class EmmetSnippetEditActivity extends Activity {
    private SnippetData data;
    private String origMode;
    private String origKey;
    private Spinner spinner;
    private AutoCompleteTextView groupEdit;
    private EditText keyEdit;
    private EditText bodyEdit;
    private Button deleteButton;
    private ArrayAdapter<String> groupAdapter;
    private String initialSignature;
    private boolean warnedDiscard;
    private boolean armedDelete;
    private Button fieldButton;
    private Button endButton;
    private TextView helpText;
    private TextView warnText;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        data = EmmetSnippets.load(this);
        String m = getIntent().getStringExtra("mode");
        origMode = SnippetData.isMode(m) ? m : "html";
        origKey = getIntent().getStringExtra("shortcut");
        String presetGroup = getIntent().getStringExtra("group");
        boolean editing = origKey != null && data.get(origMode, origKey) != null;
        if (!editing) {
            origKey = null;
        }
        setTitle(T.t(editing ? "edit" : "add"));
        if (getActionBar() != null) {
            getActionBar().setDisplayHomeAsUpEnabled(true);
        }

        int p = Ui.dp(this, 16);
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(p, p, p, p);

        box.addView(Ui.text(this, T.t("language"), 13, true, Ui.secondary(this)));
        spinner = new Spinner(this);
        ArrayAdapter<String> modes = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, new ArrayList<String>(Arrays.asList(SnippetData.MODES)));
        modes.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(modes);
        spinner.setSelection(Arrays.asList(SnippetData.MODES).indexOf(origMode));
        box.addView(spinner);

        groupEdit = new AutoCompleteTextView(this);
        groupEdit.setSingleLine();
        groupEdit.setHint(T.t("group"));
        groupEdit.setThreshold(0);
        groupAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_dropdown_item_1line, new ArrayList<String>());
        groupEdit.setAdapter(groupAdapter);
        groupEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                groupEdit.showDropDown();
            }
        });
        String startGroup = editing ? data.get(origMode, origKey).group : (presetGroup == null ? "" : presetGroup);
        groupEdit.setText(startGroup);
        box.addView(groupEdit);
        refreshGroups();
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View v, int position, long id) {
                refreshGroups();
                refreshHints();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });

        keyEdit = new EditText(this);
        keyEdit.setSingleLine();
        keyEdit.setHint(T.t("shortcut"));
        keyEdit.setText(origKey == null ? "" : origKey);
        keyEdit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        box.addView(keyEdit);

        bodyEdit = new EditText(this);
        bodyEdit.setHint(T.t("body"));
        bodyEdit.setMinLines(5);
        bodyEdit.setGravity(android.view.Gravity.TOP);
        bodyEdit.setTypeface(Typeface.MONOSPACE);
        bodyEdit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        bodyEdit.setText(editing ? data.get(origMode, origKey).body : "");
        box.addView(bodyEdit);

        warnText = Ui.text(this, T.t("warn_fields"), 13, false, 0xFFC25E00);
        warnText.setVisibility(View.GONE);
        box.addView(warnText);

        LinearLayout chips = new LinearLayout(this);
        chips.setOrientation(LinearLayout.HORIZONTAL);
        fieldButton = insertButton();
        endButton = insertButton();
        chips.addView(fieldButton, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        chips.addView(endButton, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        box.addView(chips);
        helpText = Ui.text(this, "", 13, false, Ui.secondary(this));
        box.addView(helpText);

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(0, p, 0, 0);
        actions.addView(Ui.button(this, T.t("save"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                save();
            }
        }), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (editing) {
            deleteButton = Ui.button(this, T.t("delete"), new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    delete();
                }
            });
            actions.addView(deleteButton, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }
        actions.addView(Ui.button(this, T.t("cancel"), new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        }), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        box.addView(actions);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(box);
        setContentView(scroll);
        AppUi.applyFont(scroll);
        initialSignature = signature();
        refreshHints();
        TextWatcher reset = new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {
            }

            @Override
            public void onTextChanged(CharSequence s, int a, int b, int c) {
                warnedDiscard = false;
                refreshHints();
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        };
        keyEdit.addTextChangedListener(reset);
        bodyEdit.addTextChangedListener(reset);
    }

    /** Przycisk wstawia swój aktualny napis (zależny od języka) w miejscu kursora. */
    private Button insertButton() {
        final Button[] self = new Button[1];
        self[0] = Ui.button(this, "", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String snippet = self[0].getText().toString();
                int a = Math.max(0, bodyEdit.getSelectionStart());
                int b = Math.max(0, bodyEdit.getSelectionEnd());
                bodyEdit.getText().replace(Math.min(a, b), Math.max(a, b), snippet);
            }
        });
        self[0].setTypeface(Typeface.MONOSPACE);
        return self[0];
    }

    /** Dopasowuje przyciski, podpowiedź i ostrzeżenie do wybranego języka i treści. */
    private void refreshHints() {
        if (fieldButton == null || bodyEdit == null) {
            return;
        }
        String mode = selectedMode();
        boolean markup = SnippetData.isMarkup(mode);
        String name = T.pl() ? "pole" : "field";
        fieldButton.setText(markup ? "{${1:" + name + "}}" : "${1:" + name + "}");
        endButton.setText(markup ? "{${0}}" : "${0}");
        helpText.setText(T.t(markup ? "field_help_markup" : "field_help_style"));
        warnText.setVisibility(SnippetData.hasFieldOutsideBraces(mode, bodyEdit.getText().toString()) ? View.VISIBLE : View.GONE);
    }

    private String selectedMode() {
        return (String) spinner.getSelectedItem();
    }

    private void refreshGroups() {
        groupAdapter.clear();
        List<String> names = data.groupNames(selectedMode());
        for (String n : names) {
            groupAdapter.add(n);
        }
        groupAdapter.notifyDataSetChanged();
    }

    private String signature() {
        return selectedMode() + "\u0000" + SnippetData.cleanGroup(groupEdit.getText().toString()) + "\u0000"
                + keyEdit.getText().toString().trim() + "\u0000" + bodyEdit.getText().toString();
    }

    private void save() {
        String mode = selectedMode();
        String key = keyEdit.getText().toString().trim();
        String body = bodyEdit.getText().toString().replace("\r\n", "\n").replace('\r', '\n');
        String group = SnippetData.cleanGroup(groupEdit.getText().toString());

        String err = SnippetData.validateShortcut(key);
        if (err != null) {
            keyEdit.setError(T.t(err));
            keyEdit.requestFocus();
            return;
        }
        err = SnippetData.validateBody(body);
        if (err != null) {
            bodyEdit.setError(T.t(err));
            bodyEdit.requestFocus();
            return;
        }
        err = SnippetData.validateGroup(group);
        if (err != null) {
            groupEdit.setError(T.t(err));
            groupEdit.requestFocus();
            return;
        }
        boolean sameSlot = origKey != null && mode.equals(origMode) && key.equals(origKey);
        if (data.get(mode, key) != null && !sameSlot) {
            keyEdit.setError(T.t("err_dup"));
            keyEdit.requestFocus();
            return;
        }
        SnippetData next = data.copy();
        if (origKey != null) {
            next.remove(origMode, origKey);
        }
        next.put(mode, key, body, group);
        if (group.length() > 0) {
            next.addGroup(mode, group);
        }
        try {
            EmmetSnippets.save(this, next);
        } catch (IOException e) {
            bodyEdit.setError(T.t(e.getMessage()));
            return;
        }
        Toast.makeText(this, T.t("saved"), Toast.LENGTH_SHORT).show();
        finish();
    }

    /** Dwa dotknięcia zamiast okna potwierdzenia. */
    private void delete() {
        if (!armedDelete) {
            armedDelete = true;
            deleteButton.setText(T.t("delete_again"));
            return;
        }
        SnippetData next = data.copy();
        next.remove(origMode, origKey);
        try {
            EmmetSnippets.save(this, next);
        } catch (IOException e) {
            Toast.makeText(this, T.t(e.getMessage()), Toast.LENGTH_LONG).show();
            return;
        }
        Toast.makeText(this, T.t("deleted"), Toast.LENGTH_SHORT).show();
        finish();
    }

    @Override
    public void onBackPressed() {
        if (!signature().equals(initialSignature) && !warnedDiscard) {
            warnedDiscard = true;
            Toast.makeText(this, T.t("discard_hint"), Toast.LENGTH_SHORT).show();
            return;
        }
        super.onBackPressed();
    }

    @Override
    public boolean onCreateOptionsMenu(android.view.Menu menu) {
        menu.add(0, 4, 0, T.t("help")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 4) {
            EmmetSnippets.openHelp(this);
            return true;
        }
        if (item.getItemId() == android.R.id.home) {
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
