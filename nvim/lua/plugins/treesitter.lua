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
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
