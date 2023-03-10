return {
    'echasnovski/mini.indentscope',
    version = '*',
    opts = {
        symbol = '│'
    },
    config = function(_, opts)
        require('mini.indentscope').setup(opts)
    end
}
