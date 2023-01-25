require("noice").setup({
  --[[ cmdline = {
    view = 'cmdline',
  }, ]]
  presets = {
    inc_rename = false,
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
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "change; before",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "change; after",
      },
      opts = { skip = true },
    },
  },
  lsp = {
    signature = {
      auto_open = {
        enabled = false
      }
    },
    progress = {
      enabled = false,
      view = 'mini'
    }
  }
})
