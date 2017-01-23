" pathogen
execute pathogen#infect()
Helptags

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

" enable mouse control
set mouse=a

" map jj to Esc
inoremap jj <Esc>

" backspace
set backspace=2

" set tags file
set tags=./.tags;,.tags;,./tags;,tags;

" highlight long lines
command SeeLong highlight OverLength ctermfg=red | match OverLength /\%81v.\+/
command SeeLongOff highlight OverLength NONE

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
map <C-c> y:new<CR>P:w !pbcopy<CR><CR>:q!<CR>

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>
