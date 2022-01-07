local window_width_limit = 40
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
}
local scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  left_padding = 0,
  right_padding = 0,
  color = { fg = "#ECBE7B", bg = "#202328" },
  condition = nil,
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
  condition = conditions.hide_in_width,
}

local filename = {
  'filename',
  file_status = true,  -- displays file status (readonly status, modified status)
  path = 0,            -- 0 = just filename, 1 = relative path, 2 = absolute path
  shorting_target = 40, -- Shortens path to leave 40 space in the window
  condition = conditions.hide_in_width,
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

local branch = {
  'branch',
  -- icon = " ",
  icon = " ",
  -- color = { gui = "italic" },
  condition = conditions.hide_in_width
}

local filetype = {
  'filetype',
  condition = conditions.hide_in_width
}

local fileformat = {
  'fileformat',
  condition = conditions.hide_in_width
}

local progress = {
  'progress',
  condition = conditions.hide_in_width
}

local diagnostics = {
 'diagnostics',
  -- sources={'coc'},
  -- sources={'coc', 'ale'},
  sources={'ale'},
  condition = conditions.hide_in_width
}

-- Default provided at lualine repo: https://github.com/nvim-lualine/lualine.nvim#default-config
local cfg = {
 options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    component_separators = { left = ' ', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {"dashboard", "NvimTree", "Outline"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {branch,filename },
    lualine_c = {diff},
    lualine_x = {diagnostics, treesitter, fileformat, filetype},
    lualine_y = {progress},
    lualine_z = {scrollbar}
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
