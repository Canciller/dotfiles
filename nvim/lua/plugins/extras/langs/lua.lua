return {
  {
    {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        if type(opts.ensure_installed) == 'table' then
          vim.list_extend(opts.ensure_installed, { 'lua' })
        end
      end,
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
              format = {
                enable = false,
              }
            },
          },
        },
      },
      setup = {
        lua_ls = function(_, opts)
          require('lspconfig').lua_ls.setup(opts)
        end,
      },
    },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local nls = require 'null-ls'
      table.insert(opts.sources, nls.builtins.formatting.stylua)
    end,
  },
}
