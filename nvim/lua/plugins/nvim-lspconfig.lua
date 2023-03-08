local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end
local rt = require('rust-tools')

local protocol = require('vim.lsp.protocol')
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  --[[ if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
  end ]]

  -- format on save
  --[[ if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end ]]
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  --[[ vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) ]]

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --[[ vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts) ]]
  -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

  vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<cr>', bufopts)
  vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, buf)
  vim.keymap.set('n', '<leader>fo', function() vim.lsp.buf.format { async = true } end, bufopts)

  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  -- vim.keymap.set('n', '<leader>cd', vim.diagnostic.setloclist, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Rust
rt.setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities
  },
  inlay_hints = {
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
  }
}

vim.g.rustfmt_autosave = true

-- Diagnostics

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

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = false,
  float = { border = "rounded" },
})

vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true
vim.g.code_action_menu_show_action_kind = false
