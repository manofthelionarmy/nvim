local icon, color = require'nvim-web-devicons'.get_icon_color("html")
require'nvim-web-devicons'.set_icon({
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 jet = {
    icon = "",
    color = color,
    cterm_color = "65",
    name = "Jet"
 }
})
