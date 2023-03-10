return {
    'neovim/nvim-lspconfig',
    {
        "jose-elias-alvarez/typescript.nvim",
        config = require('plugins/lsp/langs/typescript')
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = require('plugins/lsp/null-ls')
    }
-- {
--     "glepnir/lspsaga.nvim",
--     event = "BufRead",
--     dependencies = {{"nvim-tree/nvim-web-devicons"}},
--     config = require('plugins/lsp/lspsaga')
-- }
}

