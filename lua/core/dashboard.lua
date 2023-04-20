local db = require('dashboard')
local home_dir = vim.loop.os_homedir()
local custom_section = {
  {
    -- desc = { "  Find File          " },
    desc = "  Find File          ",
    action = "Telescope find_files hidden=true",
    icon = ""
  },
  {
    desc = "  New File           ",
    action = ":ene!",
    icon = ""
  },
  {
    desc = "  Recent Projects    ",
    action = "Telescope projects",
  },
  {
    desc = "  Recently Used Files",
    action = "Telescope oldfiles",
  },
  {
    desc = "  Find Word          ",
    action = "Telescope live_grep",
  },
  {
    desc = "  Configuration      ",
    action = "lua require('modules/searchconfigs').search_configs()"
  },
}

-- vim.g.dashboard_default_executive = 'telescope'
-- vim.g.dashboard_session_directory = home_dir .. "/.cache/nvim/sessions" 
db.custom_center = custom_section
-- TODO: fix this, want to have the exact count
local plugins_count = vim.fn.len(vim.fn.globpath('~/.config/nvim/plugged', '*', 0, 1))
db.custom_footer = {'VimPlug loaded ' ..plugins_count.. ' plugins 🔌'}
-- vim.cmd "let packages = len(globpath('~/.config/nvim/plugged', '*', 0, 1))"
-- vim.api.nvim_exec(
--   [[
--     let g:dashboard_custom_footer = ['VimPlug loaded '..packages..' plugins  ']
--   ]],
--   false
-- )
db.custom_header = {
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
    "       Dude, suckin at something ",
    "       is the first step towards ",
    "     being sorta good at something",
    " ",
    "     - Jake the Dog, Adventure Time",
}
-- vim.g.dashboard_preview_file_height = 20
-- vim.g.dashboard_preview_file_width = 40

-- vim.g.dashboard_preview_command = 'cat'
-- vim.g.dashboard_preview_pipeline = 'cat'
-- vim.g.dashboard_preview_file = '~/.config/nvim/mudkip.cat'
