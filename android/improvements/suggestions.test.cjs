const fs=require('fs'),vm=require('vm'),assert=require('assert/strict');const c=vm.createContext({});vm.runInContext(fs.readFileSync(process.argv[2]||'decoded/assets/emmet/emmet.js','utf8'),c);let count=0;
function suggest(text,syntax='html',snippets={}){return c.CodeIDEEmmet.suggest({text,start:text.length,end:text.length,syntax,snippets,indent:'  '});}
function test(name,f){try{f();count++}catch(e){console.error(name);throw e}}
test('html preview',()=>assert(suggest('di').some(x=>x.name==='div'&&x.value.text==='<div></div>')));
test('custom prefix',()=>assert(suggest('ca','html',{html:{card:'article.card>h2{${1:Tytuł}}'}}).some(x=>x.name==='card'&&x.value.text.includes('<h2>Tytuł</h2>'))));
test('custom exact',()=>assert(suggest('card','html',{html:{card:'article.card'}})[0].value.text.includes('article')));
test('css preview',()=>assert(suggest('m10','css')[0].value.text.includes('10px')));
test('css custom',()=>assert(suggest('bra','css',{css:{brand:'color: #6750a4;'}}).some(x=>x.name==='brand')));
test('script context blocked',()=>assert.equal(suggest('<script>di').length,0));
test('comment blocked',()=>assert.equal(suggest('<!-- di').length,0));
test('attribute blocked',()=>assert.equal(suggest('<div class="di').length,0));
test('style context',()=>assert(suggest('<style>m10')[0].value.text.includes('margin')));
test('unsupported TS',()=>assert.equal(suggest('co','typescript').length,0));
test('empty',()=>assert.equal(suggest('').length,0));
test('selection blocked',()=>assert.equal(c.CodeIDEEmmet.suggest({text:'div',start:0,end:3,syntax:'html'}).length,0));
test('bounded',()=>assert.equal(suggest('li*9999').length,0));
test('replace prefix range',()=>{let r=suggest('<main>di')[0].value;assert.equal(r.start,6);assert.equal(r.end,8)});
test('unique choices',()=>{let r=suggest('d','html',{html:{div:'div.special'}});assert.equal(new Set(r.map(x=>x.name)).size,r.length);assert(r.length<=4)});
console.log(count+' suggestion cases passed');
