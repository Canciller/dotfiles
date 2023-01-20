local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup({
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["n"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    recent_files = {
      only_cwd = true,
      show_current_file = false
    },
  },
  pickers = {
    live_grep = {
      additional_args = function(opts)
        return {"--hidden", "-u"}
      end
    },
  },
  defaults = {
    path_display = { "truncate" },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["x"] = actions.file_split,
        ["v"] = actions.file_vsplit,
        ["t"] = actions.select_tab,
      },
    },
  },
})

telescope.load_extension "recent_files"
telescope.load_extension "file_browser"
telescope.load_extension "frecency"
telescope.load_extension "fzf"
telescope.load_extension "noice"

local function file_browser()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    hidden = true,
    grouped = true,
    initial_mode = "normal",
  })
end

vim.keymap.set(
  "n",
  "<leader>fb",
  file_browser,
  { noremap = true, silent = true }
)

local function find_files()
  builtin.git_files()
end

vim.keymap.set('n', '<leader>ff', find_files, {
  noremap = true,
  silent = true
})

local find_all_files = function()
  builtin.find_files({
    no_ignore = true
  })
end

vim.keymap.set('n', '<leader>fa', find_all_files, {
  noremap = true,
  silent = true
})

local find_recent_files = function()
  telescope.extensions.recent_files.pick()
end

vim.keymap.set('n', '<leader>fr', find_recent_files, {
  noremap = true,
  silent = true
})
