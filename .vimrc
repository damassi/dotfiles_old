

"Vundle Configuration
"--------------------------------------------------------------------------------------------

set shell=/bin/sh             " ensure fish term is off
set nocompatible              " be iMproved, required
filetype off                  " required

"Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"Bundles
"--------------------------------------------------------------------------------------------

Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline.git'
Bundle 'digitaltoad/vim-jade'
Bundle 'flazz/vim-colorschemes'
Bundle 'gmarik/Vundle.vim'
Bundle 'godlygeek/tabular'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'lfilho/cosco.vim'
Bundle 'rking/ag.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic.git'
Bundle 'slim-template/vim-slim'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'wavded/vim-stylus'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'shime/vim-livedown.git'
Bundle 'ap/vim-css-color'
Bundle 'dyng/ctrlsf.vim'

call vundle#end()


"General VIM configuration
"--------------------------------------------------------------------------------------------

filetype plugin indent on             " filetype detection and settings
syntax on                             " syntax highlighting
silent! runtime macros/matchit.vim    " matchit comes with Vim
set nocompatible                      " not strictly necessary but useful in some scenarii
set autoindent                        " always set autoindent on
set copyindent                        " copy previous autoindent
set autoread                          " reload files if changed by filesystem
set backspace=indent,eol,start        " let the backspace key work normally
set clipboard=unnamed                 " Now all operations such as yy, D, and P work with the clipboard. No need to prefix them with  * or +.
set cursorline                        " cursorline on by default

" folding settings:
" za - toggle, zc - closes, zo - opens, zR - opens all, zM - closes all

set foldmethod=indent                 "fold based on indent
set foldnestmax=10                    "deepest fold is 10 levels
set nofoldenable                      "dont fold by default
set foldlevel=1                       "this is just what i use

set guioptions-=r                     " disable scrollbars on mvim
set guioptions-=L                     " disable left scrollbar on vsplit
set history=1000                      " number of history levels
set undolevels=10000                   " more undo
set hlsearch                          " highlight search as you type
set noswapfile                        " disable swp file creation
set nobackup                          " ***
set nowritebackup                     " ***
set nowrap                            " no wordwrapping
set hidden                            " hide unsaved buffers
set incsearch                         " incremental search rules
set laststatus=2                      " not strictly necessary but good for consistency
set number                            " set line numbers on by default
" set relativenumber                    " sets relative numbers in visualmode for simpler counts
set ruler                             " shows line number in the status line
set scrolloff=10                      " scrolling and panning offsets
set sidescrolloff=15
set sidescroll=1
set smartindent                       " auto indent after brackets
set smarttab                          " better tabs
set switchbuf=useopen,usetab          " better behavior for the quickfix window and :sb
set tabstop=2 shiftwidth=2 expandtab  " set tabs to 2 spaces
set tags=./tags;/,tags;/              " search tags files efficiently
set vb                                " turn off annoying beeps
set wildmenu                          " better command line completion, shows a list of matches
nnoremap gb :buffers<CR>:sb<Space>    " quick buffer navigation


" Enable per-project .vimrc files
" -------------------------------------------------------------------------------------------
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files


" Vim configuration
"--------------------------------------------------------------------------------------------
autocmd! BufWritePost vimrc.symlink so ~/.vimrc             " reload .vimrc on save
autocmd BufWritePre * :%s/\s\+$//e                          " trim trailing whitespace
autocmd BufNewFile,BufRead *.cjsx   set syntax=coffee       " set .cjsx syntax to coffee
autocmd QuickFixCmdPost [^l]* nested cwindow                " auto open quickfix when populated
autocmd QuickFixCmdPost    l* nested lwindow

"Highlight text that exceeds 74 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%104v.*/
  autocmd Filetype html,xml,xsl,coffee,cjsx,jsx source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
augroup END


" Additional syntax settings
" --------------------------------------------------------------------------------------------
"Ensure that rails jbuilder files are read as ruby
au BufNewFile,BufRead *.json.jbuilder set ft=ruby


" Key Re-mappings
" --------------------------------------------------------------------------------------------
let mapleader=","                       " remap leader to ,
map <C-J> :bprev<CR>                    " prev buffer
map <C-K> :bnext<CR>                    " next buffer
map <C-L> :tabn<CR>                     " next tab
map <C-H> :tabp<CR>                     " prev tab
vmap <C-x> :!pbcopy<CR>                 " simulate native cut
vmap <C-c> :w !pbcopy<CR><CR>           " and paste

"Enables <Leader>; to auto insert or remove semicolons
"Usage: ,; adds ; or : depending upon context
autocmd FileType javascript,css, noremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css, inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

"Quickly edit/reload the vimrc file
"Usage: ,ev - Edit .vimrc.  ,sv - Reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"This unsets the last search pattern register by hitting return
"Usage: After searching, hitting enter clears all search finds.  Pressing `n`
" returns them
nnoremap <CR> :noh<CR><CR>

"JSBeautify
"Usage: ,f
autocmd FileType javascript noremap <buffer>  <leader>f :call JsBeautify()<cr>

"Open error panel
"Usage: When there are errors, ,er opens panel)
nmap <silent> <leader>er :Errors<CR>

"Remap escape key
"Usage: In insert mode, jk exits)
:inoremap jk <Esc>

"Autoclose html tags
"Usage: <tag>[PRESS TAB]
inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Space>

"Remaps :CtrlSF (SublimeText-like search) to :Af, close to :Ag
ca Af CtrlSF


" NERDTree configuration
" --------------------------------------------------------------------------------------------
autocmd VimEnter * NERDTree           " open nerdtree by default
let NERDTreeShowHidden = 1            " show hidden files by default
let NERDTreeMinimalUI = 1             " only relevant parts
let NERDTreeDirArrows = 1             " add arrows
let NERDTreeIgnore = ['\.DS_Store\|\.sass-cache']   " ignore certain files and patterns
autocmd VimEnter * wincmd p           " start cursor on file pane


" FuzzyFinder (CtrlP) Settings
" --------------------------------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
 \ 'dir' : '\.sass-cache$\|bower_components$\|node_modules$\|\.git$\|tmp$\|\.svn$\|\.sass-cache$\|public/compiled$\|vendor/gems$',
 \ 'file': '\.git$\|\.hg$\|\.svn$\|\.scssc$'
 \ }


" JSDoc Settings
" --------------------------------------------------------------------------------------------
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_return = 0


" Sparkup Configuration
" --------------------------------------------------------------------------------------------
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType coffee,cjsx,jsx,js runtime! ftplugin/react/sparkup.vim
  autocmd FileType mustache,hbs,handlebars,php,htmldjango runtime! ftplugin/html/sparkup.vim
augroup END


" Airline configuration
" --------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s > '


" GitGutter Config
" --------------------------------------------------------------------------------------------
let g:gitgutter_max_signs = 1000


" Syntasitc settings
" --------------------------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['jsxhint']


" CtrlSF (SublimeText-like search)
let g:ctrlsf_winsize = '100'


" Colorscheme
" --------------------------------------------------------------------------------------------
colors abra "apprentice busybee jellybeans railscasts molokai molokai
set fillchars+=vert:\.                " Dotted vertical line separating nerdtree gutter
hi clear VertSplit                    " Clear defaults
highlight SignColumn guibg=#31322c    " GitGutter background color
set guifont=Monaco:h12

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
   let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
   let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"Force enable sass syntax
au BufRead,BufNewFile *.sass set ft=sass

