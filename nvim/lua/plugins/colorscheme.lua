return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {},
  },
}
