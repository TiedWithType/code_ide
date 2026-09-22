package com.code.ide.compat;
import java.util.ArrayList;
/** Pure offset model shared by the Android tabstop controller and host tests. */
public final class FieldRanges {
 final ArrayList<int[]> fields=new ArrayList<int[]>();
 private int current;
 public void add(int start,int end){if(start<0||end<start)throw new IllegalArgumentException();fields.add(new int[]{start,end});}
 public int start(){return fields.get(current)[0];}
 public int end(){return fields.get(current)[1];}
 public boolean contains(int low,int high){return low>=start()&&high<=end()&&high>=low;}
 public boolean edit(int at,int before,int count){
  if(!contains(at,at+before))return false;
  int[] f=fields.get(current);int oldEnd=f[1],delta=count-before;
  for(int i=0;i<fields.size();i++)if(i!=current){int[] other=fields.get(i);if(other[0]<oldEnd&&other[1]>at)return false;}
  f[1]+=delta;
  for(int i=0;i<fields.size();i++)if(i!=current){int[] other=fields.get(i);if(other[0]>=oldEnd){other[0]+=delta;other[1]+=delta;}}
  return true;
 }
 public boolean move(boolean backward){if(backward){current=Math.max(0,current-1);return true;}if(current+1>=fields.size())return false;current++;return true;}
}
