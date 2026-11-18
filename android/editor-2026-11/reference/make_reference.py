#!/usr/bin/env python3
"""Buduje środowisko referencyjne do testu różnicowego PieceTableEditable.

Pobiera z AOSP (tag android-14.0.0_r1) oryginalne SpannableStringBuilder, Selection i GrowingArrayUtils,
usuwa z nich ukryte API (adnotacje, GraphicsOperations), dodaje minimalne zaślepki zależności i kompiluje
do <katalog>/shim_out. Dzięki temu na JVM działa prawdziwy kod platformy, z którym porównujemy port.

Użycie: make_reference.py <katalog_roboczy>   (zmienna ANDROID_JAR = android.jar API >= 23)
"""
import os
import re
import subprocess
import sys
import urllib.request

TAG = "android-14.0.0_r1"
BASE = "https://raw.githubusercontent.com/aosp-mirror/platform_frameworks_base/%s/core/java/" % TAG
FILES = {
    "SpannableStringBuilder.java": "android/text/SpannableStringBuilder.java",
    "Selection.java": "android/text/Selection.java",
    "GrowingArrayUtils.java": "com/android/internal/util/GrowingArrayUtils.java",
}


def fetch(work):
    aosp = os.path.join(work, "aosp")
    os.makedirs(aosp, exist_ok=True)
    for name, path in FILES.items():
        dst = os.path.join(aosp, name)
        if not os.path.exists(dst):
            urllib.request.urlretrieve(BASE + path, dst)
    return aosp


def write(path, text):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def main():
    work = os.path.abspath(sys.argv[1])
    android_jar = os.environ["ANDROID_JAR"]
    aosp = fetch(work)
    shim = os.path.join(work, "shim")
    rd = lambda n: open(os.path.join(aosp, n), encoding="utf-8").read()

    sel = rd("Selection.java")
    sel = re.sub(r"^import android\.(annotation|compat\.annotation)\.[A-Za-z]+;\n", "", sel, flags=re.M)
    sel = re.sub(r"^\s*@(TestApi|UnsupportedAppUsage)(\([^)]*\))?\s*\n", "", sel, flags=re.M)
    sel = sel.replace("@NonNull ", "")
    sel = re.sub(r"text\.removeSpan\((SELECTION_\w+), Spanned\.SPAN_INTERMEDIATE\)", r"text.removeSpan(\1)", sel)
    write(shim + "/android/text/Selection.java", sel)

    g = rd("GrowingArrayUtils.java")
    g = g.replace("import android.compat.annotation.UnsupportedAppUsage;\nimport android.os.Build;\n", "")
    g = re.sub(r"^\s*@UnsupportedAppUsage(\([^)]*\))?\s*\n", "", g, flags=re.M)
    write(shim + "/com/android/internal/util/GrowingArrayUtils.java", g)

    write(shim + "/com/android/internal/util/ArrayUtils.java", """package com.android.internal.util;
public class ArrayUtils {
  @SuppressWarnings("unchecked") public static <T> T[] emptyArray(Class<T> k){return (T[]) java.lang.reflect.Array.newInstance(k,0);}
  @SuppressWarnings("unchecked") public static <T> T[] newUnpaddedArray(Class<T> k,int n){return (T[]) java.lang.reflect.Array.newInstance(k,n);}
  public static char[] newUnpaddedCharArray(int n){return new char[n];}
  public static int[] newUnpaddedIntArray(int n){return new int[n];}
  public static long[] newUnpaddedLongArray(int n){return new long[n];}
  public static boolean[] newUnpaddedBooleanArray(int n){return new boolean[n];}
  public static float[] newUnpaddedFloatArray(int n){return new float[n];}
}
""")
    write(shim + "/libcore/util/EmptyArray.java",
          "package libcore.util;\npublic class EmptyArray { public static final Object[] OBJECT=new Object[0]; public static final int[] INT=new int[0]; }\n")
    write(shim + "/android/util/Log.java",
          "package android.util;\npublic class Log { public static int e(String t,String m){return 0;} public static int w(String t,String m){return 0;} public static int d(String t,String m){return 0;} }\n")
    write(shim + "/android/text/TextUtils.java", """package android.text;
public class TextUtils {
  public static void getChars(CharSequence s,int start,int end,char[] dest,int off){
    if (s instanceof GetChars) ((GetChars)s).getChars(start,end,dest,off);
    else for(int i=start;i<end;i++) dest[off++]=s.charAt(i);
  }
  public static String substring(CharSequence s,int start,int end){
    if (s instanceof String) return ((String)s).substring(start,end);
    char[] c=new char[end-start]; getChars(s,start,end,c,0); return new String(c);
  }
  public static int indexOf(CharSequence s,char ch,int start){ for(int i=Math.max(0,start);i<s.length();i++) if(s.charAt(i)==ch) return i; return -1; }
  public static int lastIndexOf(CharSequence s,char ch,int last){ for(int i=Math.min(last,s.length()-1);i>=0;i--) if(s.charAt(i)==ch) return i; return -1; }
}
""")

    ssb = rd("SpannableStringBuilder.java")
    a = ssb.index("import android.annotation.Nullable;")
    b = ssb.index("import java.util.IdentityHashMap;") + len("import java.util.IdentityHashMap;")
    ssb = (ssb[:a] + "import android.util.Log;\nimport com.android.internal.util.ArrayUtils;\nimport com.android.internal.util.GrowingArrayUtils;\n"
           "import libcore.util.EmptyArray;\nimport java.lang.reflect.Array;\nimport java.util.IdentityHashMap;" + ssb[b:])
    ssb = re.sub(r"^\s*@(UnsupportedAppUsage|GuardedBy)(\([^)]*\))?\s*\n", "", ssb, flags=re.M)
    ssb = ssb.replace("@Nullable ", "").replace("Appendable, GraphicsOperations {", "Appendable {")
    k = ssb.index("Don't call this yourself -- exists for Canvas to use internally.")
    a = ssb.rindex("    /**", 0, k)
    b = ssb.index("    // Documentation from interface\n    public void setFilters")
    write(shim + "/android/text/SpannableStringBuilder.java", ssb[:a] + ssb[b:])

    out = os.path.join(work, "shim_out")
    os.makedirs(out, exist_ok=True)
    srcs = [os.path.join(r, f) for r, _, fs in os.walk(shim) for f in fs if f.endswith(".java")]
    subprocess.check_call(["javac", "-nowarn", "-proc:none", "-cp", android_jar, "-d", out] + srcs)
    print("Środowisko referencyjne: " + out)


if __name__ == "__main__":
    main()
