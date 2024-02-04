local api = vim.api

local yank_group = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yank_group
})

local source_tmux = api.nvim_create_augroup("SourceTmux", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
  command = ":!tmux source %",
  pattern = ".tmux.conf",
  group = source_tmux,
})
