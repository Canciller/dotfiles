local o = vim.opt
local cmd = vim.cmd

o.termguicolors = true
o.background = 'dark'

o.showmode = false

o.splitright = true -- prefer vsplitting to the right
o.splitbelow = true -- prefer splitting below

o.cursorline = true -- hightlight line cursor is on

o.number = true
o.relativenumber = true
o.numberwidth = 5

o.wrap = false -- don't wrap my text

o.autoindent = true -- continue indentation to new line
o.smartindent = true -- add extra indent when it makes sense
o.smarttab = true -- <Tab> at the start of a line behaves as expected
o.expandtab = true -- <Tab> inserts spaces
o.shiftwidth = 2 -- >>, << shift line by 2 spaces
o.tabstop = 2 -- <Tab> appears as 2 spaces
o.softtabstop = 2 -- <Tab> behaves as 2 spaces when editing
o.shiftround = true

o.scrolloff = 4 -- keep 4 lines visible while scrolling
o.sidescrolloff = 15
o.sidescroll = 1

o.title = true
o.titlestring = '%t %m'

o.timeoutlen = 500

o.autowrite = true -- write open buffers on :make

o.foldlevel = 0 -- allow folding the whole way down
o.foldlevelstart = 99 -- open files with all folds open
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldenable = false

o.ignorecase = true -- case insensitive search...
o.smartcase = true -- unless I use caps

o.mouse = 'nv' -- use mouse in normal, visual modes

o.undofile = false -- keep track of my 'undo's between sessions

o.swapfile = false -- no swap files

o.list = true
o.listchars:append 'eol:↴'

cmd 'filetype on'
