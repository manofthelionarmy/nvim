local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
telescope.setup{
  defaults = {
    preview = {                                                                                                                                                                          
      hide_on_startup = true -- hide previewer when picker starts
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 0,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = {".git/", "node_modules/", "vendor/"},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { shorten = 5 },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default + actions.center,
      },
      n = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-y>"] = action_layout.toggle_preview,
        -- ["<c-t>"] = trouble.open_with_trouble,
        -- ["<C-i>"] = my_cool_custom_action,
      },
    },
  },
  extensions = {
    -- fzy_native = {
    --   override_generic_sorter = false,
    --   override_file_sorter = true,
    -- },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    },
    file_browser = {
      mappings = {
        ["i"] = {
          ["<C-o>"] = require "telescope".extensions.file_browser.actions.change_cwd,
          ["<CR>"] = require "telescope.actions".select_tab
        },
      }
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}
require'telescope'.load_extension('projects')
-- Make sure to load this if I want to use the extension
-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
