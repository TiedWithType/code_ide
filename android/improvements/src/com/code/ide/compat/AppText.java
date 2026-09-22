package com.code.ide.compat;
import android.content.Context;
import java.text.DateFormat;
import java.util.Date;
public final class AppText {
 private static Context context;
 public static void init(Context c){context=c.getApplicationContext();}
 public static String untitled(){return context==null?"untitled":AppUi.text(context,"file_untitled");}
 public static String timeAgo(long time){
  long d=System.currentTimeMillis()-time;
  if(context==null||time<=0||d<0||d>=3*86400000L)return DateFormat.getDateInstance(DateFormat.MEDIUM).format(new Date(time));
  if(d<60000)return AppUi.text(context,"time_just_now");
  if(d<3600000)return quantity("time_minutes",(int)(d/60000));
  if(d<86400000)return quantity("time_hours",(int)(d/3600000));
  if(d<172800000)return AppUi.text(context,"time_yesterday");
  return quantity("time_days",(int)(d/86400000));
 }
 private static String quantity(String key,int n){return context.getResources().getQuantityString(AppUi.id(context,key,"plurals"),n,n);}
}
