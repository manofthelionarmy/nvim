source ~/.config/nvim/plugins.vim
" source ~/.config/nvim/colorscheme.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/keybindings.vim

lua require('core/nvimtree')
lua require('core/projects')
lua require('core/telescope')
lua require('core/treesitter')
lua require('core/autotag')
lua require('core/lualine')
" lua require('core/symbolsoutline')
lua require('core/dashboard')
lua require('core/whichkey')
lua require('core/icons')
" lua require('core/symbolsoutline')
lua require('core/dap')
lua require('core/dap-ui')
lua require('core/dap-virtual-text')
