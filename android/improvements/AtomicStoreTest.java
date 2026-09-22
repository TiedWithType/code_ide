import com.code.ide.compat.AtomicStore;
import java.io.*;
import java.nio.file.*;
import java.util.*;
public final class AtomicStoreTest {
 public static void main(String[] args)throws Exception{
  File f=Files.createTempDirectory("codeide-recovery-").resolve("droidedit.tmp").toFile();
  check(AtomicStore.read(f)==null,"missing");
  AtomicStore.write(f,"first");check("first".equals(AtomicStore.read(f)),"initial snapshot");
  AtomicStore.write(f,"second");check("second".equals(AtomicStore.read(f)),"replacement");
  Files.write(f.toPath(),new byte[]{1,2,3});check("first".equals(AtomicStore.read(f)),"corrupt main recovers backup");
  try{AtomicStore.write(f,new Object());throw new AssertionError("expected failure");}catch(NotSerializableException expected){}
  check("first".equals(AtomicStore.read(f)),"failed serialize preserves backup");
  AtomicStore.write(f,"third");check("third".equals(AtomicStore.read(f)),"repair damaged main");
  Files.write(new File(f+".new").toPath(),new byte[]{1});check("third".equals(AtomicStore.read(f)),"incomplete temp ignored");
  Files.delete(f.toPath());check("first".equals(AtomicStore.read(f)),"interrupted rotation recovers backup");
  HashMap<String,Object> model=new HashMap<>();model.put("text","Zażółć 😀\nunsaved");model.put("selection",5);AtomicStore.write(f,model);check(model.equals(AtomicStore.read(f)),"session contents");
  System.out.println("9 recovery cases passed");
 }
 static void check(boolean ok,String name){if(!ok)throw new AssertionError(name);}
}
