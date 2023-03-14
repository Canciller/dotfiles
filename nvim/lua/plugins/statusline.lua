return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = {
        left = '|',
        right = '|',
      },
      section_separators = {
        left = '',
        right = '',
      },
      disabled_filetypes = {
        statusline = {
          'neo-tree',
        },
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          'diagnostics',
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
          },
        },
      },
      lualine_c = { {
        'filename',
        path = 1,
      } },
      lualine_x = { --   {
        'filetype',
      },
      lualine_y = { { 'branch' }, 'diff' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
