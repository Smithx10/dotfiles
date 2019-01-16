
" pathogen config bob rawr
execute pathogen#infect()
set maxmempattern=3000
" editor config
syntax on
filetype plugin indent on
set number
set foldmethod=syntax
set foldlevelstart=50
let javaScript_fold=50

" Yaml
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab"

" vim-signify
let g:signify_vcs_list = [ 'git' ]

" tab stops
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=2   "Indent by 4 spaces when pressing <TAB>
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
set t_Co=256
colorscheme gruvbox
set background=dark
let g:one_allow_italics = 1

" snippet config
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'


" airline configuration
let g:airline#extensions#tabline#enabled = 1

" Java 
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0

" Shell 
let g:shfmt_extra_args = '-i 2'

" Go
"gofmt
let g:go_fmt_command = "goimports"
autocmd FileType go noremap <C-X> :GoDef<CR>
autocmd Filetype go noremap <C-E> :GoImports<CR>

"prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'
" typescript
autocmd Filetype typescript noremap <C-X> :TSDefPreview<CR>
autocmd Filetype typescript noremap <C-E> :PrettierAsync<CR>
let g:nvim_typescript#javascript_support = 1

" javascript
autocmd Filetype javascript noremap <C-X> :TSDefPreview<CR>
autocmd Filetype javascript noremap <C-E> :PrettierAsync<CR>

au BufRead,BufNewFile *.yaml.ctmpl,*yml.ctmpl set filetype=yaml

" Multiple_cursors
function Multiple_cursors_before()
  let s:old_ycm_whitelist = g:ycm_filetype_whitelist
  let g:ycm_filetype_whitelist = {}
endfunction

function Multiple_cursors_after()
  let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endfunction


" Global
noremap <C-M> :bnext!<CR>
noremap <C-N> :bprev!<CR>
noremap <C-L> :update<CR>
noremap <C-H> :noh<CR>
noremap <C-Q> :bdelete!<CR>
noremap <C-\> :pc<CR>
noremap <C-E> :FormatCode<CR>
noremap <C-P> :Files<CR>
nmap <C-f> ysiw
nmap <C-g> ds

