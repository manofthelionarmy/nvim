set encoding=utf-8
set fileencoding=utf-8
if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme tokyonight

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

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
set noscrollbind
set nocursorbind
set noswapfile
set scrolloff=8
set sidescrolloff=8
set expandtab
set tabstop=2
set shiftwidth=2
" for whichkey
set timeoutlen=500
set splitright
set nowrap
set numberwidth=4
" be wary of undofile, I don't want colliding undodirectory with lvim
set undofile
set undodir=$HOME/.config/nvim/undo
set signcolumn=yes
set smartcase
set nolinebreak
set noshowmode
set incsearch

" Some stuff to have to make sure that vim-go plays nice with coc-go
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled=0
let g:go_gopls_enabled = 0
let g:go_echo_go_info = 0
let g:go_imports_autosave = 0
let g:go_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0

"Ale
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_set_highlights=0

" https://freshman.tech/vim-quickfix-and-location-list/
" This will update the quickfix list, both ale and coc-diagnostics share this
let g:ale_set_quickfix = 1 " has all of the global errors, :copen, :cclose

" only ale will have this populated, coc populates quickfix with diagnostics
let g:ale_set_loclist=1 " has all of the local errors :lopen, :lclose
let g:ale_cursor_detail=0
let g:ale_set_signs=1
let g:ale_virtualtext_cursor=1
let g:ale_change_sign_column_color=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_vertical=1
let g:ale_sign_info = ''
let g:ale_fix_on_save=1 "Let ale do the work for autoformatting, not coc

" Make sure coc-eslint and coc-pretty are uninstalled
" golangci-lint is fairly aggressive
" golint is deprecated, it was suggest by golanci-lint to use revive
" TODO: get protobuf linter
let g:ale_linters={
      \ 'javascript': ['prettier', 'eslint'],
      \ 'go': ['gopls', 'revive', 'gofmt', 'golint'],
      \}
let g:ale_go_golangci_lint_executable = 'golangci-lint'
let g:ale_go_golangci_lint_options = '' " don't use the default

" Must have fixers installed, globally for golang, locally for javascript
" TODO: setup protobuf fixer
let g:ale_fixers = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'go': ['gofmt', 'goimports','remove_trailing_lines'],
      \ 'sql': ['pgformatter']
      \}
let g:ale_java_checkstyle_config="/home/armando/.config/checkstyle/google_checks.xml"

" Looks like ale fixers fixes this if I include goimports
" autocmd! BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd! BufEnter *.hbs :set ft=html

" CocDiagnostics filetype is qf and I want to close it
autocmd! FileType qf nnoremap <silent> <buffer> <Esc> :q<CR>
augroup Dashboard
  autocmd!
  au FileType dashboard set showtabline=0 | setlocal scrolloff=0 |
        \ autocmd WinLeave <buffer> set showtabline=2 |
        \ autocmd WinLeave <buffer> setlocal scrolloff=-1
augroup END
