""" Setting recommended by vim latex-suite webpage:

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:



""" Settings for compiling rules:

" Set pdf format to standard output format for compiling
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormat='dvi,pdf'

" Set dependency for compiling to pdf format
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

" Rules for compiling to dvi, ps and pdf 
let g:Tex_CompileRule_dvi = 'latex -interaction=nonestopmode $*'
let g:Tex_CompileRule_ps = 'dvips $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
