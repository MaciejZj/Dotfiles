" Indentation
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
filetype plugin indent on

" Interface
" Display cursor position in file
set ruler
" Show partial commands typed in normal mode
set showcmd
" Display line number
set number
" Display relative line numbers
set relativenumber
" Show completion menu in command mode
set wildmenu
" Cleaner border in splitview
set fillchars+=vert:\│
" Default split direction
set splitbelow
set splitright

" Colors
" Enable syntax highlighting
syntax on
" Highlight search results
set hlsearch
" Highlight searching while typing
set incsearch

" Be case insensitive for small caps, sensitive otherwise
set ignorecase
set smartcase

" Connect system clipboard and unnamed register
if has('macunix')
   set clipboard=unnamed
else
   set clipboard=unnamedplus
endif

" Keys behaviour
set backspace=indent,eol,start

" More frequent updatetime, makes gutter updates more instant
set updatetime=100

" Set space as leader
let mapleader="\<Space>"

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'maciejzj/vim-theme'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'

call plug#end()

" Plugins configuration

" Built in plugins

" Netrw
" Disable explorer banner
let g:netrw_banner=0
" Start netrw with default hide list explicitly enabled
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'
" Set netrw to use normal cursor
let g:netrw_cursor=0

" External plugins

" LSPs " Register Python server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif
" Register Clang server
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clabgd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
" Register Latex server
if executable('texlab')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'texlab',
      \ 'cmd': {server_info->['texlab']},
      \ 'whitelist': ['tex', 'bib', 'sty'],
      \ })
endif
" Enable tab completion navigation
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" Set LSP specific bindings and call them if LSP is enabled
function! s:on_lsp_buffer_enabled() abort
    setlocal tagfunc=lsp#tagfunc 
    nnoremap <Leader>ldc :LspDeclaration<CR>
    nnoremap <Leader>ldf :LspDefinition<CR>
    nnoremap <Leader>lg :LspDocumentDiagnostics<CR>
    nnoremap <Leader>lf :LspDocumentFormat<CR>
    nnoremap <Leader>lrf :LspDocumentRangeFormat<CR>
    nnoremap <Leader>ls :LspDocumentSymbol<CR>
    nnoremap <Leader>lh :LspHover<CR>
    nnoremap <Leader>lpdc :LspPeekDeclaration<CR>
    nnoremap <Leader>lpdf :LspPeekDefinition<CR>
    nnoremap <Leader>lrf :LspReferences<CR>
    nnoremap <Leader>lrr :LspRename<CR>
endfunction
augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" Disable gutteer signs for LSP diagnostics
let g:lsp_signs_enabled=0
" Make LSP reference highlight work as underline
highlight lspReference cterm=underline

" Fzf bindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fc :Commands<CR>

" Other bindings
nnoremap <Leader>n :nohlsearch<CR>

" Make gitgutter signs have matching backgrounds
let g:gitgutter_set_sign_backgrounds=1

" Colorscheme
colorscheme dim

" Fix invisible fzf border
let g:fzf_colors = { 'border':  ['fg', 'Ignore'], }
