return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  opts = {
    defaults = {
      path_display = { "truncate" },
      mappings = {
        n = {
          ["q"] = function(...)
            require('telescope.actions').close(...)
          end,
          ["x"] = function(...)
            require('telescope.actions').file_split(...)
          end,
          ["v"] = function(...)
            require('telescope.actions').file_vsplit(...)
          end,
          ["t"] = function(...)
            require('telescope.actions').select_tab(...)
          end,
        },
      },
    },
  }
}
