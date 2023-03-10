return { {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      severity_sort = true,
      virtual_text = false,
      virtual_lines = false,
      update_in_insert = false,
      float = {
        border = "rounded"
      }
    }
  },
  config = function (_, opts)
    local signs = {
        Error = "E",
        Warn = "W",
        Hint = "H",
        Info = "I"
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config(opts.diagnostics)
  end
}, {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.flake8
      }
    }
  end
} -- {
  --     "jose-elias-alvarez/typescript.nvim",
  --     config = require('plugins/lsp/langs/typescript')
  -- },
  -- {
  --     'jose-elias-alvarez/null-ls.nvim',
  --     dependencies = {'nvim-lua/plenary.nvim'},
  --     config = require('plugins/lsp/null-ls')
  -- }
  -- {
  --     "glepnir/lspsaga.nvim",
  --     event = "BufRead",
  --     dependencies = {{"nvim-tree/nvim-web-devicons"}},
  --     config = require('plugins/lsp/lspsaga')
  -- }
}
