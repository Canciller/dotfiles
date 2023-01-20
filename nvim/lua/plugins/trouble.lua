require("trouble").setup({
  signs = {
      error = "E",
      warning = "W",
      hint = "H",
      information = "I",
      other = "O"
  },
  action_keys = {
    open_split = { "x" }, -- open buffer in new split
    open_vsplit = { "v" }, -- open buffer in new vsplit
    open_tab = { "t" }, -- open buffer in new tab
  }
})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
