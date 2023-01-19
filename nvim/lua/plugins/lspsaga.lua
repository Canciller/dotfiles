local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  finder_action_keys = {
    open = {'o', '<CR>'},
    vsplit = 'v',
    split = 'x',
    tabe = 't',
    quit = {'q', '<ESC>'},
  },
  rename_in_select = false,
}

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)

vim.keymap.set('i', '<c-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- Peek definition
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)

-- Code action
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

-- Show line diagnostics
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- Show cursor diagnostics
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Rename
vim.keymap.set('n', '<f2>', '<Cmd>Lspsaga rename<CR>', opts)

-- Hover Doc
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

