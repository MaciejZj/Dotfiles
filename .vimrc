" General settings
" Line numbers
set number
" Use system clipboard
set clipboard=unnamed
" Set shell to zsh
set shell=/bin/zsh	
" Force vim to use 16 ANSI colors
set t_Co=16
" Default split direction
set splitbelow
set splitright
" Hide buffers istead of closing
set hidden
" Highlight searching
set hlsearch
" Highlight searching while typing
set incsearch

" Text formatting
" Set tab len to four
set tabstop=4
set shiftwidth=4
filetype plugin indent on
" Indentation
set autoindent
set smartindent
set smarttab
" Enable syntax highlighting
syntax on
" Make backspace work like most other programs
set backspace=2
" Command line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Nicer border in splitview
set fillchars+=vert:\ 
" Don't align goto tags in C like languages
set cinoptions+=L0

" Use [[ and ]] with 'inline' braces
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] $][%?}<CR>

call plug#begin('~/.vim/plugged')

Plug 'wincent/terminus'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
Plug 'chaoren/vim-wordmotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'MaciejZj/vim-dim'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'liuchengxu/vista.vim'

call plug#end()

" Enable default colorscheme in ANSI colors mode
colorscheme dim
" Airline bar theme
let g:airline_theme='clear_dim'
" Make terminal in vim follow main airline theme
let s:saved_theme = []
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

" Ensure gitguter has proper colors
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight SignColumn ctermbg=0

" Enable gitguter realtime upadating
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

" Rainbow parentheses plugin let g:rainbow_active = 1
let g:rainbow_conf = {
\	'ctermfgs': ['green', 'yellow', 'cyan', 'magenta', 'red'],
\}

" Disable whitespace errors highlighting in polyglot
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" Fuzzy comand finder space shortcut 
nnoremap <space> :Commands<cr> 

" Autocompletion and lsp
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:vista_executive_for = {
	\ 'cpp': 'vim_lsp',
	\ 'python': 'vim_lsp',
	\ }
let g:lsp_diagnostics_enabled = 0
let g:vista_ignore_kinds = ['Variable']


" Enformce tab length for sleuth plugin
set tabstop=4

" Disable some terminus features and mouse support
let g:TerminusMouse = 0
let g:TerminusFocusReporting = 0
let g:TerminusBracketedPaste = 0
set mouse=

let g:netrw_banner = 0
