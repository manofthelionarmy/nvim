require("dapui").setup({
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = ""
    }
  },
  element_mappings = {},
  -- expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" }
    }
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = ""
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
          width = 50
        }, 
        {
          id = "breakpoints",
          size = 0.25,
          width = 50
        },
        {
          id = "stacks",
          size = 0.25,
          width = 50
        },
        {
          id = "watches",
          size = 0.25,
          width = 50
        } 
      },
      position = "left",
      size = 20
    },
    {
      elements = { 
        {
          id = "repl",
          size = 0.9,
          height = 10,
          -- window = 50,
        }, 
        -- it appears we can't use the console
        -- {
        --   id = "console",
        --   size = 0.5,
        --   -- window = 50,
        -- }
      },
      position = "bottom",
      size = 5
    } 
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
  render = {
    indent = 1,
    max_value_lines = 100
  }
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
