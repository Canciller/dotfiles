return {
  {
    {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        if type(opts.ensure_installed) == 'table' then
          vim.list_extend(opts.ensure_installed, { 'typescript', 'tsx' })
        end
      end,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'jose-elias-alvarez/typescript.nvim' },
    opts = {
      servers = {
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require('typescript').setup {
            disable_commands = false, -- prevent the plugin from creating Vim commands
            debug = false, -- enable debug logging for commands
            go_to_source_definition = {
              fallback = true, -- fall back to standard LSP definition on failure
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
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.eslint_d.with {
          diagnostics_format = '[eslint] #{m}\n(#{c})',
        }
      )
      table.insert(opts.sources, nls.builtins.code_actions.eslint_d)
      table.insert(opts.sources, nls.builtins.formatting.eslint_d)
      table.insert(opts.sources, nls.builtins.formatting.prettierd)

      table.insert(opts.sources, require 'typescript.extensions.null-ls.code-actions')
      table.insert(opts.sources, nls.builtins.diagnostics.tsc)
    end,
  },
}
