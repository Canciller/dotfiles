return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
    opts = {
      close_if_last_window = false,
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd [[
              setlocal relativenumber
            ]]
          end
        },
        {
          event = "file_opened",
          handler = function(file_path)
            --auto close
            require("neo-tree").close_all()
          end
        },
      },
      filesystem = {
        follow_current_file = true
      },
      window = {
        mappings = {
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["t"] = "open_tabnew",
        }
      }
    },
    init = function()
      vim.cmd([[nnoremap \ :Neotree toggle<cr>]])
    end
  }
}
