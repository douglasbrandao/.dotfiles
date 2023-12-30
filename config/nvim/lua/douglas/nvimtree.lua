vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status then
  return
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

nvim_tree.setup({
  sort_by = "case_sensitive",
  sync_root_with_cwd = true,
  view = {
    adaptive_size = true,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-u>", action = "dir_up" },
        { key = "<C-d>", action = "dir_down" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  }
})
