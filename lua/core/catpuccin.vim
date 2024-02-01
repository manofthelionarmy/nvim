lua << EOF
require("catppuccin").setup {
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  transparent_background = true,
  integrations = {
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    barbar = true,
    which_key = true,
    --ts_rainbow2 = true,
    rainbow_delimiters = true,
    coc_nvim = true,
    dashboard = true,
    leap = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.surface2, style = {"bold", "italic"} },
      --["@constant.builtin"] = { fg = colors.peach, style = {} },
      ["@comment"] = { fg = colors.surface2, style = { "bold", "italic" } },
      --["@property"] = { fg = colors.blue },
      CursorLineNr = { style = {"bold"} },
      ALEWarningSign = {fg = colors.yellow},
      AleWarningLine = {fg = colors.peach, style = {"bold", "undercurl"}},
      AleVirtualTextWarning = {fg = colors.peach, style = {"bold", "undercurl"}},
      -- TODO: figure out which color this is
      -- NvimTreeNormal = { bg = colors.none },
      TelescopeNormal = { bg = colors.base },
      TelescopeBorder = { bg = colors.base },
      -- TelescopeResultsBorder = { bg = colors.base },
      -- TelescopePromptBorder = { bg = colors.base },
      -- Normal = {bg="NONE", fg="NONE"},
      ALEVirtualTextError = {fg=colors.maroon, bg=colors.base},
      ALEVirtualTextInfo = {fg='#94e2d5', bg=colors.base},
      ALEInfoSign = {fg='#94e2d5'}
    }
  end
}
EOF
