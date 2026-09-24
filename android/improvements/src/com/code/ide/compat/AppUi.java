package com.code.ide.compat;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.view.*;
import android.widget.TextView;
public final class AppUi {
 private static Typeface font;
 public static int id(Context c,String name,String type){return c.getResources().getIdentifier(name,type,c.getPackageName());}
 public static String text(Context c,String name){return c.getString(id(c,name,"string"));}
 private static void fonts(View v,Typeface f){
  if(v instanceof TextView){TextView t=(TextView)v; int style=t.getTypeface()==null?0:t.getTypeface().getStyle();t.setTypeface(Typeface.create(f,style));}
  if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)fonts(g.getChildAt(i),f);}
 }
 public static AlertDialog show(AlertDialog.Builder b){AlertDialog d=b.show();applyFont(d);return d;}
 public static void applyFont(View v){
  if(font==null)font=Typeface.createFromAsset(v.getContext().getAssets(),"fonts/quicksand.ttf");
  fonts(v,font);
 }
 public static void applyFont(AlertDialog d){
  if(font==null)font=Typeface.createFromAsset(d.getContext().getAssets(),"fonts/quicksand.ttf");
  fonts(d.getWindow().getDecorView(),font);
 }
 public static AlertDialog.Builder title(AlertDialog.Builder b,int title){return title(b,b.getContext().getText(title));}
 public static AlertDialog.Builder title(AlertDialog.Builder b,CharSequence title){
  View v=LayoutInflater.from(b.getContext()).inflate(id(b.getContext(),"warning_dialog_title","layout"),null);
  ((TextView)v.findViewById(android.R.id.title)).setText(title);
  b.setIcon(0); return b.setCustomTitle(v);
 }
}
