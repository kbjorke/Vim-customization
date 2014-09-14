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

" Use ctrl-[hjkl] to toggle between split windows.
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Mapping of ctrl-p to running python-script (should be put as python
" specific mapping):
map <c-p> :!python % <Enter>

" Disable encryption:
set key=


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





""" Functions for resizing termininal window when using vim:

" Function to size up.
function SizeUpFunc()
    if exists("g:oldColumns")
        return
    endif
    " Save the current width.
    let g:oldColumns = &columns
    let g:oldLines = &lines
    " Reset column size when Vim quits.
    au VimLeave * SizeDown
    " Bigger width to make room for line numbers and the sign markers.
    set columns=158 lines=50
endfunction
command SizeUp call SizeUpFunc()

" Function to size down.
function SizeDownFunc()
    if !exists("g:oldColumns")
        return
    endif
    " Restore the original size.
    let &columns = g:oldColumns
    let &lines = g:oldLines
    " Remove the variable.
    unlet g:oldColumns
    unlet g:oldLines
endfunction
command SizeDown call SizeDownFunc()

" Mappings for SizeUp and SizeDown.
map <C-Up> :SizeUp<CR>
map <1b>Oa :SizeUp<CR>
map <C-Down> :SizeDown<CR>
map <1b>Ob :SizeDown<CR>



""" IDE functions:

" Function and command to start up IDE
function IDEFunc()
    SizeUp
    " Turn on line numbers.
    set number
    NERDTree
    Tagbar
endfunction

command IDE call IDEFunc()

" Function and command to end IDE
function NormalFunc()
    SizeDown
    set nonumber
    NERDTreeClose
    TagbarClose
endfunction
command Normal call NormalFunc()


" Automatically quit NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        SizeDown
        q
      endif
    endif
  endif
endfunction


""" Tagbar key bindings
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i
