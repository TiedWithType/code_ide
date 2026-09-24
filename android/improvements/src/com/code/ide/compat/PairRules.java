package com.code.ide.compat;
import java.util.*;
/** Pure transformations for actual single-character user input only. */
public final class PairRules {
 public static final class Edit {
  public final int start,end,from,to;public final String text;
  Edit(int s,int e,String t,int a,int b){start=s;end=e;text=t;from=a;to=b;}
 }
 public static Edit type(String s,int a,int b,char c,String syntax){
  if(a<0||b<a||b>s.length())return null;
  String mode=syntax==null?"":syntax.toLowerCase(Locale.ROOT);
  if(!("|html|xhtml|xml|svg|vue|jsx|tsx|javascript|js|typescript|ts|css|scss|sass|json|jsonc|java|kotlin|python|php|text|txt||").contains("|"+mode+"|"))return null;
  String opens="([{\"'`", closes=")]}\"'`";int i=opens.indexOf(c);
  if(a<b && i>=0)return new Edit(a,b,c+s.substring(a,b)+closes.charAt(i),1,b-a+1);
  if(a!=b)return null;
  if(closes.indexOf(c)>=0 && a<s.length() && s.charAt(a)==c)return new Edit(a,a,"",1,1);
  // Apostrophes in words, escaped quotes and string contents are left alone.
  if(i>=0){
   if(c=='\'' && a>0 && Character.isLetterOrDigit(s.charAt(a-1)))return null;
   if(a>0 && s.charAt(a-1)=='\\')return null;
   if(inStringOrComment(s,a))return null;
   if(a<s.length() && !Character.isWhitespace(s.charAt(a)) && ")]},;:>".indexOf(s.charAt(a))<0)return null;
   return new Edit(a,b,""+c+closes.charAt(i),1,1);
  }
  if(c=='>' && ("|html|xhtml|xml|svg|vue|").contains("|"+mode+"|")){
   int open=s.lastIndexOf('<',a-1);if(open<0||a-open>2048)return null;
   String before=s.substring(0,open).toLowerCase(Locale.ROOT);
   if(before.lastIndexOf("<script")>before.lastIndexOf("</script>")||before.lastIndexOf("<style")>before.lastIndexOf("</style>"))return null;
   String tag=s.substring(open,a);if(!tag.matches("<[A-Za-z][A-Za-z0-9:_-]*(?:\\s+[\\s\\S]*)?"))return null;
   if(tag.endsWith("/")||tag.indexOf('>')>=0)return null;
   char quote=0;for(int k=1;k<tag.length();k++){char q=tag.charAt(k);if(quote!=0){if(q==quote)quote=0;}else if(q=='\''||q=='\"')quote=q;}if(quote!=0)return null;
   int comment=s.lastIndexOf("<!--",open);if(comment>s.lastIndexOf("-->",open))return null;
   String name=tag.substring(1).split("\\s",2)[0];String lower=name.toLowerCase(Locale.ROOT);
   if(!mode.equals("xml")&&!mode.equals("svg")&&("|area|base|br|col|embed|hr|img|input|link|meta|param|source|track|wbr|").contains("|"+lower+"|"))return null;
   if(s.startsWith("</"+name+">",a))return null;
   return new Edit(a,b,"></"+name+">",1,1);
  }
  return null;
 }
 static boolean inStringOrComment(String s,int end){
  int start=0;char quote=0;boolean block=false,line=false;
  for(int j=start;j<end;j++){char c=s.charAt(j),next=j+1<end?s.charAt(j+1):0;
   if(line){if(c=='\n')line=false;continue;}
   if(block){if(c=='*'&&next=='/'){block=false;j++;}continue;}
   if(quote!=0){if(c=='\\')j++;else if(c==quote)quote=0;continue;}
   if(c=='/'&&next=='/'){line=true;j++;continue;}if(c=='/'&&next=='*'){block=true;j++;}else if(c=='\''||c=='\"'||c=='`')quote=c;
  }return quote!=0||block||line;
 }
 public static Edit backspace(String s,int pos){if(pos<1||pos>=s.length())return null;int i="([{\"'`".indexOf(s.charAt(pos-1));return i>=0 && s.charAt(pos)==")]}\"'`".charAt(i)?new Edit(pos-1,pos+1,"",0,0):null;}
}
