return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "tsserver", "pylsp", "vimls" }
    })

    -- lspconfigs
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }

    lspconfig.tsserver.setup {}

    lspconfig.pylsp.setup {}
  end
}
