set encoding=UTF-8
set fileencoding=utf-8
if has('termguicolors')
  set termguicolors
endif

let g:tokyonight_style="night"
let g:tokyonight_hide_inactive_statusline=1
let g:tokyonight_transparent_sidebar=1
let g:tokyonight_lualine_bold=1
let g:tokyonight_transparent=1
let g:tokyonight_italic_comments=1
let g:tokyonight_italic_functions = 1    
let g:tokyonight_terminal_colors=1
let g:tokyonight_lualine_bold=1
let g:tokyonight_italic_variables=1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi LineNr guifg=#5081c0 
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi Comment guifg=#5081c0 gui=italic
        \ | hi Function gui=bold,italic
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi AleWarningLine gui=undercurl,bold,italic guifg=orange
        \ | hi TSKeyword gui=bold,italic
        \ | hi DashboardHeader guifg=#fe8019
augroup END

augroup MyFloat
	autocmd!
	autocmd ColorScheme * hi NormalFloat guifg=#5081c0 gui=italic,bold
augroup END

set background=dark
colorscheme gruvbox

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
set undodir=/home/armando/.config/nvim/undo
set signcolumn=yes
set smartcase

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
" let g:ale_sign_style_error = ''
" let g:ale_sign_style_warning = ''

" Make sure coc-eslint and coc-pretty are uninstalled
" golangci-lint is fairly aggressive
" golint is deprecated, it was suggest by golanci-lint to use revive
let g:ale_linters={
      \ 'javascript': ['prettier', 'eslint'],
      \ 'go': ['gofmt', 'revive'] 
      \}
let g:ale_go_golangci_lint_executable = 'golangci-lint'
let g:ale_go_golangci_lint_options = '' " don't use the default
" let g:ale_go_golangci_lint_options = '--enable-all' enable all linters

" Must have fixers installed, globally for golang, locally for javascript
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'go': ['gofmt', 'goimports'],
      \}

" Looks like ale fixers fixes this if I include goimports
" autocmd! BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd! BufEnter *.hbs :set ft=html
" CocDiagnostics filetype is qf and I want to close it
autocmd! FileType qf nnoremap <silent> <buffer> <Esc> :q<CR>
