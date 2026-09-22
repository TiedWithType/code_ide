package com.code.ide.compat;
import android.app.Activity;
import android.text.*;
import android.view.*;
import android.widget.EditText;
import org.json.*;
import java.util.*;
/** Ranges use UTF-16 offsets, matching Android Editable and JS. */
public final class EmmetFields implements TextWatcher {
 private static final Map<Activity,EmmetFields> active=new HashMap<Activity,EmmetFields>();
 private static final Set<View> swallowUp=Collections.newSetFromMap(new WeakHashMap<View,Boolean>());
 private final Activity activity; private final EditText editor;
 private final FieldRanges ranges=new FieldRanges();
 private boolean ended;
 private EmmetFields(Activity a,EditText e){activity=a;editor=e;}
 public static void start(Activity a,EditText e,int base,JSONObject result) throws JSONException {
  cancel(a); JSONArray list=result.optJSONArray("fields"); if(list==null||list.length()==0)return;
  EmmetFields session=new EmmetFields(a,e);
  for(int i=0;i<list.length();i++) {JSONObject f=list.getJSONObject(i); int s=base+f.getInt("start"),t=base+f.getInt("end");if(s<0||t<s||t>e.length())return;session.ranges.add(s,t);}
  active.put(a,session);e.addTextChangedListener(session);session.select();
 }
 public static void cancel(Activity a){EmmetFields f=active.get(a);if(f!=null)f.end();}
 private void end(){if(ended)return;ended=true;editor.removeTextChangedListener(this);if(active.get(activity)==this)active.remove(activity);}
 private void select(){editor.setSelection(ranges.start(),ranges.end());}
 private static EmmetFields find(View v){for(EmmetFields f:active.values())if(f.editor==v)return f;return null;}
 public static boolean key(View v,int code,KeyEvent event){
  if(code==KeyEvent.KEYCODE_TAB&&event.getAction()==KeyEvent.ACTION_UP&&swallowUp.remove(v))return true;
  EmmetFields f=find(v);if(f==null)return false;
  if(code==KeyEvent.KEYCODE_ESCAPE){f.end();return false;}
  if(code!=KeyEvent.KEYCODE_TAB||event.getAction()!=KeyEvent.ACTION_DOWN||event.isCtrlPressed()||event.isAltPressed())return false;
  if(!f.next(event.isShiftPressed()))return false;swallowUp.add(v);return true;
 }
 public static boolean text(EditText e,CharSequence text){EmmetFields f=find(e);return f!=null&&"\t".contentEquals(text)&&f.next(false);}
 private boolean next(boolean backward){
  int low=Math.min(editor.getSelectionStart(),editor.getSelectionEnd()),high=Math.max(editor.getSelectionStart(),editor.getSelectionEnd());
  if(!ranges.contains(low,high)){end();return false;}
  if(ranges.move(backward))select();else{editor.setSelection(ranges.end());end();}
  return true;
 }
 public void beforeTextChanged(CharSequence s,int start,int count,int after){if(!ranges.contains(start,start+count))end();}
 public void onTextChanged(CharSequence s,int start,int before,int count){if(!ended&&!ranges.edit(start,before,count))end();}
 public void afterTextChanged(Editable s){}
}
