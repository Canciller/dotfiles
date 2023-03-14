local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    { import = 'plugins/colorscheme' },
    { import = 'plugins/ui' },
    { import = 'plugins/file-explorer' },
    { import = 'plugins/treesitter' },
    { import = 'plugins/statusline' },
    { import = 'plugins/tabline' },
    { import = 'plugins/cursorline' },
    { import = 'plugins/winbar' },
    { import = 'plugins/comments' },
    { import = 'plugins/editing-support' },
    { import = 'plugins/git' },
    { import = 'plugins/indentation' },
    { import = 'plugins/fuzzy-finder' },
    { import = 'plugins/lsp' },
    { import = 'plugins/diagnostics' },
    { import = 'plugins/completion' },
    { import = 'plugins/extras/langs/typescript' },
    { import = 'plugins/extras/langs/rust' },
    { import = 'plugins/extras/langs/lua' },
    { import = 'plugins/extras/langs/markdown' },
    { 'alec-gibson/nvim-tetris' },
  },
  defaults = {
    version = false,
  },
  dev = {
    path = '~/Projects',
  },
  change_detection = {
    notify = false,
  },
}
