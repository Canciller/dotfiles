local gp = require('goto-preview')

gp.setup {}

local bufopts = { noremap=true, silent=true, buffer=bufnr }

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gp', gp.goto_preview_definition, bufopts)
vim.keymap.set('n', 'gi', gp.goto_preview_implementation, bufopts)
-- vim.keymap.set('n', 'gr', gp.goto_preview_references, bufopts)
