return { {
    "kylechui/nvim-surround",
    opts = {}
}, {
    "gbprod/substitute.nvim",
    opts = {},
    init = function()
        vim.keymap.set("n", "s", "<cmd>lua require('substitute').operator()<cr>", {
            noremap = true
        })
        vim.keymap.set("n", "ss", "<cmd>lua require('substitute').line()<cr>", {
            noremap = true
        })
        vim.keymap.set("n", "S", "<cmd>lua require('substitute').eol()<cr>", {
            noremap = true
        })
        vim.keymap.set("x", "s", "<cmd>lua require('substitute').visual()<cr>", {
            noremap = true
        })
    end
}, {
    "windwp/nvim-autopairs",
    opts = {
        disable_filetype = { "TelescopePrompt", "vim" },
        enable_check_bracket_line = true
    }
} }
