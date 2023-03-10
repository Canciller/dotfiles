return function(_, opts)
    require("neo-tree").setup(opts)

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
end
