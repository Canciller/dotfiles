return { {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    init = function()
        tc = require('todo-comments')

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
}, {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function()
        require('Comment').setup {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
        }
    end
} }
