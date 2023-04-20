let g:tokyonight_style="night"
let g:tokyonight_hide_inactive_statusline=1
let g:tokyonight_transparent_sidebar=1
let g:tokyonight_lualine_bold=1
let g:tokyonight_transparent=1
let g:tokyonight_italic_comments=1
let g:tokyonight_transparent = 1
" let g:tokyonight_italic_functions = 1    
let g:tokyonight_terminal_colors=1
let g:tokyonight_lualine_bold=1
" let g:tokyonight_italic_variables=1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi LineNr guifg=#5081c0 
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi Comment guifg=#5081c0 gui=italic,bold
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange
        \ | hi AleErrorLine gui=undercurl,bold guifg=#f7768e
        \ | hi ALEVirtualTextError guifg=#f7768e
        \ | hi NvimTreeNormal guifg=NONE guibg=NONE
        \ | hi Todo gui=bold
        \ | hi TSKeyword gui=NONE | hi Keyword gui=NONE "gui=bold for tokyo
        \ | hi Function gui=NONE 
        \ | hi ALEVirtualTextInfo guifg=#94e2d5 "guibg=<make this a dark color>
        \ | hi ALEInfoSign guifg=#94e2d5
      " \ | hi Visual guifg=black guibg=#F1FA8C " set this for dracula
augroup END

lua << EOF
  require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "dark", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  
    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,
  
    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
      highlights.ALEVirtualTextError = {fg=colors.maroon}
      highlights.ALEVirtualTextInfo = {fg='#94e2d5', bg=colors.base}
      highlights.ALEInfoSign = {fg='#94e2d5'}
      highlights.ALEInfo = {fg='#94e2d5'}
    end,
  })
EOF

augroup MyFloat
	autocmd!
	" autocmd ColorScheme * hi NormalFloat guifg=#5081c0 gui=bold "set for tokyo
augroup END

