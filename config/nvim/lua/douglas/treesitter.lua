local config_status, configs = pcall(require, "nvim-treesitter.configs")
if not config_status then
  return
end

configs.setup {
  ensure_installed = { "lua", "vim", "python", "javascript", "typescript" },
  auto_install = true,
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
  },
  indent = { enable = true }
}
