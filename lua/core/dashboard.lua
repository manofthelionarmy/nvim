local home_dir = vim.loop.os_homedir()
local custom_section = {
  a = {
    -- description = { "  Find File          " },
    description = {"  Find File          "},
    command = "Telescope find_files",
  },
  b = {
    description = { "  New File           " },
    command = ":ene!",
  },
  c = {
    description = { "  Recent Projects    " },
    command = "Telescope projects",
  },
  d = {
    description = { "  Recently Used Files" },
    command = "Telescope oldfiles",
  },
  e = {
    description = { "  Find Word          " },
    command = "Telescope live_grep",
  },
  f = {
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
vim.g.dashboard_preview_file_height = 20
-- vim.g.dashboard_preview_file_width = 40

-- vim.g.dashboard_preview_command = 'cat'
-- vim.g.dashboard_preview_pipeline = 'cat'
-- vim.g.dashboard_preview_file = '~/.config/nvim/mudkip.cat'
