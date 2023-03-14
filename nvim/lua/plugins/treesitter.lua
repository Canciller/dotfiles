return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = false,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    version = false,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      'mrjones2014/nvim-ts-rainbow',
    },
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        'vim',
        'comment',
        'help',
        'lua',
        'tsx',
        'typescript',
        'javascript',
        'json',
        'css',
        'html',
        'markdown',
        'markdown_inline',
        'regex',
        'bash',
        'rust',
        'toml',
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autotag = {
        enable = true,
      },
      rainbow = {
        enable = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
