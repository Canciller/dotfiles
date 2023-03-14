return {
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end

      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },
  {
    'windwp/nvim-spectre',
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    opts = {
      highlight = {
        bg = '#16161E',
        fg = '#1F3442',
      },
      -- timer refresh rate
      interval = 30,
    },
    event = { 'WinNew' },
  },
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    opts = {
      autowidth = { enable = true },
      ignore = {
        filetype = { 'neo-tree', 'lazy', 'noice' },
      },
    },
  },
}
