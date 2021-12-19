local home_dir = vim.loop.os_homedir()
local custom_section = {
  a = {
    description = { "  Find File          " },
    command = "Telescope find_files",
  },
  b = {
    description = { "  Recent Projects    " },
    command = "Telescope projects",
  },
  c = {
    description = { "  Recently Used Files" },
    command = "Telescope oldfiles",
  },
  d = {
    description = { "  Find Word          " },
    command = "Telescope live_grep",
  },
  e = {
    description = { "  Configuration      " },
    command = "lua require('modules/searchconfigs').search_configs()"
  },
}

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = home_dir .. "/.cache/nvim/sessions" 
vim.g.dashboard_custom_section = custom_section
vim.cmd "let packages = len(globpath('~/.config/nvim/plugged', '*', 0, 1))"
vim.api.nvim_exec(
  [[
    let g:dashboard_custom_footer = ['VimPlug loaded '..packages..' plugins  ']
  ]],
  false
)
vim.g.dashboard_custom_header = {
    '                                ▄      ',
    '          ▄▄▄▀▀▀▀█▄▄▄           █▄     ',
    '       ▄█▀▀░░░░░░░░░▀▀█▄▄▄▄▄▄▄  █▀▄    ',
    '     ▄██▄░░░░░░░░░░░░░░░▀▄░░░▀▀██▄█    ',
    '    ▄▀▀░▀▀█▄░░░░░▄█▀▀█▄▄░▀█░░░░░░▀█▄   ',
    '    █░░░░░▄█▄▄▄▄█▀░░░░░█░░█▄░░░░░░░▀▄  ',
    '    █▄░░▄▀▀░░░░▀▀▄▄░░░░█▄░░█░░░░░░░░█▄ ',
    '    ████▀░░▄▄▄▄░░░▀▄▄▄██░░░█░░░░░░░░░█ ',
    '    ███▀░░██████░░░███▀█▄░▄▀░░░░░░░░░█ ',
    '     ██░░░░█▀▀▀█░░░░█░░░▀▀▀░░░░░░░░░▄█ ',
    '     █▀█░░░█▀▀▀█░░░░█░░░░░░░░░░░░░░░█  ',
    '     ▀█▀▄▄█▀░░░▀█░░█▀░░░░░░░░░░░░░▄█   ',
    '      ▀█░░░░░░░░░▀▀░░░░░░░░░░░░▄██░█   ',
    '        ██▄░░░░░░░░░░░░░░░░▄▄█▀ ██░█   ',
    '        █░▀█▀▀█▄▄▄▄▄▄▄▄██▀▀█    ██░█   ',
    '        █░░█     █░░█   █░░█    ██░█   ',
    '     ▄▄▄█░░█  ▄▄▄█░░█ ▄▀▀░░█   ▄██░█   ',
    '    ▀█▄▄▄▄▄█  █▄▄▄▄▄█  ▀▀▀▀    █▄▄▄█   ',
    " ",
    "        Dude, suckin at something ",
    "        is the first step towards ",
    "      being sorta good at something",
    " ",
    "     - Jake the Dog, Adventure Time",
}

-- vim.g.dashboard_preview_file_height = 5
-- vim.g.dashboard_preview_file_width = 80
