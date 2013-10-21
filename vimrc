" Vim configuration file
" softlink to home with command:
" $ ln -s ~/.vim/vimrc ~/.vimrc
"
" Made by: Kristian Bjørke

""" General settings:

" Pathogen:
call pathogen#incubate()
call pathogen#helptags()


" Canges tab-character to insert a given number of white spaces,
" so that tab can be used as indent:
set tabstop=4
set shiftwidth=4
set expandtab

" Settings to enable automated indentation:
set smartindent
set autoindent




""" Settings for vim Latex-Suite:

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

""" Settings for tagbar:

" Set toggle key for tagbar
nmap <F8> :TagbarToggle<CR>
