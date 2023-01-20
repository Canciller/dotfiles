local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'j-hui/fidget.nvim'

  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'

  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'takac/vim-hardtime'

  use 'sainnhe/gruvbox-material'
  use 'Mofiqul/dracula.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'folke/tokyonight.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-lualine/lualine.nvim'

  use 'akinsho/bufferline.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-telescope/telescope.nvim'

  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'smartpde/telescope-recent-files'
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'kkharji/sqlite.lua'}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    }

  use 'glepnir/lspsaga.nvim'

  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

  use 'NvChad/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'

  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'folke/trouble.nvim'

  use 'RRethy/vim-illuminate'

  use 'f-person/git-blame.nvim'

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use 'nvim-tree/nvim-tree.lua'

  use 'rcarriga/nvim-notify'

  use({
    'kylechui/nvim-surround',
    tag = '*',
  })

  use 'goolord/alpha-nvim'

  use 'smjonas/inc-rename.nvim'

  use 'MunifTanjim/nui.nvim'

  use 'folke/noice.nvim'

  use 'stevearc/dressing.nvim'

  use {
      'kosayoda/nvim-lightbulb',
      requires = 'antoinemadec/FixCursorHold.nvim',
  }
end)


