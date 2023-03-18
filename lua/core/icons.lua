local icon, color = require'nvim-web-devicons'.get_icon_color("html")

local js_icon, js_color = require'nvim-web-devicons'.get_icon_color("js")

local git_icon, git_color = require'nvim-web-devicons'.get_icon_color(".gitignore")


local css_icon, css_color = require'nvim-web-devicons'.get_icon_color("css")

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
  }
})

