-- https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({})

    -- keymaps
    vim.keymap.set("n", "<C-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
    vim.keymap.set("n", "<C-F>", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>gs", "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>km", "<cmd>lua require('fzf-lua').keymaps()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>ht", "<cmd>lua require('fzf-lua').help_tags()<CR>", { silent = true })
    vim.keymap.set("n", "<leader>rg", "<cmd>lua require('fzf-lua').registers()<CR>", { silent = true })
  end
}
