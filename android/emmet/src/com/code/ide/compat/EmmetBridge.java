package com.code.ide.compat;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Offline Emmet: no JavaScript interface, file access, navigation or network. */
public final class EmmetBridge {
    private static final Map<Activity, Request> ACTIVE = new HashMap<Activity, Request>();
    private static String page;
    private static boolean supported(String syntax) {
        String s = syntax == null ? "" : syntax.toLowerCase(Locale.ROOT);
        return ("|html|xhtml|xml|xsl|svg|php|shtml|rhtml|jsp|gsp|asp|vue|css|scss|sass|stylus|jsx|tsx|text|txt||").contains("|"+s+"|");
    }
    public static boolean canExpand(EditText editor, String syntax) {
        if (editor == null || !supported(syntax)) return false;
        int start = editor.getSelectionStart(), end = editor.getSelectionEnd();
        return start >= 0 && end >= 0 && (start != end || start > 0);
    }
    public static void cancel(Activity activity) {
        EmmetFields.cancel(activity);
        EditorAssist.dismiss(activity);
        Request request = ACTIVE.get(activity);
        if (request != null) request.close();
    }
    private static void message(Context context, String key) {
        int id = context.getResources().getIdentifier("emmet_" + key, "string", context.getPackageName());
        if (id != 0) Toast.makeText(context, id, Toast.LENGTH_SHORT).show();
    }
    public static void expand(Activity activity, EditText editor, String syntax, String indent) {
        if (!supported(syntax)) { message(activity, "syntax"); return; }
        if (!canExpand(editor, syntax)) { message(activity, "empty"); return; }
        if (editor.length() > 512 * 1024) { message(activity, "size"); return; }
        cancel(activity);
        Request r = new Request(activity, editor, syntax, indent);
        ACTIVE.put(activity, r);
        r.start();
    }
    static synchronized String page(Context context) throws Exception {
        if (page == null) {
            InputStream in = context.getAssets().open("emmet/emmet.js");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try { byte[] bytes = new byte[8192]; int n; while ((n=in.read(bytes))!=-1) out.write(bytes,0,n); }
            finally { in.close(); }
            // Bundled code only; document contents are passed later as quoted JSON data.
            String script = new String(out.toByteArray(), "UTF-8").replace("</script", "<\\/script");
            page = "<!doctype html><html><head><meta charset=\"utf-8\">"
                + "<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'none'; script-src 'unsafe-inline'; connect-src 'none'\">"
                + "</head><body><script>" + script + "</script></body></html>";
        }
        return page;
    }
    private static final class Request implements TextWatcher {
        final Activity activity;
        final EditText editor;
        final String original, syntax, indent;
        final int selectionStart, selectionEnd;
        final Handler handler = new Handler(Looper.getMainLooper());
        WebView engine;
        boolean closed, evaluated;
        final Runnable timeout = new Runnable() { public void run() { fail("timeout"); } };
        Request(Activity activity, EditText editor, String syntax, String indent) {
            this.activity=activity; this.editor=editor; this.syntax=syntax; this.indent=indent;
            original=editor.getText().toString();
            selectionStart=editor.getSelectionStart(); selectionEnd=editor.getSelectionEnd();
        }
        void start() {
            try {
                editor.addTextChangedListener(this);
                engine = new WebView(activity);
                WebSettings settings = engine.getSettings();
                settings.setJavaScriptEnabled(true);
                settings.setAllowFileAccess(false);
                settings.setAllowContentAccess(false);
                settings.setAllowFileAccessFromFileURLs(false);
                settings.setAllowUniversalAccessFromFileURLs(false);
                settings.setBlockNetworkLoads(true);
                settings.setBlockNetworkImage(true);
                settings.setDomStorageEnabled(false);
                engine.setWebViewClient(new WebViewClient() {
                    @Override public boolean shouldOverrideUrlLoading(WebView view, String url) { return true; }
                    @Override public void onPageFinished(WebView view, String url) { evaluate(); }
                    @Override public void onReceivedError(WebView view, int code, String description, String url) { fail("engine"); }
                });
                handler.postDelayed(timeout, 10000);
                engine.loadDataWithBaseURL("https://emmet.invalid/", page(activity), "text/html", "UTF-8", null);
            } catch (Exception e) { fail("engine"); }
        }
        void evaluate() {
            if (closed || evaluated) return;
            evaluated = true;
            try {
                JSONObject request = new JSONObject();
                request.put("text", original); request.put("start", selectionStart); request.put("end", selectionEnd);
                request.put("syntax", syntax == null ? "" : syntax); request.put("indent", indent == null ? "    " : indent);
                request.put("lang", Locale.getDefault().getLanguage());
                request.put("snippets", EmmetSnippets.get(activity));
                String json = request.toString().replace("\u2028", "\\u2028").replace("\u2029", "\\u2029");
                engine.evaluateJavascript("CodeIDEEmmet.expand(" + json + ")", new ValueCallback<String>() {
                    @Override public void onReceiveValue(String result) { apply(result); }
                });
            } catch (Exception e) { fail("engine"); }
        }
        void apply(String result) {
            if (closed) return;
            try {
                if (activity.isFinishing() || activity.isDestroyed()
                    || editor.getSelectionStart()!=selectionStart || editor.getSelectionEnd()!=selectionEnd
                    || !original.equals(editor.getText().toString())) { close(); return; }
                JSONObject value = new JSONObject(result);
                if (!value.optBoolean("ok")) {
                    String error=value.optString("error", "invalid");
                    if (!("syntax".equals(error)||"size".equals(error)||"empty".equals(error)||"context".equals(error))) error="invalid";
                    fail(error); return;
                }
                int start=value.getInt("start"), end=value.getInt("end");
                String replacement=value.getString("text");
                int from=value.getInt("selectionStart"), to=value.getInt("selectionEnd");
                if(start<0||end<start||end>original.length()||from<0||to<from||to>replacement.length()||replacement.length()>256*1024) {
                    fail("invalid"); return;
                }
                close(); // Detach watcher before making exactly one undoable replacement.
                editor.beginBatchEdit();
                try { editor.getText().replace(start,end,replacement); editor.setSelection(start+from,start+to); EmmetFields.start(activity,editor,start,value); }
                finally { editor.endBatchEdit(); }
            } catch (Exception e) { fail("invalid"); }
        }
        void fail(String key) { if (!closed) { message(activity,key); close(); } }
        void close() {
            if (closed) return;
            closed=true;
            handler.removeCallbacks(timeout);
            editor.removeTextChangedListener(this);
            if (ACTIVE.get(activity)==this) ACTIVE.remove(activity);
            final WebView view=engine; engine=null;
            // Destroy outside any WebView callback.
            if(view!=null) handler.post(new Runnable(){public void run(){ view.stopLoading(); view.destroy(); }});
        }
        public void beforeTextChanged(CharSequence s,int start,int count,int after) {}
        public void onTextChanged(CharSequence s,int start,int before,int count) { close(); }
        public void afterTextChanged(Editable text) {}
    }
}
