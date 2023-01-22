local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Typescript
augroup('Typescript', { clear = true })
autocmd('FileType', {
  group = 'Typescript',
  pattern = { 'typescript', 'typescriptreact' },
  command = "compiler tsc"
})

augroup('ReactHooksTypescript', { clear = true })
autocmd(
  { 'BufNew', 'BufNewFile', 'BufRead' },
  {
    group = 'ReactHooksTypescript',
    pattern = 'use*.ts',
    command = 'set filetype=typescriptreact'
  }
)


-- Save folds on write and restore on open
augroup('RememberFolds', { clear = true })
autocmd('BufWinLeave', {
  group = 'RememberFolds',
  pattern = '*.*',
  command = 'mkview'
})
autocmd('BufWinEnter', {
  group = 'RememberFolds',
  pattern = '*.*',
  command = 'silent! loadview'
})
