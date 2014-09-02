

"Vundle Configuration
"--------------------------------------------------------------------------------------------

set shell=/bin/sh           " ensure fish term is off
set term=xterm-256color       " iTerm2 support
set nocompatible              " be iMproved, required
filetype off                  " required

"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"Bundles
"--------------------------------------------------------------------------------------------

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-commentary.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'bling/vim-airline.git'
Bundle 'vim-scripts/bufkill.vim'

call vundle#end()


"General VIM configuration
"--------------------------------------------------------------------------------------------

filetype plugin indent on             " filetype detection and settings
syntax on                             " syntax highlighting
silent! runtime macros/matchit.vim    " matchit comes with Vim
set nocompatible                      " not strictly necessary but useful in some scenarii
set autoread                          " reload files if changed by filesystem
set backspace=indent,eol,start        " let the backspace key work "normally"
set clipboard=unnamed                 " Now all operations such as yy, D, and P work with the clipboard. No need to prefix them with "* or "+.
set cursorline                        " cursorline on by default
set guioptions-=r                     " disable scrollbars on mvim
set guioptions-=L                     " disable left scrollbar on vsplit
set noswapfile                        " disable swp file creation
set nobackup
set nowritebackup
set nowrap                            " no wordwrapping
set hidden                            " hide unsaved buffers
set incsearch                         " incremental search rules
set laststatus=2                      " not strictly necessary but good for consistency
set number                            " set line numbers on by default
set ruler                             " shows line number in the status line
set scrolloff=10                      " scrolling and panning offsets
set sidescrolloff=15
set sidescroll=1
set switchbuf=useopen,usetab          " better behavior for the quickfix window and :sb
set tabstop=2 shiftwidth=2 expandtab  " set tabs to 2 spaces
set tags=./tags;/,tags;/              " search tags files efficiently
set vb                                " turn off annoying beeps
set wildmenu                          " better command line completion, shows a list of matches
nnoremap gb :buffers<CR>:sb<Space>    " quick buffer navigation


" Vim configuration
"--------------------------------------------------------------------------------------------

autocmd! BufWritePost vimrc.symlink so ~/.vimrc             " reload .vimrc on save
autocmd BufWritePre * :%s/\s\+$//e                          " trim trailing whitespace
autocmd BufNewFile,BufRead *.cjsx   set syntax=coffee       " set .cjsx syntax to coffee


"Key Re-mappings
"--------------------------------------------------------------------------------------------

map <C-J> :bprev<CR>            " prev buffer
map <C-K> :bnext<CR>            " next buffer
map <C-L> :tabn<CR>             " next tab
map <C-H> :tabp<CR>             " prev tab
vmap <C-x> :!pbcopy<CR>         " simulate native cut
vmap <C-c> :w !pbcopy<CR><CR>   " and paste


"NERDTree configuration
"--------------------------------------------------------------------------------------------

autocmd VimEnter * NERDTree      " open nerdtree by default
let NERDTreeShowHidden = 1       " show hidden files by default
let NERDTreeMinimalUI = 1        " only relevant parts
let NERDTreeDirArrows = 1        " add arrows
autocmd VimEnter * wincmd p      " start cursor on file pane


"FuzzyFinder (CtrlP) Settings
"--------------------------------------------------------------------------------------------

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'


"Airline configuration
"--------------------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1


"Colorscheme
"--------------------------------------------------------------------------------------------

colors monokai
"set fillchars+=vert:\│
"hi clear VertSplit

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
   let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
   let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
