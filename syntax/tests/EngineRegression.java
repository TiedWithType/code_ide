import java.nio.file.*;import java.util.*;import javax.xml.parsers.*;import org.w3c.dom.*;import javax.swing.text.Segment;import org.gjt.sp.jedit.Mode;import org.gjt.sp.jedit.syntax.*;
public class EngineRegression {
 static int errors=0;
 static class Provider extends ModeProvider {
  @Override public void loadMode(Mode m){super.loadMode(m,new XModeHandler(m.getName()) {
   protected void error(String id,Object arg){errors++;System.err.println("LOAD_ERROR "+m.getName()+" "+id+" "+arg);}
   protected TokenMarker getTokenMarker(String n){var t=getMode(n);return t==null?null:t.getTokenMarker();}
  });}
 }
 public static void main(String[]args)throws Exception{
  ModeProvider.instance=new Provider();Path base=Path.of(args[0]).toAbsolutePath();var f=DocumentBuilderFactory.newInstance();f.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd",false);var b=f.newDocumentBuilder();var cat=b.parse(base.resolve("modes/catalog").toFile());var modes=cat.getElementsByTagName("MODE");
  for(int i=0;i<modes.getLength();i++){var e=(Element)modes.item(i);var m=new Mode(e.getAttribute("NAME"));m.setProperty("file",base.resolve("modes").resolve(e.getAttribute("FILE")).toString());if(e.hasAttribute("FILE_NAME_GLOB"))m.setProperty("filenameGlob",e.getAttribute("FILE_NAME_GLOB"));if(e.hasAttribute("FIRST_LINE_GLOB"))m.setProperty("firstlineGlob",e.getAttribute("FIRST_LINE_GLOB"));m.init();ModeProvider.instance.addMode(m);}
  for(var m:ModeProvider.instance.getModes())m.loadIfNecessary();
  var doc=b.parse(base.resolve("tests/cases.xml").toFile());var cases=doc.getElementsByTagName("CASE");int checks=0;
  for(int i=0;i<cases.getLength();i++){var c=(Element)cases.item(i);String mode=c.getAttribute("mode");String[] lines=c.getElementsByTagName("SOURCE").item(0).getTextContent().split("\n",-1);var tm=ModeProvider.instance.getMode(mode).getTokenMarker();TokenMarker.LineContext ctx=null;var tokens=new ArrayList<byte[]>();
   for(String line:lines){byte[] types=new byte[line.length()];var h=new DefaultTokenHandler();h.init();ctx=tm.markTokens(ctx,h,new Segment(line.toCharArray(),0,line.length()));for(Token t=h.getTokens();t!=null;t=t.next){if(t.id!=Token.END)Arrays.fill(types,t.offset,t.offset+t.length,t.id);}tokens.add(types);}
   var es=c.getElementsByTagName("EXPECT");for(int j=0;j<es.getLength();j++){checks++;var e=(Element)es.item(j);int ln=Integer.parseInt(e.getAttribute("line"))-1;String text=e.getAttribute("text");int pos=lines[ln].indexOf(text);byte expected=Token.stringToToken(e.getAttribute("type"));boolean ok=pos>=0;var actual=new LinkedHashSet<String>();if(ok)for(int k=pos;k<pos+text.length();k++){byte a=tokens.get(ln)[k];actual.add(Token.tokenToString(a));if(a!=expected)ok=false;}if(!ok){errors++;System.out.println("FAIL case="+(i+1)+" "+mode+":"+(ln+1)+" ["+text+"] expected="+e.getAttribute("type")+" actual="+actual);}}
  }
  String[][] globTests={{"test.ts","typescript"},{"x.tsx","tsx"},{"x.jsx","jsx"},{"x.mts","typescript"},{"x.cjs","javascript"},{"x.rs","rust"},{"build.gradle.kts","kotlin"},{"Package.swift","swift"},{"Cargo.toml","toml"},{"query.graphql","graphql"},{"Dockerfile","dockerfile"},{"Dockerfile.dev","dockerfile"},{"main.tf","hcl"},{"terraform.tfvars","hcl"},{"tsconfig.json","jsonc"},{"package.json","json"},{"data.json5","JSON5"},{"legacy.jsonp","javascript"},{"x.pyi","python"},{"config.yml","yaml"}};
  for(var g:globTests){checks++;var m=ModeProvider.instance.getModeForFile(g[0],"");if(m==null||!m.getName().equals(g[1])){errors++;System.out.println("FAIL glob "+g[0]+" expected="+g[1]+" actual="+m);}}
  System.out.println("Modes loaded: "+modes.getLength()+", cases: "+cases.getLength()+", assertions incl. globs: "+checks+", errors: "+errors);if(errors>0)System.exit(1);
 }
}
