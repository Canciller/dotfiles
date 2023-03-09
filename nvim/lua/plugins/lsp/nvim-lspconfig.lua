return {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
        require('lspconfig').tsserver.setup {}
    end
}
