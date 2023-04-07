-- vim.cmd[[source ~/.config/nvim/lua/core/nvimtree.vim]]
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    print("not okay")
    return
else
  nvim_tree.setup{
    disable_netrw       = true,
    hijack_netrw        = false,
    -- open_on_setup       = false,
    -- ignore_ft_on_setup  = {
    --   "startify",
    --   "dashboard",
    --   "alpha", -- another dashboard package
    -- },
    auto_reload_on_write = false,
    hijack_directories = {
      enable = false,
    },
    open_on_tab         = false,
    -- hijack_cursor       = true,
    update_cwd          = true,
    -- update_to_buf_dir   = {
    --   enable = true,
    --   auto_open = true,
    -- },
    diagnostics = {
      enable = true, -- neat, it works with nvim-lsp and coc :)
      show_on_dirs = false,
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
      ignore_list = { "^\\.git$", "node_modules$", "^\\.cache$", "vendor$" }
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {"node_modules", "^\\.git$", "^\\.cache$", "vendor$"}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      -- height = 30,
      hide_root_folder = false,
      side = 'left',
      -- auto_resize = true,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    },
    renderer = {
      -- indent_markers = {
      --   enable = false,
      --   icons = {
      --     corner = "└",
      --     edge = "│",
      --     item = "│",
      --     none = " ",
      --   },
      -- },
      icons = {
        webdev_colors = true,
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
        glyphs = {
          default = '',
          symlink = '',
          git = {
            deleted = "",
            ignored = "◌",
            renamed = "➜",
            staged = "S",
            unmerged = "",
            unstaged = "",
            untracked = "U",
          },
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
        },
      },
      highlight_git = true,
      group_empty = false,
      root_folder_modifier = ":t",
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  }
end
