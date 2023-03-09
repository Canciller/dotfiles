return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            ensure_installed = {"vim", "comment", "help", "lua", "tsx", "typescript", "javascript", "json", "css",
                                "html", "markdown", "markdown_inline", "regex", "bash", "rust", "toml"},
            -- autotag = {
            --     enable = true
            -- },
            -- context_commentstring = {
            --     enable = true,
            --     enable_autocmd = false
            -- },
            -- textobjects = {
            --     select = {
            --         enable = true,
            --         lookahead = true,
            --         keymaps = {
            --             ["af"] = "@function.outer",
            --             ["if"] = "@function.inner",
            --             ["ia"] = "@parameter.inner",
            --             ["aa"] = "@parameter.outer",
            --             ["ak"] = "@comment.outer"
            --         },
            --         selection_modes = {
            --             ['@function.outer'] = 'V', -- linewise
            --             ['@function.inner'] = 'V', -- linewise
            --             ['@comment.outer'] = 'V' -- linewise
            --         }
            --     }
            -- }
        }
    end
}
