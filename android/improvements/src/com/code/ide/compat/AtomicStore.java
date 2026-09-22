package com.code.ide.compat;
import java.io.*;
/** Keeps the previous valid serialized snapshot when a write is interrupted. */
public final class AtomicStore {
 private static Object readOne(File f) throws IOException,ClassNotFoundException {
  try(ObjectInputStream in=new ObjectInputStream(new FileInputStream(f))){return in.readObject();}
 }
 public static synchronized Object read(File main) {
  try{return readOne(main);}catch(Exception ignored){}
  try{return readOne(new File(main.getPath()+".bak"));}catch(Exception ignored){return null;}
 }
 public static synchronized void write(File main,Object value) throws IOException {
  File temp=new File(main.getPath()+".new"),bak=new File(main.getPath()+".bak");
  try{
   try(FileOutputStream file=new FileOutputStream(temp);ObjectOutputStream out=new ObjectOutputStream(file)){out.writeObject(value);out.flush();file.getFD().sync();}
   boolean valid=false;try{readOne(main);valid=true;}catch(Exception ignored){}
   if(valid){if(bak.exists()&&!bak.delete())throw new IOException("Cannot rotate recovery backup");if(!main.renameTo(bak))throw new IOException("Cannot retain previous snapshot");}
   else if(main.exists()&&!main.delete())throw new IOException("Cannot replace incomplete snapshot");
   if(!temp.renameTo(main))throw new IOException("Cannot commit recovery snapshot");
  }finally{if(temp.exists())temp.delete();}
 }
}
