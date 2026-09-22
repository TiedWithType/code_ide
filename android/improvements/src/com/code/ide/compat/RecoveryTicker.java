package com.code.ide.compat;
import android.app.Activity;
import android.os.*;
import android.text.*;
import android.widget.EditText;
import java.util.*;
/** Main-thread snapshot avoids racing the editor's serializable model. */
public final class RecoveryTicker implements TextWatcher,Runnable {
 private static final Map<Activity,RecoveryTicker> active=new HashMap<Activity,RecoveryTicker>();
 private final Activity activity;private final EditText editor;private final Runnable save;
 private final Handler handler=new Handler(Looper.getMainLooper());private boolean dirty=true;
 private RecoveryTicker(Activity a,EditText e,Runnable r){activity=a;editor=e;save=r;}
 public static void start(Activity a,EditText e,Runnable r){stop(a);if(e==null)return;RecoveryTicker t=new RecoveryTicker(a,e,r);active.put(a,t);e.addTextChangedListener(t);t.handler.postDelayed(t,15000);}
 public static void stop(Activity a){RecoveryTicker t=active.remove(a);if(t!=null){t.handler.removeCallbacks(t);t.editor.removeTextChangedListener(t);}}
 public void run(){if(active.get(activity)!=this||activity.isFinishing())return;if(dirty){dirty=false;save.run();}handler.postDelayed(this,15000);}
 public void onTextChanged(CharSequence s,int start,int before,int count){dirty=true;}
 public void beforeTextChanged(CharSequence s,int start,int count,int after){}
 public void afterTextChanged(Editable e){}
}
