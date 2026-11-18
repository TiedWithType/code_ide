package com.code.ide.compat;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

/** Drobne pomocnicze funkcje do budowania widoków w kodzie (bez plików layoutu). */
final class Ui {
    private Ui() {
    }

    static int dp(Context c, float v) {
        return (int) (v * c.getResources().getDisplayMetrics().density + 0.5f);
    }

    static int color(Context c, int attr, int fallback) {
        TypedArray ta = c.obtainStyledAttributes(new int[]{attr});
        try {
            ColorStateList cs = ta.getColorStateList(0);
            return cs != null ? cs.getDefaultColor() : fallback;
        } finally {
            ta.recycle();
        }
    }

    static int primary(Context c) {
        return color(c, android.R.attr.textColorPrimary, 0xFF202020);
    }

    static int secondary(Context c) {
        return color(c, android.R.attr.textColorSecondary, 0xFF707070);
    }

    static TextView text(Context c, CharSequence s, float sp, boolean bold, int color) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        if (bold) {
            t.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return t;
    }

    static Button button(Context c, CharSequence label, View.OnClickListener l) {
        Button b = new Button(c);
        b.setText(label);
        b.setAllCaps(false);
        b.setOnClickListener(l);
        return b;
    }
}
