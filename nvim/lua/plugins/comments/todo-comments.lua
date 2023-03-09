return {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        tc = require('todo-comments')
        tc.setup {}

        vim.keymap.set("n", "]t", function()
            tc.jump_next()
        end, {
            desc = "Next todo comment",
            noremap = true
        })

        vim.keymap.set("n", "[t", function()
            tc.jump_prev()
        end, {
            desc = "Previous todo comment",
            noremap = true
        })
    end
}
