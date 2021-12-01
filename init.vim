source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/keybindings.vim

" For dark version.
set background=dark
colorscheme gruvbox
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

lua require('core/nvimtree')
lua require('core/telescope')
lua require('core/treesitter')
