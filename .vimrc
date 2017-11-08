call plug#begin('~/.vim/plugged')

Plug 'valloric/youcompleteme'

Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
" Erlang Friendly Colorscheme
Plug 'vim-erlang/vim-compot'

" Git Magit
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'Shougo/denite.nvim'

Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Initialize plugin system
call plug#end()

colorscheme compot

nnoremap <C-p> :DeniteProjectDir file_rec line<cr>

nnoremap <C-space> :DeniteProjectDir grep:.<cr>

nnoremap <space>s :Denite buffer<cr>

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
