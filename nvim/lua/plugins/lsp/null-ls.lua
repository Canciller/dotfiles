return function()

    local null_ls = require("null-ls")

    local group = vim.api.nvim_create_augroup("lsp_format_on_save", {
        clear = false
    })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    local sources = {null_ls.builtins.code_actions.eslint_d, null_ls.builtins.diagnostics.eslint_d.with({
        diagnostics_format = '[eslint] #{m}\n(#{c})'
    }), require("typescript.extensions.null-ls.code-actions")}

    null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
            -- format on save
            vim.api.nvim_clear_autocmds({
                buffer = bufnr,
                group = group
            })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = async
                    })
                end,
                desc = "[lsp] format on save"
            })
        end
    })
end
