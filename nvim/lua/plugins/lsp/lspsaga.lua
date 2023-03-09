return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    dependencies = {{"nvim-tree/nvim-web-devicons"}},
    config = function()

        require("lspsaga").setup({
            server_filetype_map = {
                typescript = 'typescript'
            },
            finder = {
                keys = {
                    edit = {'o', '<CR>'},
                    vsplit = 'v',
                    split = 'x',
                    tabe = 't',
                    quit = {'q', '<ESC>'}
                }
            },
            rename = {
                quit = '<C-c>',
                exec = '<CR>',
                mark = 'x',
                confirm = '<CR>',
                in_select = false,
            },
            diagnostic = {
                show_code_action = false
            }
        })

        local opts = {
            noremap = true,
            silent = true
        }

        -- Prev diagnostic
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

        -- Next diagnostic
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

        vim.keymap.set('n', 'gr', '<Cmd>Lspsaga lsp_finder<CR>', opts)

        vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)

        -- Peek definition
        vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)

        -- Code action
        vim.keymap.set({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

        -- Show line diagnostics
        vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

        -- Show cursor diagnostics
        vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

        -- Rename
        vim.keymap.set('n', '<f2>', '<Cmd>Lspsaga rename<CR>', opts)

        -- Hover Doc
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

        -- Signature help
        -- vim.keymap.set('i', '<c-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
    end
}
