import expandAbbreviation, {extract} from 'emmet';
const MAX_DOC = 512 * 1024;
const MAX_ABBR = 4096;
const MAX_OUTPUT = 256 * 1024;
function syntaxName(value) {
    const name = String(value || '').toLowerCase();
    if (['css', 'scss', 'sass', 'stylus'].includes(name)) return name;
    if (['jsx', 'tsx'].includes(name)) return 'jsx';
    if (['xml', 'xsl', 'xhtml', 'svg'].includes(name)) return name === 'xhtml' ? 'xhtml' : 'xml';
    if (['html', 'php', 'shtml', 'rhtml', 'jsp', 'gsp', 'asp', 'vue', 'text', 'txt', ''].includes(name)) return 'html';
    throw new Error('syntax');
}
const voidTags = new Set('area base br col embed hr img input link meta param source track wbr'.split(' '));
// Small context scanner, not an HTML validator. Do not expand inside comments,
// ordinary attributes or script bodies. A style block/attribute switches to CSS.
function htmlContext(prefix) {
    const stack = [];
    const token = /<!--[\s\S]*?(?:-->|$)|<\/?([A-Za-z][\w:-]*)(?:\s+(?:[^>"']|"[^"]*"|'[^']*')*)?\s*\/?\s*>/g;
    let match, raw = '', lastEnd = 0;
    while ((match = token.exec(prefix))) {
        if (raw) {
            if (match[0].toLowerCase().startsWith('</' + raw)) {raw = ''; stack.pop();}
            lastEnd = token.lastIndex; continue;
        }
        if (match[0].startsWith('<!--')) {
            if (!match[0].endsWith('-->')) return {blocked: true};
            lastEnd = token.lastIndex; continue;
        }
        const tag = match[1].toLowerCase();
        if (match[0][1] === '/') {
            const index = stack.lastIndexOf(tag);
            if (index >= 0) stack.length = index;
        } else if (!voidTags.has(tag) && !match[0].endsWith('/>')) {
            stack.push(tag);
            if (tag === 'script' || tag === 'style') raw = tag;
        }
        lastEnd = token.lastIndex;
    }
    if (raw === 'script') return {blocked: true};
    if (raw === 'style') return {css: true};
    const tail = prefix.slice(lastEnd);
    const open = tail.lastIndexOf('<');
    if (open >= 0 && /^<[A-Za-z]/.test(tail.slice(open))) {
        const unfinished = tail.slice(open);
        const attr = /\bstyle\s*=\s*(["'])([^"']*)$/.exec(unfinished);
        return attr ? {css: true, inline: true} : {blocked: true};
    }
    return {parent: stack[stack.length - 1]};
}
export function expand(req) {
    try {
        const text = req.text;
        if (typeof text !== 'string' || text.length > MAX_DOC) throw new Error('size');
        const low = Math.min(req.start, req.end), high = Math.max(req.start, req.end);
        if (!Number.isInteger(low) || !Number.isInteger(high) || low < 0 || high > text.length) throw new Error('selection');
        let syntax = syntaxName(req.syntax);
        let context = {};
        // For JSX the host is JavaScript: don't interpret comparisons/strings as HTML.
        if (syntax === 'html' || syntax === 'xhtml') context = htmlContext(text.slice(0, low));
        if (context.blocked) throw new Error('context');
        if (context.css) syntax = 'css';
        const type = ['css', 'scss', 'sass', 'stylus'].includes(syntax) ? 'stylesheet' : 'markup';
        let start = low, end = high, abbr;
        if (low !== high) abbr = text.slice(low, high);
        else {
            const lineStart = text.lastIndexOf('\n', low - 1) + 1;
            const lineEnd = text.indexOf('\n', low);
            const line = text.slice(lineStart, lineEnd < 0 ? text.length : lineEnd);
            const found = extract(line, low - lineStart, {type, lookAhead: true});
            if (!found) throw new Error('empty');
            start = lineStart + found.start; end = lineStart + found.end; abbr = found.abbreviation;
        }
        if (!abbr.trim()) throw new Error('empty');
        if (abbr.length > MAX_ABBR || /\*(?:[1-9]\d{3,}|0*1\d{3,})/.test(abbr)) throw new Error('size');
        const lineStart = text.lastIndexOf('\n', start - 1) + 1;
        const indent = /^[\t ]*/.exec(text.slice(lineStart, start))[0];
        let firstField = null;
        const fields = [];
        const options = {
            'output.indent': typeof req.indent === 'string' ? req.indent : '    ',
            'output.baseIndent': indent,
            'output.newline': text.includes('\r\n') ? '\r\n' : '\n',
            'output.field': (index, placeholder, offset) => {
                // Emmet calls this in output order. Prefer the first positive tabstop.
                const field = {index, start: offset, end: offset + placeholder.length};
                fields.push(field);
                if (!firstField || (index > 0 && (firstField.index === 0 || index < firstField.index))) firstField = field;
                return placeholder;
            }
        };
        if (context.inline) options['output.format'] = false;
        const config = {type, syntax, maxRepeat: 1000, options, variables: {lang: req.lang || 'pl'}};
        if (req.snippets && typeof req.snippets === 'object') {
            const custom = req.snippets[syntax] || (type === 'stylesheet' ? req.snippets.css : req.snippets.html);
            if (custom && typeof custom === 'object') {
                config.snippets = Object.create(null);
                for (const key of Object.keys(custom)) {
                    if (key.length > 0 && key.length <= 64 && typeof custom[key] === 'string' && custom[key].length <= MAX_ABBR) config.snippets[key] = custom[key];
                }
            }
        }
        if (type === 'markup' && context.parent) config.context = {name: context.parent};
        if (type === 'stylesheet') {
            // CSS value abbreviations, e.g. "margin: a" -> "margin: auto".
            const before = text.slice(lineStart, start);
            const prop = /(?:^|[;{])\s*([\w-]+)\s*:\s*$/.exec(before);
            if (prop) config.context = {name: prop[1]};
        }
        const output = expandAbbreviation(abbr, config);
        if (!output || output === abbr) throw new Error('empty');
        if (output.length > MAX_OUTPUT) throw new Error('size');
        // One stop per field number. Zero is always the final stop.
        fields.sort((a,b) => (a.index === 0 ? Infinity : a.index) - (b.index === 0 ? Infinity : b.index));
        const stops = fields.filter((f,i) => !fields.slice(0,i).some(g => g.index === f.index));
        if (stops.length && !stops.some(f => f.index === 0)) stops.push({index:0,start:output.length,end:output.length});
        const from = firstField ? firstField.start : output.length;
        const to = firstField ? firstField.end : output.length;
        return {ok: true, start, end, text: output, fields: stops, selectionStart: Math.min(from, output.length), selectionEnd: Math.min(to, output.length), syntax};
    } catch (e) {
        const code = ['syntax', 'size', 'context', 'empty', 'selection'].includes(e.message) ? e.message : 'invalid';
        return {ok: false, error: code};
    }
}

// Suggestions share the same bounded expansion and context validation as commands.
export function suggest(req) {
    try {
        if (req.start !== req.end || req.text.length > MAX_DOC) return [];
        let syntax = syntaxName(req.syntax);
        const ctx = ['html','xhtml'].includes(syntax) ? htmlContext(req.text.slice(0,req.start)) : {};
        if (ctx.blocked) return [];
        if (ctx.css) syntax='css';
        const css=['css','scss','sass','stylus'].includes(syntax);
        const lineStart=req.text.lastIndexOf('\n',req.start-1)+1;
        const found=extract(req.text.slice(lineStart,req.start),req.start-lineStart,{type:css?'stylesheet':'markup',lookAhead:false});
        if(!found || !found.abbreviation || found.abbreviation.length>128) return [];
        const prefix=found.abbreviation;
        const start=lineStart+found.start;
        const custom=req.snippets || {};
        const names=Object.keys(custom[syntax] || custom[css?'css':'html'] || {});
        const common=css?['m','mt','mb','p','pt','pb','d:f','d:g','pos:a','pos:r','w','h','bgc','c','fz','fw','gap','ai:c','jc:c']:['div','span','section','article','header','footer','main','nav','button','a','a:link','img','input','input:text','form','label','ul','ol','li','p','h1','h2','link:css','script:src','!'];
        const candidates=[prefix,...names.filter(n=>n.startsWith(prefix)&&n!==prefix).sort(),...common.filter(n=>n.startsWith(prefix)&&n!==prefix)];
        const result=[], seen=new Set();
        for(const name of candidates){
            if(seen.has(name))continue;seen.add(name);
            const text=req.text.slice(0,start)+name+req.text.slice(req.start);
            const value=expand({...req,text,start,end:start+name.length});
            if(value.ok && value.text.length<=8192){value.start=start;value.end=req.start;result.push({name,value});}
            if(result.length===4)break;
        }
        return result;
    }catch(e){return [];}
}
