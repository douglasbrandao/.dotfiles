local is_cmp_status_ok, cmp = pcall(require, "cmp")
if not is_cmp_status_ok then
  return
end

local is_luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not is_luasnip_status_ok then
  return
end

local is_lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not is_lspkind_status_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  view = {
    entries = "native",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol',
      menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        nvim_lua = "[Lua]",
        luasnip = "[Luasnip]",
      }),
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-1),
    ['<C-f>'] = cmp.mapping.scroll_docs(1),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip', option = { show_autosnippets = true } }, -- For luasnip users.
    { name = 'buffer' },
    { name = 'path' },
  }),
  experimental = {
    ghost_text = true,
  }
})
