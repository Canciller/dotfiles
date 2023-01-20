require("noice").setup({
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
