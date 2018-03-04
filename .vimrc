
" pathogen config
execute pathogen#infect()

" editor config
syntax on
filetype plugin indent on
set number
set foldmethod=syntax
set foldlevelstart=1
let javaScript_fold=1

" tab stops
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>
set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

" disable conceal
set conceallevel=0

" white space, returns
set list
set listchars=space:·,eol:§,tab:¤›,extends:»,precedes:«,nbsp:‡
let g:indentLine_char = '|'
let g:indentLine_setConceal = 0

" theme
set termguicolors
colorscheme onedark

" snippet config
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


" airline configuration
let g:airline#extensions#tabline#enabled = 1

" custom mappings
nnoremap <C-N> :bnext<CR>
nnoremap <C-B> :bprev<CR>
