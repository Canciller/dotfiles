return function()
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
