
"Vundle Configuration
"--------------------------------------------------------------------------------------------

set shell=/bin/sh   	      " ensure fish term is off
set term=xterm-256color       " iTerm2 support
set nocompatible              " be iMproved, required
filetype off                  " required

"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Bundles
"--------------------------------------------------------------------------------------------

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'

call vundle#end()


"Base VIM configuration
"--------------------------------------------------------------------------------------------

filetype plugin indent on          " filetype detection and settings
syntax on                          " syntax highlighting
silent! runtime macros/matchit.vim " matchit comes with Vim
set nocompatible                   " not strictly necessary but useful in some scenarii
set backspace=indent,eol,start     " let the backspace key work "normally"
set clipboard=unnamed              " Now all operations such as yy, D, and P work with the clipboard. No need to prefix them with "* or "+.
set hidden                         " hide unsaved buffers
set incsearch                      " incremental search rules
set laststatus=2                   " not strictly necessary but good for consistency
set number
set ruler                          " shows line number in the status line
set switchbuf=useopen,usetab       " better behavior for the quickfix window and :sb
set tags=./tags;/,tags;/           " search tags files efficiently
set wildmenu                       " better command line completion, shows a list of matches
nnoremap gb :buffers<CR>:sb<Space> " quick buffer navigation

autocmd VimEnter * NERDTree 	   " open nerdtree by default
let NERDTreeShowHidden = 1    	   " show hidden files by default
autocmd VimEnter * wincmd p 	   " start cursor on file pane
