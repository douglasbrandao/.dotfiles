local is_status_ok, _ = pcall(vim.cmd, "colorscheme tokyonight")

if not is_status_ok then
  vim.notify("colorscheme not found")
  return
end

require("tokyonight").setup({
  style="night",
})

vim.cmd "colorscheme tokyonight"
