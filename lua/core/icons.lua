local icon, color = require'nvim-web-devicons'.get_icon_color("html")

local js_icon, js_color = require'nvim-web-devicons'.get_icon_color("js")

local git_icon, git_color = require'nvim-web-devicons'.get_icon_color(".gitignore")


local css_icon, css_color = require'nvim-web-devicons'.get_icon_color("css")

local go_icon, go_color = require'nvim-web-devicons'.get_icon_color("go")
local bash_icon, bash_color = require'nvim-web-devicons'.get_icon_color("bash")

require'nvim-web-devicons'.set_icon({
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  jet = {
    icon = "",
    color = color,
    cterm_color = "65",
    name = "Jet"
  },
  html = {
   icon = "",
   color = color,
   cterm_color = "65",
   name = "Html"
  },
  gohtml = {
   icon = "",
   color = color,
   cterm_color = "65",
   name = "Html"
  },
  tmpl = {
   icon = "",
   color = color,
   cterm_color = "65",
   name = "Html"
  },
  -- js = {
  --   icon = "",
  --   color = js_color,
  --   cterm_color = 185,
  --   name = "Js"
  -- },
  [".gitignore"] = {
    icon = git_icon,
    color = color,
    cterm_color = 65,
    name = "GitIgnore"
  },
  css = {
    icon = "",
    color = "#519aba",
    cterm_color = 67,
    name = "Css"
  },
  [''] = {
    icon = "",
    color = "#519aba",
    cterm_color = 67,
    name = ""
  },
  ['local'] = {
    icon = "",
    color = "#519aba",
    cterm_color = 67,
    name = ""
  },
  ['tmux'] = {
    icon = "",
    color = "#519aba",
    cterm_color = 67,
    name = ""
  },
  ['.bash_aliases'] = {
    icon = bash_icon,
    color = bash_color,
    cterm_color = bash_color,
    name = ""
  },
  ['mod'] = {
    icon = go_icon,
    color = go_color,
    cterm_color = go_color,
    name = "Mod"
  },
  ['sum'] = {
    icon = go_icon,
    color = go_color,
    cterm_color = go_color,
    name = "Mod"
  },
})

