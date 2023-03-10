return {{
    "kylechui/nvim-surround",
    opts = {}
}, {
    "gbprod/substitute.nvim",
    config = require('plugins/editing-support/substitute')
}, {
    "windwp/nvim-autopairs",
    opts = {
        disable_filetype = {"TelescopePrompt", "vim"},
        enable_check_bracket_line = true
    }
}}
