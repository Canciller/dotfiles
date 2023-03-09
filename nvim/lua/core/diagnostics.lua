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

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = false,
  float = { border = "rounded" },
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]