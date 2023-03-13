return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = false,
  opts = {
    pickers = {
      lsp_references = {
        theme = 'dropdown',
        show_line = false,
      },
      lsp_definitions = {
        theme = 'dropdown',
        show_line = false,
      },
    },
    defaults = {
      path_display = { 'truncate' },
      dynamic_preview_title = true,
      wrap_results = true,
      mappings = {
        n = {
          ['q'] = function(...)
            require('telescope.actions').close(...)
          end,
          ['x'] = function(...)
            require('telescope.actions').file_split(...)
          end,
          ['v'] = function(...)
            require('telescope.actions').file_vsplit(...)
          end,
          ['t'] = function(...)
            require('telescope.actions').select_tab(...)
          end,
        },
      },
    },
  },
}
