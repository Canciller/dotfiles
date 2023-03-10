return { {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim" },
  opts = {
    event_handlers = { {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd [[
              setlocal relativenumber
            ]]
      end
    } },
    filesystem = {
      follow_current_file = true
    }
  },
  init = function()
    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  end
} }
