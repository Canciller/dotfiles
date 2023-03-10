return {{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},
    config = require('plugins/syntax/nvim-treesitter')
}}
