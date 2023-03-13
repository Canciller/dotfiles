local autocmd = vim.api.nvim_create_autocmd

return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      use_diagnostic_signs = true,
      signs = {
        error = 'E',
        warning = 'W',
        hint = 'H',
        information = 'I',
        other = 'O',
      },
      action_keys = {
        open_split = { 'x' }, -- open buffer in new split
        open_vsplit = { 'v' }, -- open buffer in new vsplit
        open_tab = { 't' }, -- open buffer in new tab
      },
    },
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Trouble toggle' },
      { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
      { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous { skip_groups = true, jump = true }
          else
            pcall(vim.cmd, 'cprev')
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            pcall(vim.cmd, 'cnext')
          end
        end,
        desc = 'Next trouble/quickfix item',
      },
    },
    init = function()
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
        command = 'Trouble quickfix',
      })
    end,
  },
}
