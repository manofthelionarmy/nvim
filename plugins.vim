set nocompatible
" Documentation said to set this value before loading plugins
let g:ale_disable_lsp = 1
call plug#begin("~/.config/nvim/plugged")
" Plugin Manager
Plug 'junegunn/vim-plug'
" Git Plugin for Vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" Default settings
Plug 'tpope/vim-sensible'
" AutoCompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale', {'tag': 'v3.3.0'}
" Go 
Plug 'fatih/vim-go' , {'do': ':GoUpdateBinaries', 'for': ['go', 'go.mod', 'tmpl', 'gohtml'], 'tag': 'v1.28'}

" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Color schemes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Mofiqul/dracula.nvim', {'branch': 'main'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin', 'tag': 'v1.4.0'  }
Plug 'sainnhe/everforest', {'tag': 'v0.3.0'}
" Plug 'ellisonleao/gruvbox.nvim' " double check, the color scheme is too bright
Plug 'navarasu/onedark.nvim'
" -- Etc
" I can always reinstall this if I ever find the use for it
" Coc-emmet for the win
" Plug 'mattn/emmet-vim', {'for': ['html']}
" Find another one for auto pairing?
Plug 'jiangmiao/auto-pairs'

" Live reload of html
Plug 'turbio/bracey.vim', {'for': ['javascript', 'markdown', 'html', 'css'], 'do': 'npm install --prefix server'}

" Git in vim
Plug 'airblade/vim-gitgutter'

Plug 'RRethy/vim-hexokinase', {'for': ['markdown', 'html', 'css'], 'do': 'make hexokinase'}
" Lua Plugins:
Plug 'kyazdani42/nvim-web-devicons', {'tag': 'nerd-v2-compat'}
Plug 'kyazdani42/nvim-tree.lua', {'commit': 'd1410cb0896a3aad5d84ddc54284774a627c6d63'}
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'tag': 'v0.9.1'}  " We recommend updating the parsers on update
Plug 'windwp/nvim-ts-autotag', {'for': ['javascript', 'html', 'markdown']}
" Plug 'nvim-lua/plenary.nvim', {'commit': '1c31adb35fcebe921f65e5c6ff6d5481fa5fa5ac'}
Plug 'nvim-lua/plenary.nvim', {'tag': 'v0.1.3'}
" Plug 'nvim-lualine/lualine.nvim', {'commit': '1ae4f0aa74f0b34222c5ef3281b34602a76b2b00'}
Plug 'nvim-lualine/lualine.nvim'
" Telescope
" This commit is before they migrated to neovim 0.5.1
" Plug 'nvim-telescope/telescope.nvim' ", {'commit': '4449f709c36503e65e40d9e61bf742ef861c7269'}
" Telescope finally has a stable version
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.3'}
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'ahmedkhalf/project.nvim'
" I don't understand what this plugin does
" Plug 'nvim-telescope/telescope-fzy-nateeive.nvim'
" Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Plug 'p00f/nvim-ts-rainbow', {'commit': '54ee09f540935c604c9a3d4aed83b7f5314f2caa'}
" No longer maintained, the project has been archived
" Plug 'p00f/nvim-ts-rainbow', {'commit': 'fad8badcd9baa4deb2cf2a5376ab412a1ba41797'}
Plug 'HiPhish/nvim-ts-rainbow2', {'tag': 'v2.3.0' }
" I have coc-outline, remove this plugin?
" Plug 'simrat39/symbols-outline.nvim'
" Plug 'romgrk/barbar.nvim', {'commit': '6e638309efcad2f308eb9c5eaccf6f62b794bbab'}
Plug 'romgrk/barbar.nvim', {'tag': 'v1.5.0'}
Plug 'airblade/vim-rooter'
" Recent master has changed the way we configure this again
" Plug 'glepnir/dashboard-nvim', {'commit': '115b9f9cec10e31aff39c077bf5a4881bc840916'}
Plug 'nvimdev/dashboard-nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'liuchengxu/vim-which-key'
" slow, could be faster if we specify our keybindings whichkey.lua
" TODO: slowly migrate over keybindings from keymappings.vim
Plug 'folke/which-key.nvim' 
" Look at nvim-dap for example configs and  'Pocco81/DAPInstall.nvim' too
Plug 'mfussenegger/nvim-dap', {'tag': '0.6.0'}
" Plug 'rcarriga/nvim-dap-ui', {'tag': 'v3.8.0'}
Plug 'rcarriga/nvim-dap-ui', {'commit': '286f682f366fbc652b38dff893569374e9433dd3'}
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'honza/vim-snippets', {'for': ['html']}
" Plug 'leoluz/nvim-dap-go'
" Plug 'manofthelionarmy/nvim-dap-go', {'branch': 'experiment/go-headless-adapter'}
Plug 'manofthelionarmy/nvim-dap-go', {'dir': '~/opensource/nvim-dap-go'}
Plug 'stevearc/dressing.nvim'
Plug 'folke/todo-comments.nvim', {'tag': 'v1.1.0'}
call plug#end()
