import com.code.ide.compat.PairRules;
public class PairRulesTest {
 static int n;static void ok(boolean b){n++;if(!b)throw new AssertionError("case "+n);}
 public static void main(String[] args){
 PairRules.Edit r=PairRules.type("",0,0,'(' ,"typescript");ok(r.text.equals("()")&&r.from==1);
 r=PairRules.type("name",0,4,'[',"javascript");ok(r.text.equals("[name]")&&r.from==1&&r.to==5);
 r=PairRules.type("()",1,1,')',"js");ok(r.text.equals("")&&r.from==1);
 ok(PairRules.type("don",3,3,'\'',"text")==null);
 ok(PairRules.type("\\",1,1,'"',"js")==null);
 ok(PairRules.type("\"abc",4,4,'(',"js")==null);
 ok(PairRules.type("// comment",10,10,'{',"js")==null);
 ok(PairRules.type("/* comment",10,10,'[',"js")==null);
 r=PairRules.type("<div",4,4,'>',"html");ok(r.text.equals("></div>")&&r.from==1);
 ok(PairRules.type("<input",6,6,'>',"html")==null);
 ok(PairRules.type("<div/",5,5,'>',"html")==null);
 ok(PairRules.type("</div",5,5,'>',"html")==null);
 ok(PairRules.type("<!-- <div",9,9,'>',"html")==null);
 ok(PairRules.type("<div title=\"a",13,13,'>',"html")==null);
 r=PairRules.type("<x-card class=\"a\"",17,17,'>',"html");ok(r.text.equals("></x-card>"));
 ok(PairRules.type("<div</div>",4,4,'>',"html")==null);
 ok(PairRules.type("a < b",5,5,'>',"typescript")==null);
 r=PairRules.type("<node",5,5,'>',"xml");ok(r.text.equals("></node>"));
 r=PairRules.backspace("()",1);ok(r.start==0&&r.end==2&&r.text.isEmpty());
 ok(PairRules.backspace("(a)",2)==null);ok(PairRules.type("",0,0,'(',"markdown")==null);
 ok(PairRules.type("abc",1,1,'(',"js")==null);
 ok(PairRules.type("/* comment\nnext",15,15,'(' ,"js")==null);
 ok(PairRules.type("<script>const x=\"<div",21,21,'>',"html")==null);
 ok(PairRules.type("// comment\n",11,11,'(' ,"js")!=null);
 System.out.println(n+" pairing cases passed");
 }
}
