local db = require('dashboard')
local home_dir = vim.loop.os_homedir()
local center = {
  {
    -- desc = { "  Find File          " },
    desc = "  Find File          ",
    action = "Telescope find_files hidden=true",
    icon = "󰱼"
  },
  {
    desc = "  New File           ",
    action = ":ene!",
    icon = "󰈔"
  },
  {
    desc = "󰄉  Recent Projects    ",
    action = "Telescope projects",
  },
  {
    desc = "  Recently Used Files",
    action = "Telescope oldfiles",
  },
  {
    desc = "󰊄  Find Word          ",
    action = "Telescope live_grep",
  },
  {
    desc = "  Configuration      ",
    action = "lua require('modules/searchconfigs').search_configs()"
  },
}

-- vim.g.dashboard_default_executive = 'telescope'
-- vim.g.dashboard_session_directory = home_dir .. "/.cache/nvim/sessions" 
-- TODO: fix this, want to have the exact count
local plugins_count = vim.fn.len(vim.fn.globpath('~/.config/nvim/plugged', '*', 0, 1))
local footer = {'VimPlug loaded ' ..plugins_count.. ' plugins 🔌'}
-- vim.cmd "let packages = len(globpath('~/.config/nvim/plugged', '*', 0, 1))"
-- vim.api.nvim_exec(
--   [[
--     let g:dashboard_custom_footer = ['VimPlug loaded '..packages..' plugins  ']
--   ]],
--   false
-- )
local header = {
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
local cfg = {
  theme = 'doom',
  config = {
    header = header,
    center = center,
    footer = footer,
  },
}
db.setup(cfg)
