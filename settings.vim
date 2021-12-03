" set encoding=UTF-8
set fileencoding=utf-8
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark
colorscheme gruvbox
" Transparent background
hi Normal guibg=NONE ctermbg=NONE
 
" Dev icons
let g:airline_powerline_fonts = 1
let g:airline_theme='alduin'
set number relativenumber
set hlsearch
set cursorline
set autochdir
"set ignorecase
set lazyredraw
set mouse=a
set pumheight=10
set clipboard=unnamedplus
set smartindent
set scrolloff=8
set sidescrolloff=8
set expandtab
set tabstop=2
set shiftwidth=2
set splitbelow
"set timeoutlen=100
"set title
set splitright
set nowrap
set numberwidth=4
" be wary of undofile, I don't want colliding undodirectory with lvim
set undofile
set undodir=/home/armando/.config/nvim/undo
set signcolumn=yes:1
set smartcase
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_stl_path_style = 'short'

" Some stuff to have to make sure that vim-go plays nice with coc-go
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled=0
let g:go_gopls_enabled = 1
let g:go_echo_go_info = 0
let g:go_imports_autosave = 0
let g:go_fmt_autosave = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Tabstops per file type
" tabstop is for tabs, shiftwidth is, i.e., when you hit enter and want to
" ceate a new line, and the cursor will travel to the shiftwidth
" Utils Snips is needed for our reacts snippets, and this prevents
" UltiSnippets from screwing with our tab completion in coc
let g:UltiSnipsExpandTrigger= "<nop>"
