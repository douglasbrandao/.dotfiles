return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local neodev = require('neodev')

    neodev.setup({})

    local lspconfig = require('lspconfig')

    mason.setup({})

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "tsserver", "pylsp", "vimls" },
      automatic_installation = true,
    })

    -- lspconfigs
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
            disable = { "missing-parameters", "missing-fields" },
          },
          completion = {
            callSnippet = "Replace",
          },
        }
      }
    })

    lspconfig.tsserver.setup({})
    lspconfig.pylsp.setup({})
    lspconfig.vimls.setup({})
  end
}
