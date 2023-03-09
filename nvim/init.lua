-- nvim config

require('core/options')
require('core/keymaps')
require('core/autocmds')

-- lazy.nvim config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  require('plugins/colorschemes/tokyonight'),
  require('plugins/file-explorers/neo-tree'),
  require('plugins/syntax/nvim-treesitter'),
  require('plugins/syntax/nvim-surround'),
  require('plugins/statuslines/lualine'),
  require('plugins/tablines/bufferline'),
  require('plugins/comments/comment'),
  require('plugins/comments/todo-comments'),
}

require("lazy").setup(plugins)

-- plugins config

-- require('packer_init')

-- require('plugins/nvim-lspconfig')
-- require('plugins/null-ls')
-- require('plugins/lsp_lines')
-- require('plugins/trouble')
-- -- require('plugins/lspsaga')
-- require('plugins/noice')
-- require('plugins/inc-rename')
-- -- require('plugins/fidget')
-- require('plugins/lualine') [PARTIAL]
-- require('plugins/telescope')
-- -- require('plugins/vim-hardtime')
-- require('plugins/nvim-cmp')
-- require('plugins/nvim-treesitter') [PARTIAL]
-- require('plugins/nvim-autopairs')
-- require('plugins/gitsigns')
-- require('plugins/git-blame')
-- require('plugins/prettier')
-- require('plugins/colorizer')
-- require('plugins/shade')
-- require('plugins/indent_blankline')
-- require('plugins/nvim-tree')
-- require('plugins/alpha-nvim')
-- require('plugins/dressing')
-- -- require('plugins/nvim-lightbulb')
-- require('plugins/goto-preview')
-- require('plugins/substitute')
-- require('plugins/luasnip')
-- require('plugins/diffview')