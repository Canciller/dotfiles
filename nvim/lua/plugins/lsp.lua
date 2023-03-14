return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        severity_sort = true,
        virtual_text = false,
        virtual_lines = false,
        update_in_insert = false,
        float = {
          border = 'rounded',
        },
      },
    },
    config = function(_, opts)
      -- diagnostics
      local signs = {
        Error = 'E',
        Warn = 'W',
        Hint = 'H',
        Info = 'I',
      }

      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = opts.diagnostics.float.border,
      })

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = opts.diagnostics.float.border,
      })

      vim.diagnostic.config(opts.diagnostics)

      -- servers

      local servers = opts.servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend('force', {
          capabilities = vim.deepcopy(capabilities),
          on_attach = function(client, bufnr)
            local o = {
              noremap = true,
              silent = true,
              buffer = bufnr,
            }

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, o)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, o)
            vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', o)
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', o)

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, o)

            vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, o)

            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, o)
            vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, o)

            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, o)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, o)

            if client.supports_method 'textDocument/formatting' then
              local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

              vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
              vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format {
                    filter = function(c)
                      return c.name == 'null-ls'
                    end,
                    bufnr = bufnr,
                  }
                end,
              })
            end
          end,
        }, servers[server] or {})

        opts.setup[server](server, server_opts)
      end

      for server in pairs(servers) do
        setup(server)
      end
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local nls = require 'null-ls'
      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
        sources = {
          nls.builtins.formatting.shfmt,
          nls.builtins.code_actions.gitsigns,
          nls.builtins.diagnostics.todo_comments,
        },
      }
    end,
  },
  {
    'j-hui/fidget.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },
}
