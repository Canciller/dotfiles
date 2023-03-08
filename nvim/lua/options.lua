local o = vim.opt
local cmd = vim.cmd

o.termguicolors = true
o.background = 'dark'

o.showmode = false

o.splitbelow = true
o.splitright = true

o.cursorline = true

o.number = true
o.relativenumber = true
o.numberwidth = 5

o.wrap = false

o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 0
o.expandtab = true

o.title = true
o.titlestring = "%t %m"

o.timeoutlen = 500

o.autowrite = true

cmd('filetype on')
