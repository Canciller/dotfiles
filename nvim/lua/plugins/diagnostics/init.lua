local autocmd = vim.api.nvim_create_autocmd

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      signs = {
        error = "E",
        warning = "W",
        hint = "H",
        information = "I",
        other = "O"
      },
      action_keys = {
        open_split = { "x" },  -- open buffer in new split
        open_vsplit = { "v" }, -- open buffer in new vsplit
        open_tab = { "t" },    -- open buffer in new tab
      }
    },
    init = function()
      local opts = { silent = true, noremap = true }

      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)

      -- vim.cmd [[
      --   function! ToggleQuickFix()
      --       if empty(filter(getwininfo(), 'v:val.quickfix'))
      --           copen
      --       else
      --           cclose
      --       endif
      --   endfunction

      --   function! ToggleLocationList()
      --       if empty(filter(getwininfo(), 'v:val.quickfix'))
      --           lopen
      --       else
      --           lclose
      --       endif
      --   endfunction

      --   nnoremap <silent> <leader>xq :call ToggleQuickFix()<cr>
      --   nnoremap <silent> ]q :cnext<cr>
      --   nnoremap <silent> [q :cprev<cr>

      --   autocmd FileType qf nnoremap <buffer> t <C-W><cr><C-W>T
      --   autocmd FileType qf nnoremap <buffer> x <C-W><cr>
      --   autocmd FileType qf nnoremap <buffer> v <C-W><cr><C-W>L

      --   nnoremap <silent> <leader>xl :call ToggleLocationList()<cr>
      -- ]]

      -- autocmd('QuickFixCmdPost', {
      --   nested = true,
      --   pattern = '[^l]*',
      --   command = 'cwindow'
      -- })

      autocmd('QuickFixCmdPost', {
        nested = true,
        pattern = '[^l]*',
        command = 'Trouble quickfix'
      })
    end
  }
}
