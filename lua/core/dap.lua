-- Only setting up js debugging because vim-go has great debuggin support :)
local cfg = {
    breakpoint = {
      text = "",
      texthl = "CocDiagnosticsError",
      linehl = "",
      numhl = "",
    },
    breakpoint_rejected = {
      text = "",
      texthl = "CocDiagnosticsHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "CocDiagnosticsInfo",
      linehl = "CocUnderline",
      numhl = "CocDiagnosticsInfo",
    },
  }

-- TODO: fix this. Something is wrong. When I require this, this breaks
local dap = require("dap")

-- See other configs or defaults I can override
-- dap.defaults.fallback.terminal_win_cmd = "tabnew"

vim.fn.sign_define("DapBreakpoint", cfg.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", cfg.breakpoint_rejected)
vim.fn.sign_define("DapStopped", cfg.stopped)

-- where are these logs kept?
dap.set_log_level('ERROR')
-- Learned something!!! the configuration is highly dependent on the filetype!!!
-- meaning!!! I have to have more than one configuration for javascript so I can select the right one!!!
-- Manually install debugging packages too.
-- this is where I store my debug adapaters... I wonder if I should point to the same ones in vimspector
local debug_adapters_pth = os.getenv('HOME') .. '/.config/dap_adapters/'

-- TODO: set up jest, set up golang tests

dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {debug_adapters_pth .. 'vscode-firefox-debug/dist/adapter.bundle.js'},
  skipFiles = {
    "node_modules/**/*.js",
    "<node_internals>/**/*.js",
  }
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {debug_adapters_pth .. 'vscode-node-debug2/out/src/nodeDebug.js'},
  skipFiles = { -- TODO: check docs to see if this is set properly
    "node_modules/**/*.js",
    "<node_internals>/**/*.js",
  }
}

local debug_with_firefox = {
  name = 'Debug with Firefox Launch',
  type = 'firefox',
  request = 'launch',
  protocol = 'inspector',
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/usr/bin/firefox',
  console = 'integratedTerminal',
}

local debug_with_node_launch = {
  name = 'Debug with Node, Launch', -- setup debug test, and for jest or other testing frameworks
  type = "node2",
  request = 'launch',
  program = '${file}',
  cwd = vim.fn.getcwd(),
  protocol = 'inspector',
  console = 'integratedTerminal',
}

local debug_with_node_attach = {
  name = 'Debug with Node, Attach',
  type = "node2",
  request = 'attach',
  program = '${file}',
  cwd = vim.fn.getcwd(),
  protocol = 'inspector',
  console = 'integratedTerminal',
  processId = require'dap.utils'.pick_process,
}

-- may not need this one
-- local debug_with_firefox_attach = {
--   name = 'Debug with Firefox Attach',
--   type = 'firefox',
--   request = 'attach',
--   protocol = 'inspector',
--   sourceMaps = true,
--   url = 'http://localhost:3000',
--   program = '${workspaceFolder}/index.js', -- should be pointing to some build of my react app, and I run it with node --inspector
--   cwd = vim.fn.getcwd(),
--   port = '3000',
--   webRoot = '${workspaceFolder}',
--   firefoxExecutable = '/usr/bin/firefox',
--   console = 'integratedTerminal',
--   processId = require'dap.utils'.pick_process,
-- }
-- dap.adapters.delve = {
--   type = 'server',
--   -- port = '${port}',
--   port = '8181',
--   host = '127.0.0.1',
--   executable = nil,
--   -- executable = {
--   --   command = 'dlv',
--   --   args = {'dap', '-l', '127.0.0.1:${port}'},
--   -- }
-- }


require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go_headless",
      name = "Debug Connect Remote",
      mode = "remote",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = "8181"
      },
    },
    -- NOTE: can't do local because we get the ptrace error
    {
      type = "go_headless",
      name = "Dap Connect Remote",
      mode = "local",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = "8181"
      },
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "8181" -- I don't want this to start it, I want to attach to it
  },
}

-- The config from this dap-go was creating an executable, saying to create a server
-- If we don't specify it, we can connect to it without the error saying the port is already in use.
-- dap.adapters.go = {
--     type = "server",
--     port = '8181',
--     -- executable = {
--     --   command = "dlv",
--     --   args = { "dap", "-l", "127.0.0.1:" .. config.delve.port },
--     -- },
--     -- options = {
--     --   initialize_timeout_sec = config.delve.initialize_timeout_sec,
--     -- },
--   }

-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
--   {
--     type = "delve",
--     name = "Debug",
--     request = "launch",
--     program = "${file}"
--   },
--   {
--     type = "delve",
--     name = "Debug test", -- configuration for debugging test files
--     request = "launch",
--     mode = "test",
--     program = "${file}"
--   },
--   -- works with go.mod packages and sub packages 
--   {
--     type = "delve",
--     name = "Debug test (go.mod)",
--     request = "launch",
--     mode = "test",
--     program = "./${relativeFileDirname}"
--   } 
-- }

dap.configurations.javascript = {
  -- debug_with_firefox,
  debug_with_node_launch,
  debug_with_node_attach,
}

-- TODO: set up keymappings
-- lvim.builtin.which_key.mappings["d"] = {
--   name = "Debug",
--   t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
--   b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
--   c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
--   C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
--   d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
--   g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
--   i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
--   o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
--   u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
--   p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
--   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
--   s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
--   q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
-- }
