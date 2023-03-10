return {{
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = require('plugins/comments/todo-comments')
}, {
    'numToStr/Comment.nvim',
    dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},
    config = require('plugins/comments/comment')
}}
