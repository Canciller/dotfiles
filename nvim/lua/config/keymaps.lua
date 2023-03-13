local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','

cmd ':command! WQ wq'
cmd ':command! Wq wq'
cmd ':command! W w'
cmd ':command! Q q'

-- disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- disable esc in insert mode
map('i', '<esc>', '<nop>')

-- enter normal mode in insert mode
map('i', 'jk', '<esc>')
-- map('v', 'jk', '<esc>')
map('c', 'jk', '<c-c>')

map('t', 'jk', '<C-\\><C-n>')

-- ctrl+] not working on latam keybord
map('n', '<c-+>', '<c-]>')

-- split movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')

-- split resize
map('n', '<up>', ':res -5<cr>')
map('n', '<down>', ':res +5<cr>')
map('n', '<left>', ':vertical res -5<cr>')
map('n', '<right>', ':vertical res +5<cr>')

-- tab movement
map('n', '<tab>', ':tabn<cr>')
map('n', '<s-tab>', ':tabp<cr>')

-- move to end/start of line
map('n', 'L', '$')
map('n', 'H', '0')

-- disable hlsearch
map('n', '<esc><esc>', ':nohlsearch<cr>')

-- enter normal mode in terminal
map('t', '<esc>', '<c-\\><c-n>')

-- reload configuration
map('n', '<leader>r', ':so %<cr>')

-- open keymaps.lua in new tab
map('n', '<leader>gk', ':tabedit $CONFIG/nvim/lua/keymaps.lua<cr>')

-- open autocmds.lua in new tab
map('n', '<leader>ga', ':tabedit $CONFIG/nvim/lua/autocmds.lua<cr>')

-- open options.lua in new tab
map('n', '<leader>go', ':tabedit $CONFIG/nvim/lua/options.lua<cr>')

-- record macro
map('n', 'q', '<nop>')
map('n', '<leader>q', 'q')
