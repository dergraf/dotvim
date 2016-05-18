set nocompatible		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/Command-T'
Plugin 'vim-scripts/Python-mode-klen'
Plugin 'vim-scripts/molokai'
Plugin 'vim-scripts/fugitive.vim'
Plugin 'stulzer/heroku-colorscheme'
Plugin 'joshdick/onedark.vim'
Plugin 'SuperTab'
Plugin 'badwolf'
Plugin 'jimenezrick/vimerl'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'vim-coffee-script'
Plugin 'derekwyatt/vim-scala'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'lambdalisue/vim-fullscreen'
Plugin 'joonty/vdebug'
Plugin 'scrooloose/nerdtree'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'rking/ag.vim'
Plugin 'unite.vim'
Plugin 'ack.vim'
Plugin 'Tagbar'
Plugin 'AutoTag'
Plugin 'ctrlp.vim'
Plugin 'phpqa'
"" Plugin 'xolox/vim-easytags'
"" Plugin 'xolox/vim-misc'     " used by vim-easytags

call vundle#end()

filetype plugin indent on	" required! 

"" no menu in gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set t_Co=256			        " we use a terminal that supports 256 colors
set hidden                      " switching unwritten buffers
syntax enable                   " highlight syntax
set encoding=utf-8              " use utf8 as default encoding
set visualbell                  " use visualbell instead of audiobell
set nu                          " set linenumbers
set cul                         " highlight current line
colorscheme onedark
set showcmd                     " display incomplete commands

"" Whitespace
set wrap                        " wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces 
set expandtab                   " use spaces instead of tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Vim Backup Settings
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"" Vim Persistent Undo (vim 7.3)
set undodir=~/.vim/undos        " undo dir
set undofile                    " enable persistent undo
set undolevels=1000             " maximum number of changes that can be undone
set undoreload=10000            " maximum number of lines to save for undo on a buffer reload

"" Ideal column length suitable for many environments
set colorcolumn=80
set textwidth=80

"" EasyTags Configuration
"" set tags=./tags
"" let g:easytags_dynamic_files = 1

noremap Q gq

"" mappings
let mapleader = ","
map <leader>t :CommandT<cr>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <leader>f :Unite file<cr>

"" phpqa
let g:phpqa_codesniffer_autorun = 0
nmap <leader>qc :Phpcs<cr>


"" powerline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

set guifont=Liberation\ Mono\ for\ Powerline

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"" window switch
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

"" automatic remove all trailing whitespaces
autocmd BufWritePre *.{erl,hrl,py,rb,js,html} :%s/\s\+$//e

"" Erlang Code Completion
let g:erlangManPath='/usr/local/lib/erlang/man'

"" Python Mode, capital 'B' instead of 'b'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>B'

"" Syntastic
let g:syntastic_erlang_checkers=['syntaxerl']
