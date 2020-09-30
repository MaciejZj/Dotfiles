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

" Connect system clipboard and unnamed register
set clipboard=unnamed

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
" Set LSP specific bindings and call them if LSP is enabled
function! s:on_lsp_buffer_enabled() abort
    setlocal tagfunc=lsp#tagfunc 
    nnoremap <Leader>ldc <plug>(lsp-declaration)
    nnoremap <Leader>ldf <plug>(lsp-definition)
    nnoremap <Leader>lg <plug>(Lsp-document-diagnostics)
    nnoremap <Leader>lf <plug>(lsp-document-format)
    nnoremap <Leader>lrf <plug>(lsp-document-range-format)
    nnoremap <Leader>ls <plug>(lsp-document-symbol)
    nnoremap <Leader>lh <plug>(lsp-hover)
    nnoremap <Leader>lpdc <plug>(lsp-peek-declaration)
    nnoremap <Leader>lpdf <plug>(lsp-peek-definition)
    nnoremap <Leader>lrf <plug>(lsp-references)
    nnoremap <Leader>lrr <plug>(lsp-rename)
endfunction
augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" Disable gutteer signs for LSP diagnostics
let g:lsp_signs_enabled=0 

" Colorscheme
colorscheme dim
" Colorscheme fixes
" Underline matching parens instead of highlighting
highlight MatchParen cterm=underline ctermbg=none

" Make gitgutter signs have matching backgrounds
let g:gitgutter_set_sign_backgrounds=1

" Fzf bindings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fc :Commands<CR>
