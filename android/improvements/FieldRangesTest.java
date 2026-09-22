import com.code.ide.compat.FieldRanges;
public class FieldRangesTest {
 public static void main(String[] args){
  FieldRanges f=new FieldRanges();f.add(10,14);f.add(20,23);f.add(30,30);
  ok(f.contains(10,14));ok(!f.contains(9,14));ok(!f.edit(9,0,1));
  ok(f.edit(10,4,6));ok(f.start()==10&&f.end()==16);
  ok(f.move(false)&&f.start()==22&&f.end()==25);
  ok(f.edit(23,1,0)&&f.end()==24);
  ok(f.move(true)&&f.start()==10&&f.end()==16);
  ok(f.move(true)&&f.start()==10);ok(f.move(false));ok(f.move(false)&&f.start()==31&&f.end()==31);
  ok(f.edit(31,0,2)&&f.end()==33);ok(!f.move(false));
  FieldRanges overlap=new FieldRanges();overlap.add(1,10);overlap.add(3,5);ok(!overlap.edit(2,1,2));
  System.out.println("14 tabstop range cases passed");
 }
 static void ok(boolean b){if(!b)throw new AssertionError();}
}
