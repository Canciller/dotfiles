return {{
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({})
    end
}, {
    "gbprod/substitute.nvim",
    config = require('plugins/editing-support/substitute')
}, {
    "windwp/nvim-autopairs",
    config = require('plugins/editing-support/nvim-autopairs')
}}
