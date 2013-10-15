"""Settings for compiling rules:

" Set pdf format to standard output format for compiling
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormat='dvi,pdf'

" Set dependency for compiling to pdf format
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

" Rules for compiling to dvi, ps and pdf 
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
