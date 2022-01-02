set encoding=UTF-8
set fileencoding=utf-8
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark
colorscheme gruvbox
" Transparent background
hi Normal guibg=NONE ctermbg=NONE
 
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '▎'
" let g:gitgutter_sign_removed = '契'
" let g:gitgutter_sign_removed_first_line = '契'
set number relativenumber
set hlsearch
set cursorline
set autochdir
set ignorecase
set lazyredraw
set mouse=a
set pumheight=10
set clipboard=unnamedplus
set smartindent
" for some odd reason, this only works in kitty 🤔, doesn't work for gnome
" terminal and alacritty
" set noscrollbind
" set nocursorbind
set noswapfile
set scrolloff=8
set sidescrolloff=8
set expandtab
set tabstop=2
set shiftwidth=2
" set splitbelow
" for whichkey
set timeoutlen=500
"set title
set splitright
set nowrap
set numberwidth=4
" be wary of undofile, I don't want colliding undodirectory with lvim
set undofile
set undodir=/home/armando/.config/nvim/undo
set signcolumn=yes:1
set smartcase

" Some stuff to have to make sure that vim-go plays nice with coc-go
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled=0
let g:go_gopls_enabled = 0
let g:go_echo_go_info = 0
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1

"Ale
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_set_highlights=0
let g:ale_set_loclist=0
let g:ale_cursor_detail=0
let g:ale_set_signs=1
let g:ale_virtualtext_cursor=0
let g:ale_change_sign_column_color=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_vertical=1
" let g:ale_linters=[]

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufEnter * silent! lcd %:p:h

" Some reason, setlocal overrides our global setting of scrolloff
" From documentation about setlocal: Like ":set" but set only the value local to the current buffer or window.
" augroup _dashboard
"   autocmd! Filetype dashboard setlocal scrolloff=0 sidescrolloff=0
"   " autocmd! Filetype dashboard setlocal sidescrolloff=0
"   " autocmd! FileType *.go setlocal scrolloff=8
" augroup END

" Vertical split help
" autocmd FileType help wincmd L
" nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
