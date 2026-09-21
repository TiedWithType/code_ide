const esbuild = require('esbuild');
const fs = require('fs');
const path = require('path');
const target = path.resolve(process.argv[2] || path.join(__dirname, '../overlay/assets/emmet'));
fs.mkdirSync(target, {recursive:true});
esbuild.buildSync({entryPoints:[__dirname+'/adapter.js'],bundle:true,format:'iife',globalName:'CodeIDEEmmet',target:'chrome61',outfile:path.join(target,'emmet.js'),minify:true,legalComments:'eof'});
fs.copyFileSync(path.join(__dirname,'node_modules/emmet/LICENSE'),path.join(target,'LICENSE'));
