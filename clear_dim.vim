" Colors
let s:black = ['0', '#ffffff']
let s:blackb = ['8', '#ffffff']
let s:red = ['1', '#ffffff']
let s:redb = ['9', '#ffffff']
let s:green = ['2', '#ffffff']
let s:greenb = ['10', '#ffffff']
let s:yellow = ['3', '#ffffff']
let s:yellowb = ['11', '#ffffff']
let s:blue = ['4', '#ffffff']
let s:blueb = ['12', '#ffffff']
let s:magenta = ['5', '#ffffff']
let s:magentab = ['13', '#ffffff']
let s:cyan = ['6', '#ffffff']
let s:cyanb = ['14', '#ffffff']
let s:white = ['7', '#ffffff']

" Normal mode
let s:N1 = [s:green[1], s:black[1], s:green[0], s:black[0]]
let s:N3 = [s:white[1], s:black[1], s:white[0], s:black[0]]

" Normal mode - modified
let s:NM1 = [s:black[1], s:green[1], s:black[0], s:green[0]]
let s:NM3 = [s:green[1], s:black[1], s:green[0], s:black[0]]

" Insert mode
let s:I1 = [s:black[1], s:blueb[1], s:black[0], s:blueb[0]]
let s:I3 = [s:blueb[1], s:black[1], s:blueb[0], s:black[0]]

" Visual mode
let s:V1 = [s:black[1], s:magentab[1], s:black[0], s:magentab[0]]
let s:V3 = [s:magentab[1], s:black[1], s:magentab[0], s:black[0]]

" Replace mode
let s:R1 = [s:black[1], s:red[1], s:black[0], s:red[0]]
let s:R3 = [s:red[1], s:black[1], s:red[0], s:black[0]]

" Inactive pane
let s:IA = [s:black[1], s:white[1], s:white[0], s:black[0]]
let s:IAc = [s:white[1], s:black[1], s:white[0], s:black[0]]

let g:airline#themes#clear_dim#palette = {}
let g:airline#themes#clear_dim#palette.accents = {
    \ 'red': ['#ffffff', '', 1, '', '']}

let g:airline#themes#clear_dim#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IAc,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#clear_dim#palette.inactive_modified = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:NM3,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#clear_dim#palette.normal = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:N3}

let g:airline#themes#clear_dim#palette.airline_term = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:N3}

let g:airline#themes#clear_dim#palette.normal_modified = {
    \ 'airline_a': s:NM1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:NM3}

let g:airline#themes#clear_dim#palette.insert = {
    \ 'airline_a': s:I1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:I3}
let g:airline#themes#clear_dim#palette.insert_modified = {}

let g:airline#themes#clear_dim#palette.replace = {
    \ 'airline_a': s:R1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:R3}
let g:airline#themes#clear_dim#palette.replace_modified = {}

let g:airline#themes#clear_dim#palette.visual_modified = {}

let g:airline#themes#clear_dim#palette.normal.airline_warning = s:NM1

let g:airline#themes#clear_dim#palette.normal_modified.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.insert.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.insert_modified.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.visual.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.visual_modified.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.replace.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

let g:airline#themes#clear_dim#palette.replace_modified.airline_warning =
    \ g:airline#themes#clear_dim#palette.normal.airline_warning

