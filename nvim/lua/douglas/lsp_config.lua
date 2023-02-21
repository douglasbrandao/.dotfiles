local is_mason_status_ok, mason = pcall(require, "mason")
if not is_mason_status_ok then
  return
end

local is_mason_lsp_config_status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not is_mason_lsp_config_status_ok then
  return
end

local is_lsp_config_status_ok, lsp_config = pcall(require, "lspconfig")
if not is_lsp_config_status_ok then
  return
end

mason.setup()

mason_lsp_config.setup({
  ensure_installed = { "lua_ls", "tsserver", "terraformls", "pylsp" }
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

lsp_config.pylsp.setup {}

lsp_config.tsserver.setup {}

lsp_config.pylsp.setup {}
