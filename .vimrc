" pathogen
execute pathogen#infect()
Helptags

" load fzf downloaded with brew and map it to Ctrl-P
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>

" turn off vi-conpat mode, enable indent & syntax
set nocompatible | filetype indent plugin on | syn on
" read custom vimrc files in directory
set exrc
set secure

" set tab to 2 spaces and automate
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
nnoremap <silent> <C-j> :let &ts=(&ts*2 > 8 ? 2 : &ts*2)<cr>:let &sw=&ts<cr>:let &sts=&ts<cr>:echo "tabstop:" . &ts<cr>
"set cindent

" set numbers and colors
set nu
set background=dark
colorscheme badwolf

" Only ignore case when we type lower case when searching
set ignorecase
set smartcase

" automatically change current dir
" set autochdir

" enable mouse control
set mouse=a
set ttymouse=xterm2

" map jj to Esc 
inoremap jj <Esc>

" backspace
set backspace=2

" set tags file
set tags=./.tags;,.tags;,./tags;,tags;

" highlight long lines
command SeeLong highlight OverLength ctermfg=red | match OverLength /\%81v.\+/
command SeeLongOff highlight OverLength NONE

" toggle paste with Ctrl-P (overrides word completion)
" nnoremap <C-p> :set invpaste paste?<CR>
" set pastetoggle=<C-p>
" set showmode

" other little configs
" move to start/end of line
nmap <C-e> $
inoremap <C-e> <C-O>$
nnoremap <C-a> 0
imap <C-a> <C-O>0
imap <C-b> <C-O>h
imap <C-f> <C-O>l

" clear line
nmap <C-d> cc<Esc>

" *MAC ONLY* copy selected text to clipboard
" TODO: doesn't work for inline-copy
map <C-c> y:new<CR>pkdd:w !pbcopy<CR><CR>:q!<CR>

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" for vim-markdown
let g:vim_markdown_folding_disabled = 1

" for Rg - automatically set root to dir with .git
let g:rg_derive_root = 1

