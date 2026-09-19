import java.nio.file.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import javax.swing.text.Segment;
import org.gjt.sp.jedit.Mode;
import org.gjt.sp.jedit.syntax.*;
public class EngineProbe {
 public static void main(String[] args)throws Exception {
  Path base=Path.of(args[0]).toAbsolutePath();
  var f=DocumentBuilderFactory.newInstance(); f.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd",false);
  var doc=f.newDocumentBuilder().parse(base.resolve("modes/catalog").toFile());
  var list=doc.getElementsByTagName("MODE");
  for(int i=0;i<list.getLength();i++) {var e=(Element)list.item(i);var m=new Mode(e.getAttribute("NAME"));m.setProperty("file",base.resolve("modes").resolve(e.getAttribute("FILE")).toString());if(e.hasAttribute("FILE_NAME_GLOB"))m.setProperty("filenameGlob",e.getAttribute("FILE_NAME_GLOB"));m.init();ModeProvider.instance.addMode(m);}
  if(args.length==1) {for(var m:ModeProvider.instance.getModes()){System.out.println("LOAD "+m.getName());ModeProvider.instance.loadMode(m,new XModeHandler(m.getName()) { protected void error(String id,Object arg){System.err.println("MODE_ERROR "+m.getName()+" "+id+" "+arg);} protected TokenMarker getTokenMarker(String name){var target=ModeProvider.instance.getMode(name);return target==null?null:target.getTokenMarker();} });if(m.getTokenMarker()==null)throw new AssertionError(m.getName());}System.out.println("Loaded "+list.getLength()+" catalog entries");return;}
  var m=ModeProvider.instance.getMode(args[1]);ModeProvider.instance.loadMode(m);var tm=m.getTokenMarker();TokenMarker.LineContext ctx=null;
  for(String line:Files.readAllLines(Path.of(args[2]))){var h=new DefaultTokenHandler();h.init();ctx=tm.markTokens(ctx,h,new Segment(line.toCharArray(),0,line.length()));System.out.println("LINE: "+line);for(Token tok=h.getTokens();tok!=null;tok=tok.next){if(tok.id==Token.END)continue;System.out.println(Token.tokenToString(tok.id)+"|"+line.substring(tok.offset,tok.offset+tok.length));}}
 }
}
