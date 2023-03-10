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
  require 'plugins/colorscheme',
  require 'plugins/file-explorer',
  require 'plugins/syntax',
  require 'plugins/statusline',
  require 'plugins/tabline',
  require 'plugins/comments',
  require 'plugins/editing-support',
  require 'plugins/git',
  require 'plugins/indentation',
  require 'plugins/lsp',
}

require("lazy").setup(plugins)