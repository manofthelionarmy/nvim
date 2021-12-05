local M = {}
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  return
end

local home_dir = vim.loop.os_homedir()

M.search_configs = function()
  local opts = {}
  opts.prompt_title = "🛠 Nvim Configs"
  opts.search_dirs = {home_dir .. '/.config/nvim'}
  opts.path_display = {"absolute"}
  opts.cwd = home_dir .. '/.config/nvim'
  opts.find_command = {
      "rg",
      "--hidden",
      "--files",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--no-ignore",
      "--smart-case",
      "--glob",
      "!plugged/",
      "--glob",
      "!undo/"
    }
  builtin.find_files(opts)
end

return M
