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
colorscheme onedark

" snippet config
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" youcompleteme configuration
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" airline configuration
let g:airline#extensions#tabline#enabled = 1

" nerdcommenter configuration
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" custom mappings
nnoremap <C-Z> :bnext<CR>
nnoremap <C-X> :bprev<CR>
nnoremap <C-S-t> :tabprevious<CR>
nnoremap <C-t>   :tabnext<CR>
