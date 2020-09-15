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
" Don't show current mode
set noshowmode

" Text formatting
" Set tab len to four
set tabstop=4
set shiftwidth=4
" Indentation
filetype plugin indent on
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

" Highlight character exceeding 80 columns
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v\S', 100)

" Enable hybrid line numbers
:set number relativenumber
" Relative numbering only in active buffer
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Plug plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' " Rather dont't need
Plug 'liuchengxu/vista.vim' " Dunno if I need this, ok i think I need
Plug 'frazrepo/vim-rainbow' " Maybe substitute with sth simpler
Plug 'maciejzj/vim-theme' " Clean up
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth' " Rather will stay
Plug 'vim-airline/vim-airline' " Remove, I can do my own thing
Plug 'vim-airline/vim-airline-themes' " Remove
Plug 'wincent/terminus' " Replace this with lightwieght
Plug 'mattn/vim-lsp-settings' " Maybe remove one day

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

" Rainbow parentheses plugin
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['green', 'yellow', 'cyan', 'magenta', 'blue', 'red']

" Disable whitespace errors highlighting in polyglot
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" Fuzzy comand finder space shortcut
nnoremap <space> :Commands<cr>

" Autocompletion and lsp
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" LSP and Vista config
let g:lsp_diagnostics_enabled = 0
let g:vista_executive_for = {
      \ 'cpp': 'vim_lsp',
      \ 'python': 'vim_lsp',
      \ }
let g:vista_ignore_kinds = ['Variable']
let g:airline#extensions#vista#enabled = '0'

" Disable some terminus features and mouse support
let g:TerminusMouse = 0
let g:TerminusFocusReporting = 0
let g:TerminusBracketedPaste = 0
set mouse=

" Disable file explorer banner
let g:netrw_banner = 0
" Start netrw with default hide list
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
" Set netrw to use normal cursor
let g:netrw_cursor = 0
