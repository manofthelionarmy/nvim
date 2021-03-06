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
Plug 'dense-analysis/ale'
" Go 
Plug 'fatih/vim-go' , {'do': ':GoUpdateBinaries', 'for': ['go', 'go.mod'], 'tag': 'v1.25'}

" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Color schemes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'ellisonleao/gruvbox.nvim' " double check, the color scheme is too bright
"
" -- Etc
" I can always reinstall this if I ever find the use for it
" Plug 'mattn/emmet-vim', {'for': ['js', 'markdown']}
" Find another one for auto pairing?
Plug 'jiangmiao/auto-pairs'

" Live reload of html
Plug 'turbio/bracey.vim', {'for': ['javascript', 'markdown', 'html', 'css'], 'do': 'npm install --prefix server'}

" Git in vim
Plug 'airblade/vim-gitgutter'

Plug 'RRethy/vim-hexokinase', {'for': ['markdown', 'html', 'css'], 'do': 'make hexokinase'}
" Lua Plugins:
Plug 'kyazdani42/nvim-web-devicons', {'commit': '8df4988ecf8599fc1f8f387bbf2eae790e4c5ffb'}
Plug 'kyazdani42/nvim-tree.lua', {'commit': '65b8b19c8bcea36e37474338c7e2d2fea95553d3'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}  " We recommend updating the parsers on update
Plug 'windwp/nvim-ts-autotag', {'for': ['javascript', 'html', 'markdown']}
Plug 'nvim-lua/plenary.nvim', {'commit': '1c31adb35fcebe921f65e5c6ff6d5481fa5fa5ac'}
Plug 'nvim-lualine/lualine.nvim', {'commit': '1ae4f0aa74f0b34222c5ef3281b34602a76b2b00'}
" Telescope
" This commit is before they migrated to neovim 0.5.1
Plug 'nvim-telescope/telescope.nvim' ", {'commit': '0caec3d6e4d3c3c71339eb18a9aae7ed0f24badc'}
Plug 'ahmedkhalf/project.nvim'
" I don't understand what this plugin does
" Plug 'nvim-telescope/telescope-fzy-nateeive.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'p00f/nvim-ts-rainbow', {'commit': '54ee09f540935c604c9a3d4aed83b7f5314f2caa'}
" I have coc-outline, remove this plugin?
Plug 'simrat39/symbols-outline.nvim', {'commit': 'dcab987e431266c4ec9e2e0e81c1e62929c0bd44', 'on':[]}
Plug 'romgrk/barbar.nvim', {'commit': '6e638309efcad2f308eb9c5eaccf6f62b794bbab'}
Plug 'airblade/vim-rooter'
Plug 'glepnir/dashboard-nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'liuchengxu/vim-which-key'
" slow, could be faster if we specify our keybindings whichkey.lua
" TODO: slowly migrate over keybindings from keymappings.vim
Plug 'folke/which-key.nvim' 
" Look at nvim-dap for example configs and  'Pocco81/DAPInstall.nvim' too
Plug 'mfussenegger/nvim-dap', {'for': ['javascript']}
Plug 'rcarriga/nvim-dap-ui', {'for': ['javascript']}
call plug#end()
