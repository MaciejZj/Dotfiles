" General
" Line numbers
set number
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
set autoindent
" Make backspace work like most other programs
set backspace=2
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Nicer border in splitview
set fillchars+=vert:\ 

" Searching highlight colors
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=Black

" Turn line numbers color to grey
highlight LineNr ctermfg=grey

" Vunlde plugins
set rtp+=~/.vim/bundle/Vundle.vim " required
call vundle#begin() " required

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'luochen1990/rainbow'
Plugin 'sheerun/vim-polyglot'
"Plugin 'jeffkreeftmeijer/vim-dim'
Plugin 'MaciejZj/vim-airline-dim'
Plugin 'MaciejZj/vim-dim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'liuchengxu/vista.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'wincent/terminus'

call vundle#end()                 " required
filetype plugin indent on         " required

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plugin>(asyncomplete_force_refresh)

noremap <space> :Commands<cr>

let g:lsp_diagnostics_enabled = 0

let g:vista_default_executive = 'vim_lsp'
let g:vista_ignore_kinds = ['Variable']

set cinoptions+=L0

" Enable default colorscheme in ANSI colors mode
colorscheme dim

" Airline plugin
" Tweak to make airline work
set laststatus=2

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

" Set list of enabled airline extensions
"let g:airline_extensions = []
let g:airline_theme='clear_dim'

autocmd BufEnter * set mouse=

let s:saved_theme = []

" Make terminal in vim follow main airlin theme
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    for colors in values(a:palette)
        if has_key(colors, 'airline_c') && len(s:saved_theme) ==# 0
            let s:saved_theme = colors.airline_c
        endif
        if has_key(colors, 'airline_term')
            let colors.airline_term = s:saved_theme
        endif
    endfor
endfunction

nnoremap <C-^I> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
