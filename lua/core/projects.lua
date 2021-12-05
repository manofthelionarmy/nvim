local status_ok, project = pcall(require, 'project_nvim')
if not status_ok then
  return
end
project.setup(
  {
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    manual_mode = false,
    show_hidden = false,
    ignore_lsp = {},
    slient_chdir = true,
    detection_methods = { "pattern" },
    datapath = vim.fn.stdpath "cache" 
  }
)
