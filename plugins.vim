set nocompatible
" let g:ale_disable_lsp = 1 
call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'
" Git Plugin for Vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
" AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Go 
Plug 'fatih/vim-go' ", {'do': ':GoUpdateBinaries', 'for': 'go', 'tag': 'v1.25'}
" Javascript
Plug 'honza/vim-snippets', {'for': 'js'}
Plug 'SirVer/ultisnips', {'for': 'js'}
" Doesn't support lazy loading for some reason
"Plug 'mlaursen/vim-react-snippets', {'for': 'js'}
"Plug 'yuezk/vim-js', {'for': 'js'} "May not need because of vim-polyglot
" doesn't support lazy loading for some reason
"Plug 'maxmellon/vim-jsx-pretty', {'for': 'js'}
" NerdTree and Plugins (Keep if I ever want to switch over again)
" Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin' "Git plugin for NerdTree
" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Color schemes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'morhetz/gruvbox'
" Appearance
" TODO: migrate to bufferline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons' "also used by NerdTree
" -- Etc
Plug 'alvan/vim-closetag', {'for': ['js', 'markdown']}
Plug 'mattn/emmet-vim', {'for': ['js', 'markdown']}
" Find another one for auto pairing?
Plug 'jiangmiao/auto-pairs'

Plug 'turbio/bracey.vim', {'for': ['js', 'markdown', 'html', 'css']} 

" Move to tree sitter
Plug 'turbio/bracey.vim', {'for': ['js', 'markdown', 'html', 'css'], 'do': 'npm install --prefix server'}
Plug 'RRethy/vim-hexokinase', {'for': ['js', 'markdown', 'html', 'css'], 'do': 'make hexokinase'}
Plug 'airblade/vim-gitgutter'
" Telescope
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua', {'commit': 'e842f088847c98da59e14eb543bde11c45c87ef7'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
" This commit is before they migrated to neovim 0.5.1
Plug 'nvim-telescope/telescope.nvim', {'commit': '0caec3d6e4d3c3c71339eb18a9aae7ed0f24badc'}

Plug 'p00f/nvim-ts-rainbow'
Plug 'simrat39/symbols-outline.nvim'
Plug 'romgrk/barbar.nvim'
call plug#end()
