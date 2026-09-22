package com.code.ide.compat;
import android.app.*;
import android.content.*;
import android.graphics.Typeface;
import android.view.*;
import android.widget.*;
import org.json.*;
import java.util.Iterator;
public final class EmmetSnippets {
 public static final int MENU_ID=0x7e000101;
 private static final String EXAMPLE="{\n  \"html\": {\n    \"card\": \"article.card>h2{${1:Tytuł}}+p{${2:Treść}}\"\n  },\n  \"css\": {\n    \"brand\": \"color: #6750a4;\"\n  }\n}";
 public static void menu(Activity a,Menu m){m.add(0,MENU_ID,100,AppUi.text(a,"emmet_snippets_title")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);}
 public static JSONObject get(Context c){try{return new JSONObject(c.getSharedPreferences("emmet",0).getString("snippets","{}"));}catch(JSONException e){return new JSONObject();}}
 public static boolean handle(final Activity a,MenuItem item){if(item.getItemId()!=MENU_ID)return false;edit(a);return true;}
 public static void edit(final Activity a){
  final EditText input=new EditText(a);input.setGravity(Gravity.TOP|Gravity.START);input.setMinLines(8);input.setMaxLines(16);input.setTextSize(14);input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
  input.setText(a.getSharedPreferences("emmet",0).getString("snippets",EXAMPLE));
  int pad=(int)(20*a.getResources().getDisplayMetrics().density);LinearLayout box=new LinearLayout(a);box.setPadding(pad,0,pad,0);box.addView(input,new LinearLayout.LayoutParams(-1,-2));
  AlertDialog.Builder b=new AlertDialog.Builder(a).setTitle(AppUi.text(a,"emmet_snippets_title")).setMessage(AppUi.text(a,"emmet_snippets_help")).setView(box).setNegativeButton(android.R.string.cancel,null).setPositiveButton(AppUi.text(a,"emmet_snippets_save"),null);
  final AlertDialog d=AppUi.show(b);input.setTypeface(Typeface.MONOSPACE);
  d.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener(){public void onClick(View v){
   try{String raw=input.getText().toString();validate(raw);if(!a.getSharedPreferences("emmet",0).edit().putString("snippets",raw).commit())throw new Exception();d.dismiss();}
   catch(Exception e){input.setError(AppUi.text(a,"emmet_snippets_invalid"));}
  }});
 }
 static void validate(String raw) throws JSONException {
  if(raw.length()>32768)throw new JSONException("size");JSONObject root=new JSONObject(raw);Iterator<String> modes=root.keys();int count=0;
  while(modes.hasNext()){String mode=modes.next();if(!"|html|xhtml|xml|jsx|css|scss|sass|stylus|".contains("|"+mode+"|"))throw new JSONException("mode");JSONObject map=root.getJSONObject(mode);Iterator<String> keys=map.keys();while(keys.hasNext()){String key=keys.next();Object value=map.get(key);if(++count>200||key.length()==0||key.length()>64||!(value instanceof String)||((String)value).length()>4096)throw new JSONException("snippet");}}
 }
}
