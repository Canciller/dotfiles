return {
  {
    'kylechui/nvim-surround',
    opts = {},
  },
  {
    'gbprod/substitute.nvim',
    opts = {},
    init = function()
      vim.keymap.set('n', 's', "<cmd>lua require('substitute').operator()<cr>", {
        noremap = true,
      })
      vim.keymap.set('n', 'ss', "<cmd>lua require('substitute').line()<cr>", {
        noremap = true,
      })
      vim.keymap.set('n', 'S', "<cmd>lua require('substitute').eol()<cr>", {
        noremap = true,
      })
      vim.keymap.set('x', 's', "<cmd>lua require('substitute').visual()<cr>", {
        noremap = true,
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'vim' },
      enable_check_bracket_line = true,
    },
  },
  {
    'takac/vim-hardtime',
    enabled = false,
    init = function()
      vim.g.hardtime_default_on = 1
      vim.g.hardtime_allow_different_key = 1
      vim.g.hardtime_motion_with_count_resets = 1
      vim.g.hardtime_maxcount = 3
      vim.g.hardtime_ignore_quickfix = 1
    end,
  },
}
