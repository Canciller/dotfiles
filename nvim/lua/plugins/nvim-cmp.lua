local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-Space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    --[[ ['<tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }), ]]

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<cr>"] = cmp.mapping.confirm({
      select = true
    }),

    --[[ ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.confirm({
          select = true
        })
      else
        fallback()
      end
    end) ]]
    --[[ ['<cr>'] = function(fallback)
      -- Don't block <CR> if signature help is active
      -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
      if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
        fallback()
      else
        cmp.confirm({
          -- Replace word if completing in the middle of a word
          -- https://github.com/hrsh7th/nvim-cmp/issues/664
          behavior = cmp.ConfirmBehavior.Replace,
          -- Don't select first item on CR if nothing was selected
          select = false,
        })
      end
    end ]]
  }),
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip', option = { use_show_condition = false } },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      before = function (entry, vim_item)
        if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
          vim_item.menu = entry.completion_item.detail
        end
        return vim_item
      end
    })
  }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
