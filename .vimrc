call plug#begin('~/.vim/plugged')

"Plug 'valloric/youcompleteme'

Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-skeletons'
" Erlang Friendly Colorscheme
Plug 'vim-erlang/vim-compot'

" Git Magit
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mrk21/yaml-vim'


Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'ajmwagar/vim-deus'
Plug 'sotte/presenting.vim'

Plug 'tpope/vim-vinegar'

Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

colorscheme deus

nnoremap <C-p> :Files<cr>

" Whitespace
set wrap                        " wrap lines
set tabstop=4 shiftwidth=4      " a tab is 4 spaces 
set expandtab                   " use spaces instead of tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" GUI
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set number

"" automatic remove all trailing whitespaces
autocmd BufWritePre *.{erl,hrl,py,rb,js,html} :%s/\s\+$//e

""""" Elixir
"---------------------------
"" automatic formatting of elixir files
command! ExFmt :silent !/home/graf/Projects/elixir/bin/elixir /home/graf/Projects/elixir/bin/mix format --check-equivalent %:p
autocmd BufWritePost *.{ex,exs} :ExFmt
" automatic reloading of elixir files after autoformat
autocmd BufRead,BufNewFile *.{ex,exs} setlocal autoread

let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-[>'
let g:alchemist#elixir_erlang_src = '/home/graf/Projects/elixir-source'

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mapping selecting mappings
let mapleader = ","
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Vim Wiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let g:vimwiki_list = [wiki]
