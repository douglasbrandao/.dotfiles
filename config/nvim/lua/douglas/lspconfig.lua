local mason_status, mason = pcall(require, "mason")

if not mason_status then
  return
end

local mason_lsp_config_status, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status then
  return
end

local lsp_config_status, lsp_config = pcall(require, "lspconfig")
if not lsp_config_status then
  return
end

mason.setup()

mason_lsp_config.setup({
  ensure_installed = { "lua_ls", "tsserver", "pylsp", "vimls" }
})


lsp_config.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lsp_config.tsserver.setup {}

lsp_config.pylsp.setup {}
