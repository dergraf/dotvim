set nocompatible		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/Command-T'
Bundle 'vim-scripts/Python-mode-klen'
Bundle 'vim-scripts/Vimerl'
Bundle 'vim-scripts/molokai'
Bundle 'vim-scripts/fugitive.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SuperTab'

filetype plugin indent on	" required! 

set t_Co=256			        " we use a terminal that supports 256 colors
set hidden                      " switching unwritten buffers
syntax enable                   " highlight syntax
set encoding=utf-8              " use utf8 as default encoding
set visualbell                  " use visualbell instead of audiobell
set nu                          " set linenumbers
set cul                         " highlight current line
colorscheme molokai             " set colorscheme
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

"" Powerline (install a patched font e.g. https://gist.github.com/1595572)
let g:Powerline_symbols = 'fancy'
set laststatus=2

"" mappings
let mapleader = ","
map <leader>t :CommandT<cr>

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
let g:pymode_breakpoint_key = '<leader>B'
