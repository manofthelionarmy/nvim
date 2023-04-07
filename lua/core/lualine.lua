local window_width_limit = 50
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) >= window_width_limit
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
  cond = nil,
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
local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  purple = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local diff = {
  'diff',
  source = 'coc',
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  color = {},
  cond = function()
    return vim.fn.winwidth(0) >= 50
  end,
}

local filename = {
  'filename',
  file_status = true,   -- displays file status (readonly status, modified status)
  path = 0,             -- 0 = just filename, 1 = relative path, 2 = absolute path
  shorting_target = 40, -- Shortens path to leave 40 space in the window
  cond = conditions.hide_in_width,
  fmt = function(str)
    -- if vim.fn.winwidth(0) <= 50 then
    --   return ' '
    -- end
    local max_length = 15
    if str:len() > 15 then
      return '...' .. str:sub(max_length / 2)
    end
    return str
  end
}

local treesitter = {
  function()
    if next(vim.treesitter.highlighter.active) then
      return "  "
    end
    return ""
  end,
  padding = { left = 1, right = 0 },
  color = { fg = "#98be65" },
  cond = conditions.hide_in_width,
}

local branch = {
  'branch',
  -- icon = " ",
  icon = { " ", color = { gui = "bold" } },
  -- color = { gui = "italic" },
  cond = function()
    return vim.fn.winwidth(0) >= 50
  end,
  shorting_target = 10, -- Shortens path to leave 40 space in the window
  padding = { left = 1, right = 1 },
  fmt = function(str)
    local max_length = 15
    if str:len() > max_length then
      return str:sub(1, max_length) .. '...'
    end
    return str
  end
}

local mode = {
  'mode',
  color = { gui = "bold,italic" },
  separator = { right = '' },
  fmt = function(str)
    return str:sub(1, 1)
  end
}

local filetype = {
  'filetype',
  cond = conditions.hide_in_width
}

local fileformat = {
  'fileformat',
  cond = conditions.hide_in_width,
  color = { fg = colors.cyan },
  fmt = function()
    return ''
  end
}

local progress = {
  'progress',
  cond = conditions.hide_in_width,
  fmt = function(str)
    if str == 'Top' or str == 'Bot' then
      return str
    end
    -- it's 3 because lualine prepends percents with %%. This get's resolved in master of lua
    if str:len() == 3 then
      return ' ' .. str
    end
    return str
  end
}

local diagnostics = {
  'diagnostics',
  -- sources={'coc'},
  -- sources={'coc', 'ale'},
  sources = { 'ale' },
  cond = function()
    return vim.fn.winwidth(0) >= 50
  end,
  -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
}

-- Default provided at lualine repo: https://github.com/nvim-lualine/lualine.nvim#default-config
local cfg = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    -- component_separators = { left = ' ', right = ''},
    component_separators = { left = ' ', right = '' },
    -- section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline", "coctree", "help" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, filename },
    lualine_c = { diff },
    lualine_x = { diagnostics, treesitter, fileformat, filetype },
    lualine_y = { progress },
    lualine_z = { scrollbar }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree" },
}
require 'lualine'.setup(cfg)
