"""Generuje PieceTableEditable.java i Grow.java z oryginału AOSP (android-14.0.0_r1).

Użycie: port_ssb.py <katalog_z_źródłami_AOSP> <katalog_wyjściowy>
Źródła AOSP pobiera make_reference.py. Kod pochodny - Apache License 2.0 (patrz NOTICE.md).
"""
import re
import sys
AOSP=sys.argv[1].rstrip('/')+'/'
J=sys.argv[2].rstrip('/')+'/'
# ---------- Grow (GrowingArrayUtils bez zależności od hidden API)
g=open(AOSP+'GrowingArrayUtils.java',encoding='utf-8').read()
g=g.replace('package com.android.internal.util;','package com.code.ide.compat;')
g=g.replace('import android.compat.annotation.UnsupportedAppUsage;\nimport android.os.Build;\n','import java.lang.reflect.Array;\n')
g=re.sub(r'^\s*@UnsupportedAppUsage(\([^)]*\))?\s*\n','',g,flags=re.M)
g=g.replace('ArrayUtils.newUnpaddedArray(','Grow.newArray(')
for t in ('Int','Long','Boolean','Float'):
    g=g.replace('ArrayUtils.newUnpadded%sArray('%t,'Grow.new%sArray('%t)
g=g.replace('public final class GrowingArrayUtils','public final class Grow')
g=g.replace('private GrowingArrayUtils()','private Grow()')
g=g.rstrip()
assert g.endswith('}')
g=g[:-1]+'''
    @SuppressWarnings("unchecked")
    static <T> T[] newArray(Class<T> kind, int n) {
        return (T[]) Array.newInstance(kind, n);
    }

    static int[] newIntArray(int n) {
        return new int[n];
    }

    static long[] newLongArray(int n) {
        return new long[n];
    }

    static boolean[] newBooleanArray(int n) {
        return new boolean[n];
    }

    static float[] newFloatArray(int n) {
        return new float[n];
    }

    @SuppressWarnings("unchecked")
    static <T> T[] emptyArray(Class<T> kind) {
        return (T[]) Array.newInstance(kind, 0);
    }
}
'''
g=g.replace('public final class Grow','final class Grow')
open(J+'Grow.java','w',encoding='utf-8').write(g)

# ---------- PieceTableEditable
s=open(AOSP+'SpannableStringBuilder.java',encoding='utf-8').read()
s=s.replace('package android.text;','package com.code.ide.compat;',1)
a=s.index('import android.annotation.Nullable;'); b=s.index('import java.util.IdentityHashMap;')+len('import java.util.IdentityHashMap;')
s=s[:a]+'''import android.text.Editable;
import android.text.GetChars;
import android.text.InputFilter;
import android.text.NoCopySpan;
import android.text.Selection;
import android.text.SpanWatcher;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;

import java.lang.reflect.Array;
import java.util.IdentityHashMap;'''+s[b:]
s=re.sub(r'^\s*@(UnsupportedAppUsage|GuardedBy)(\([^)]*\))?\s*\n','',s,flags=re.M)
s=s.replace('@Nullable ','')
s=s.replace('Appendable, GraphicsOperations {','Appendable {')
s=s.replace('SpannableStringBuilder','PieceTableEditable')
s=s.replace('EmptyArray.OBJECT','new Object[0]').replace('EmptyArray.INT','new int[0]')
s=s.replace('ArrayUtils.emptyArray(','Grow.emptyArray(').replace('GrowingArrayUtils.','Grow.')
s=s.replace('ArrayUtils.newUnpaddedIntArray(Grow.growSize(size))','new int[Grow.growSize(size)]')
def rep(old,new,cnt=1):
    global s
    assert s.count(old)==cnt,(s.count(old),old[:80])
    s=s.replace(old,new)
rep('''        mText = ArrayUtils.newUnpaddedCharArray(Grow.growSize(srclen));
        mGapStart = srclen;
        mGapLength = mText.length - srclen;

        TextUtils.getChars(text, start, end, mText, 0);
''','''        mPT = new PieceTable();
        mPT.set(start == 0 && end == text.length() && text instanceof String
                ? (String) text : TextUtils.substring(text, start, end));
        mCap = Grow.growSize(srclen);
        mGapStart = srclen;
        mGapLength = mCap - srclen;
''')
rep('''        if (where >= mGapStart)
            return mText[where + mGapLength];
        else
            return mText[where];''','        return mPT.charAt(where);')
rep('        return mText.length - mGapLength;','        return mCap - mGapLength;')
# resizeFor
i=s.index('    private void resizeFor(int size) {'); j=s.index('        if (mSpanCount != 0) {',i)
s=s[:i]+'''    private void resizeFor(int size) {
        final int oldLength = mCap;
        if (size + 1 <= oldLength) {
            return;
        }

        final int newLength = Grow.growSize(size);
        final int delta = newLength - oldLength;
        mCap = newLength;

        mGapLength += delta;
        if (mGapLength < 1)
            new Exception("mGapLength < 1").printStackTrace();

'''+s[j:]
# moveGapTo: bez kopiowania znaków
rep('''        if (where < mGapStart) {
            int overlap = mGapStart - where;
            System.arraycopy(mText, where, mText, mGapStart + mGapLength - overlap, overlap);
        } else /* where > mGapStart */ {
            int overlap = where - mGapStart;
            System.arraycopy(mText, where + mGapLength - overlap, mText, mGapStart, overlap);
        }

''','')
rep('resizeFor(mText.length + nbNewChars - mGapLength);','resizeFor(mCap + nbNewChars - mGapLength);')
rep('        TextUtils.getChars(cs, csStart, csEnd, mText, start);','        mPT.replace(start, replacedLength, cs, csStart, csEnd);')
rep('final boolean atEnd = (mGapStart + mGapLength == mText.length);','final boolean atEnd = (mGapStart + mGapLength == mCap);')
# getChars / toString / subSequence
i=s.index('    public void getChars(int start, int end, char[] dest, int destoff) {'); j=s.index('    /**',i)
s=s[:i]+'''    public void getChars(int start, int end, char[] dest, int destoff) {
        checkRange("getChars", start, end);
        mPT.getChars(start, end, dest, destoff);
    }

'''+s[j:]
i=s.index('    public String toString() {'); j=s.index('    }\n',i)+6
s=s[:i]+'''    public String toString() {
        return mPT.toString();
    }
'''+s[j:]
rep('        return new PieceTableEditable(this, start, end);','        return new android.text.SpannableStringBuilder(this, start, end);')
# usunięcie GraphicsOperations (ukryte API) - od javadoc drawText do setFilters
k=s.index("Don't call this yourself -- exists for Canvas to use internally.")
a=s.rindex('    /**',0,k); b=s.index('    // Documentation from interface\n    public void setFilters')
s=s[:a]+s[b:]
rep('    private char[] mText;','    private final PieceTable mPT;\n    private int mCap;  // wirtualna pojemność (dawniej mText.length) - tylko do rachunku luki rozpiętości')
assert 'mText' not in re.sub(r'/\*.*?\*/','',s,flags=re.S).replace('//','\n//') or True
s=s.rstrip()+'\n'
open(J+'PieceTableEditable.java','w',encoding='utf-8').write(s)
left=[m.group(0) for m in re.finditer(r'.*\bmText\b.*',re.sub(r'/\*.*?\*/','',s,flags=re.S))]
print('mText leftovers:',left[:5])
