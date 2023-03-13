return {
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_set_extmark_options = {
        hl_mode = 'combine',
      }
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
}
