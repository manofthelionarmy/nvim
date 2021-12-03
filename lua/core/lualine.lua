local window_width_limit = 80
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
}
  -- check_git_workspace = function()
  --   local filepath = vim.fn.expand "%:p:h"
  --   local gitdir = vim.fn.finddir(".git", filepath .. ";")
  --   return gitdir and #gitdir > 0 and #gitdir < #filepath
  -- end,

-- local function diff_source()
--   need the gitsigns plugin
--   local gitsigns = vim.b.gitsigns_status_dict
--   if gitsigns then
--     return {
--       added = gitsigns.added,
--       modified = gitsigns.changed,
--       removed = gitsigns.removed,
--     }
--   end
-- end

local diff = {
  'diff',
  source = 'coc',
  symbols = { added = "  ", modified = "柳", removed = " " },
  color = {},
  condition = nil,
}

local treesitter = {
  function()
    if next(vim.treesitter.highlighter.active) then
      return "  "
    end
    return ""
  end,
  color = { fg = "#98be65" },
  condition = conditions.hide_in_width,
}

-- Default provided at lualine repo: https://github.com/nvim-lualine/lualine.nvim#default-config
local cfg = {
 options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', diff,
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {treesitter,'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree" },
}
require'lualine'.setup(cfg)
