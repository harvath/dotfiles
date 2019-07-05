" ========== RTP ==========
" pathogen
execute pathogen#infect()
Helptags

" *mac only* load fzf downloaded with brew and map it to ctrl-p
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>
command B Buffer

" ========== Basic Configurations ==========
" map jj to Esc (the most important trick of all)
inoremap jj <Esc>

" turn off vi-conpat mode, enable indent & syntax
set nocompatible | filetype indent plugin on | syn on

" read custom vimrc files in directory (securely)
set exrc secure

" set tab to 2 spaces and automate
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" " change tabs settings with ctrl+j
" nnoremap <silent> <C-j> :let &ts=(&ts*2 > 8 ? 2 : &ts*2)<cr>:let &sw=&ts<cr>:let &sts=&ts<cr>:echo "tabstop:" . &ts<cr>

" always show status line
set laststatus=2

" show tabs and trailing whitespaces
set list listchars=tab:>-,trail:·

" show line numbers
set number 

" color  
set background=dark
colorscheme badwolf

" Only ignore case when we type lower case when searching
set ignorecase smartcase

" enable mouse control
set mouse=a ttymouse=xterm2

" allow backspace to work like in most programs
set backspace=indent,eol,start

" set tags file
set tags=./.tags;,.tags;,./tags;,tags;

" ========== Highlights ==========
" highlight long lines (>80) 
highlight overlength ctermfg=red guifg=red 
match overlength /\%81v.\+/

" highlight double-byte spaces
highlight dbspace ctermbg=red guibg=red 
2match dbspace /　/

" ========== Other custom commands ==========
" move around like in bash
nmap <C-e> $
nmap <C-a> 0
imap <C-e> <C-O>$
imap <C-a> <C-O>0
imap <C-b> <C-O>h
imap <C-f> <C-O>l

" clear line with Ctrl-d
nmap <C-d> cc<Esc>

" *MAC ONLY* copy selected text to clipboard
" TODO: doesn't work for inline-copy
map <C-c> y:new<CR>pkdd:w !pbcopy<CR><CR>:q!<CR>

" toggle paste with Ctrl-j
nnoremap <C-j> :set invpaste paste?<CR>
set pastetoggle=<C-j>

" ========== Plugin-specific ==========
" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" for vim-markdown
let g:vim_markdown_folding_disabled = 1

" for Rg - automatically set root to dir with .git
let g:rg_derive_root = 1
let g:rg_command = 'rg --vimgrep -g "!tags"'
