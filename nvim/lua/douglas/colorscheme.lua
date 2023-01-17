require("tokyonight").setup({
  style="night",
})

vim.cmd "colorscheme tokyonight"

local colorscheme = "tokyonight"

local is_status_ok, _ = pcall(vim.cmd, "colorscheme".. colorscheme)

if not is_status_ok then
  vim.notify("colorscheme" .. colorscheme .. "not found")
  return
end

