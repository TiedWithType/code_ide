package com.code.ide.compat;
import java.io.*; import java.util.*;
public class LargeFileGuardTest {
  static int f=0; static void ck(boolean c,String m){ if(!c){f++;System.out.println("FAIL "+m);} else System.out.println("ok "+m);}
  public static void main(String[] a) throws Exception {
    Random r=new Random(7);
    for(int k=0;k<2000;k++){ StringBuilder sb=new StringBuilder(); int n=r.nextInt(30); for(int i=0;i<n;i++) sb.append("ab\r\n\r".charAt(r.nextInt(5)));
      String s=sb.toString(); if(!LargeFileGuard.normalize(s).equals(s.replaceAll("\\r\\n","\n").replaceAll("\\r","\n"))){ck(false,"normalize "+s.replace("\r","R").replace("\n","N"));return;} }
    ck(true,"normalize == dwa replaceAll (2000 losowych)");
    byte[] data="a\r\nb\rc\n".getBytes("UTF-8");
    ck(LargeFileGuard.read(null,new ByteArrayInputStream(data),data.length,"UTF-8").equals("a\nb\nc\n"),"read + normalize");
    try{ LargeFileGuard.check(LargeFileGuard.HARD_CAP+1); ck(false,"cap"); }catch(LargeFileGuard.TooBigException e){ ck(true,"powyżej HARD_CAP -> wyjątek: "+e.getMessage()); }
    long max=LargeFileGuard.maxFileSize(); System.out.println("maxMemory="+Runtime.getRuntime().maxMemory()/1048576+" MB, maxFileSize="+max/1048576.0+" MB");
    try{ LargeFileGuard.check(1<<20); ck(true,"1 MB przechodzi (czego wcześniej nie było >1 000 000 B)"); }catch(Exception e){ck(false,"1MB "+e);} 
    try{ LargeFileGuard.read(null,new ByteArrayInputStream(new byte[0]),Runtime.getRuntime().maxMemory(),"UTF-8"); ck(false,"za duży wg pamięci"); }catch(LargeFileGuard.TooBigException e){ ck(true,"rozmiar > pamięć -> wyjątek, plik nie jest otwierany"); }
    System.out.println(f==0?"WSZYSTKIE OK":"BŁĘDY "+f);
  }
}
