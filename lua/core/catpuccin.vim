lua << EOF
require("catppuccin").setup {
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  integrations = {
    nvimtree = true,
    telescope = true,
    notify = false,
    mini = false,
    barbar = true,
    which_key = true,
    ts_rainbow2 = true,
    coc_nvim = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.surface2, style = {"bold", "italic"} },
      ["@constant.builtin"] = { fg = colors.peach, style = {} },
      ["@comment"] = { fg = colors.surface2, style = { "bold", "italic" } },
      ["@property"] = { fg = colors.blue },
      CursorLineNr = { style = {"bold"} },
      ALEWarningSign = {fg = colors.yellow},
      AleWarningLine = {fg = colors.peach, style = {"bold", "undercurl"}},
      AleVirtualTextWarning = {fg = colors.peach, style = {"bold", "undercurl"}},
      NvimTreeNormal = {bg = colors.none},
      -- TODO: figure out which color this is
      TelescopeNormal = {bg = colors.base },
      Normal = {bg="NONE", fg="NONE"}
    }
  end
}
EOF
