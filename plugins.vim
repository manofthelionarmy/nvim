set nocompatible
" Documentation said to set this value before loading plugins
let g:ale_disable_lsp = 1
call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'
" Git Plugin for Vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" Default settings
Plug 'tpope/vim-sensible'
" AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
" Go 
Plug 'fatih/vim-go' , {'do': ':GoUpdateBinaries', 'for': 'go', 'tag': 'v1.25'}

" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Color schemes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'morhetz/gruvbox'
" -- Etc
Plug 'alvan/vim-closetag', {'for': ['js', 'markdown']}
Plug 'mattn/emmet-vim', {'for': ['js', 'markdown']}
" Find another one for auto pairing?
Plug 'jiangmiao/auto-pairs'

" Live reload of html
Plug 'turbio/bracey.vim', {'for': ['js', 'markdown', 'html', 'css']} 

" Git in vim
Plug 'airblade/vim-gitgutter'

" Move to tree sitter
Plug 'turbio/bracey.vim', {'for': ['js', 'markdown', 'html', 'css'], 'do': 'npm install --prefix server'}
Plug 'RRethy/vim-hexokinase', {'for': ['js', 'markdown', 'html', 'css'], 'do': 'make hexokinase'}
" Lua Plugins:
" Telescope
Plug 'kyazdani42/nvim-web-devicons', {'commit': '8df4988ecf8599fc1f8f387bbf2eae790e4c5ffb'}
Plug 'kyazdani42/nvim-tree.lua', {'commit': 'e842f088847c98da59e14eb543bde11c45c87ef7'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim', {'commit': '1c31adb35fcebe921f65e5c6ff6d5481fa5fa5ac'}
Plug 'nvim-lualine/lualine.nvim', {'commit': '1ae4f0aa74f0b34222c5ef3281b34602a76b2b00'}
" This commit is before they migrated to neovim 0.5.1
Plug 'nvim-telescope/telescope.nvim', {'commit': '0caec3d6e4d3c3c71339eb18a9aae7ed0f24badc'}
Plug 'ahmedkhalf/project.nvim'

Plug 'p00f/nvim-ts-rainbow', {'commit': '54ee09f540935c604c9a3d4aed83b7f5314f2caa'}
Plug 'simrat39/symbols-outline.nvim', {'commit': 'dcab987e431266c4ec9e2e0e81c1e62929c0bd44', 'on':[]}
Plug 'romgrk/barbar.nvim', {'commit': '6e638309efcad2f308eb9c5eaccf6f62b794bbab'}
Plug 'airblade/vim-rooter'
" TODO: get which key plugin and terminal, maybe get telescope projects?
Plug 'glepnir/dashboard-nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()
