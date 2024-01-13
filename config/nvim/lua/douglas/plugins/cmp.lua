return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets'
  },
  event = "InsertEnter",
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require("luasnip/loaders/from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-1),
        ['<C-f>'] = cmp.mapping.scroll_docs(1),
        ['<C-Space>'] = cmp.mapping.complete(),            -- show completion suggestion
        ['<C-e>'] = cmp.mapping.abort(),                   -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP
          { name = 'luasnip', option = { show_autosnippets = true } },
        },
        {
          { name = 'buffer' }, -- text within the current buffer
          { name = 'path' },   -- file system path
        })
    })
  end
}
