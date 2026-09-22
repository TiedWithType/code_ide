package com.code.ide.compat;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;
public final class StateIo {
 private static boolean warned;
 public static Object read(Context c,String name){return AtomicStore.read(c.getFileStreamPath(name));}
 public static void write(Context c,Object value,String name){
  try{AtomicStore.write(c.getFileStreamPath(name),value);warned=false;}
  catch(Exception e){Log.e("CodeIDE","Session checkpoint failed",e);if(!warned){warned=true;Toast.makeText(c,AppUi.text(c,"recovery_write_failed"),Toast.LENGTH_LONG).show();}}
 }
}
