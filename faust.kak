# remove any old syntax stuff hanging around
rmhl shared/faust/

hook global BufCreate .*[.]dsp %{
  set-option buffer filetype faust
}

hook global WinSetOption filetype=faust %<
    require-module faust
    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window faust-.+ }
>

hook -group faust-highlight global WinSetOption filetype=faust %{
    add-highlighter window/faust ref faust
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/faust }
}

provide-module faust %§

addhl shared/faust                     regions
addhl shared/faust/code default-region group

# faust primitives
# the list is taken from the faust.xml file writen for the kate-editor and may
# not be complete
addhl shared/faust/code/keywords regex \b(?:fstPrims|mem|prefix|int|float|rdtable|rwtable|select2|select3|ffunction|fconstant|fvariable|route|waveform|soundfile|button|checkbox|vslider|hslider|nentry|vgroup|hgroup|tgroup|vbargraph|hbargraph|attach|acos|asin|atan|atan2|cos|sin|tan|exp|log|log10|pow|sqrt|abs|min|max|fmod|remainder|floor|ceil|rint|process|with|case|seq|par|sum|prod|import|component|library|environment|declare)\b 0:keyword

addhl shared/faust/comment-line  region '//' '$' fill comment
addhl shared/faust/comment-block region /\*  \*/ group

addhl shared/faust/code/operator regex '\b_|!|\+|-|\*|/|%|<|>|>=|<=|!=|==|&|\^|\||<<|>>|:|,|<:|:>|~\b' 0:operator
addhl shared/faust/code/num      regex '\b[0-9]+(.[0-9]+)?(e[+-]?[0-9]+)?'                             0:value

# String
addhl shared/faust/string region '"' (?<!\\)(\\\\)*" fill string

§
