require('nvim-lightbulb').setup({
  sign = {
    enabled = false
  },
  float = {
    enabled = true
  },
  autocmd = { enabled = false },
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ ignore = {"null-ls"} })]]
