-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'

local mapping = cmp.mapping.preset.cmdline({
  ['<Up>'] = cmp.mapping.select_prev_item(),
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<Down>'] = cmp.mapping.select_next_item(),
  ['<C-n>'] = cmp.mapping.select_next_item(),
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
  ['<Tab>'] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
    else
      fallback()
    end
  end,
  ['<S-Tab>'] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
    else
      fallback()
    end
  end
})

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = mapping,
  completion = { autocomplete = { cmp.TriggerEvent.TextChanged }, completeopt = 'menu,menuone,noinsert' },
  sources = cmp.config.sources({
    -- { name = 'ultisnips' }, { name = "vsnip" },
    { name = 'path' }, -- {name = 'nvim_lua'},
    { name = 'nvim_lsp' }, { name = 'luasnip' },
    -- {name = 'buffer'}
  }),
  preselect = false
}

-- cmp.setup.cmdline {mapping = mapping}
