return function()
    require("neo-tree").setup({
        event_handlers = {{
            event = "neo_tree_buffer_enter",
            handler = function(arg)
                vim.cmd [[
              setlocal relativenumber
            ]]
            end
        }},
        filesystem = {
            follow_current_file = true
        }
    })

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
end
