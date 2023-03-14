return {
  {
    {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        if type(opts.ensure_installed) == 'table' then
          vim.list_extend(opts.ensure_installed, { 'rust' })
        end
      end,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'simrat39/rust-tools.nvim' },
    opts = {
      servers = {
        rt = {},
      },
      setup = {
        rt = function(_, opts)
          require('rust-tools').setup {
            inlay_hints = {
              parameter_hints_prefix = '<- ',
              other_hints_prefix = '=> ',
            },
            server = opts,
          }
        end,
      },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'

      table.insert(opts.sources, nls.builtins.formatting.rustfmt)
    end,
  },
}
