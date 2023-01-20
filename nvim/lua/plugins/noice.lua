require("noice").setup({
  --[[ cmdline = {
    view = 'cmdline',
  }, ]]
  presets = {
    inc_rename = true,
    lsp_doc_border = true,
    command_palette = true
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
})
