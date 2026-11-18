package com.code.ide.compat;

import android.text.Editable;

/**
 * Fabryka bufora dla EditText (TextView#setEditableFactory). Od THRESHOLD znaków tekst trafia do
 * {@link PieceTableEditable} (piece table, ta sama semantyka rozpiętości co SpannableStringBuilder);
 * mniejsze teksty zostają na standardowym SpannableStringBuilder.
 */
public final class PieceTableFactory extends Editable.Factory {
    public static final int THRESHOLD = 262144;

    public static final Editable.Factory INSTANCE = new PieceTableFactory();

    private PieceTableFactory() {
    }

    @Override
    public Editable newEditable(CharSequence source) {
        if (source != null && source.length() >= THRESHOLD) {
            try {
                return new PieceTableEditable(source);
            } catch (OutOfMemoryError e) {
                throw e;
            }
        }
        return super.newEditable(source);
    }

    /** Wywoływane z ObservableEditText: włącza bufor piece table dla dużych tekstów. */
    public static void install(android.widget.TextView view) {
        prepareStateDir(view.getContext());
        view.setEditableFactory(INSTANCE);
    }

    /** Katalog plików stanu dla dużych dokumentów (patrz PieceTable#writeObject) + sprzątanie starych plików. */
    private static void prepareStateDir(android.content.Context ctx) {
        if (PieceTable.spillDir != null) {
            return;
        }
        try {
            java.io.File dir = new java.io.File(ctx.getApplicationContext().getFilesDir(), "state");
            PieceTable.spillDir = dir;
            java.io.File[] old = dir.listFiles();
            if (old != null) {
                long limit = System.currentTimeMillis() - 7L * 24 * 3600 * 1000;
                for (java.io.File f : old) {
                    if (f.getName().startsWith("spill_") && f.lastModified() < limit) {
                        f.delete();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
