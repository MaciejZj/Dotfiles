" General
" Line numbers
set number
" Disable vi compatibility
set nocompatible
" Use system clipboard
set clipboard=unnamed
" Set shell to zsh
set shell=/bin/zsh

" Text formatting
syntax on
" Hard tab
set shiftwidth=4
set tabstop=4
set noexpandtab
set smartindent

" Make backspace work like most other programs
set backspace=2 
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Enable use of the mouse for all modes
set mouse=a
" Nicer border in splitview
set fillchars+=vert:\

" Searching highlight colors
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Black

" Autocompletion
" make vim suggest longest completion first
:set completeopt=longest,menuone

" Map quick doubletype j esc
imap jj <Esc>

" Turn line numbers color to grey
highlight LineNr ctermfg=grey

" Vunlde plugins
set rtp+=~/.vim/bundle/Vundle.vim " required
call vundle#begin()               " required

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'luochen1990/rainbow'
Plugin 'sheerun/vim-polyglot'
Plugin 'jeffkreeftmeijer/vim-dim'

call vundle#end()                 " required
filetype plugin indent on         " required

" Enable default colorscheme in ANSI colors mode
colorscheme dim

" Airline plugin
" Tweak to make airline work
set laststatus=2
" Colorscheme

" Enable gitguter realtime upadating
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250
" Ensure gitguter has proper colors
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" Rainbow parentheses plugin
" Enable
let g:rainbow_active = 1
" Set parentheses colors
let g:rainbow_conf = {
\	'ctermfgs': ['green', 'yellow', 'cyan', 'magenta', 'red'],
\}

let g:lightline = {
\   'colorscheme': 'one'
\ }

