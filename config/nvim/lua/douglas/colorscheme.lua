local status, _ = pcall(vim.cmd, "colorscheme tokyonight")

if not status then
  vim.notify("colorscheme not found")
  return
end

require("tokyonight").setup({
  style="night",
})

vim.cmd "colorscheme tokyonight"
