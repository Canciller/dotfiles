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
--[[ vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
) ]]
--[[ vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
) ]]

vim.cmd [[
  function! ToggleQuickFix()
      if empty(filter(getwininfo(), 'v:val.quickfix'))
          copen
      else
          cclose
      endif
  endfunction

  function! ToggleLocationList()
      if empty(filter(getwininfo(), 'v:val.quickfix'))
          lopen
      else
          lclose
      endif
  endfunction

  nnoremap <silent> <leader>xq :call ToggleQuickFix()<cr>
  nnoremap <silent> ]q :cnext<cr>
  nnoremap <silent> [q :cprev<cr>

  autocmd FileType qf nnoremap <buffer> t <C-W><cr><C-W>T
  autocmd FileType qf nnoremap <buffer> x <C-W><cr>
  autocmd FileType qf nnoremap <buffer> v <C-W><cr><C-W>L

  nnoremap <silent> <leader>xl :call ToggleLocationList()<cr>
]]


vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

local autocmd = vim.api.nvim_create_autocmd

--[[ autocmd('QuickFixCmdPost', {
  nested = true,
  pattern = '[^l]*',
  command = 'Trouble quickfix'
}) ]]

--[[ autocmd('QuickFixCmdPre', {
  nested = true,
  pattern = '[^l]*',
  command = 'TroubleClose'
}) ]]

autocmd('QuickFixCmdPost', {
  nested = true,
  pattern = '[^l]*',
  command = 'cwindow'
})
