vim.cmd[[source ~/.config/nvim/lua/core/nvimtree.vim]]
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    print("not okay")
    return
else
  nvim_tree.setup{
    disable_netrw       = true,
    hijack_netrw        = false,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = true,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true, -- neat, it works with nvim-lsp and coc :)
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = { ".git", "node_modules", ".cache", "vendor" }
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = true,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
  }
end
