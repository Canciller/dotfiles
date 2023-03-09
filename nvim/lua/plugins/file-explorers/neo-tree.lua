return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd [[
              setlocal relativenumber
            ]]
          end,
        }
      },
    })
  end
}