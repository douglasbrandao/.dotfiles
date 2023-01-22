function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- keymap("", "<Space>", "<Nop>", { silent = true })
-- vim.g.mapleader = " "

-- window navigation
keymap("n", "<C-O>b", "<C-W>s", { silent = true }) -- horizontal splitting 
keymap("n", "<C-O>r", "<C-W>v", { silent = true }) -- vertical splitting
keymap("n", "<C-K>", "<C-W>k", { silent = true }) -- move to the top window
keymap("n", "<C-J>", "<C-W>j", { silent = true }) -- move to the bottom window
keymap("n", "<C-H>", "<C-W>h", { silent = true }) -- move to the left window
keymap("n", "<C-L>", "<C-W>l", { silent = true }) -- move to the right window
keymap("n", "qq", "<C-W>q", { silent = true }) -- close the current window
keymap("n", "ca", "<C-W>o", { silent = true }) -- close all windows

-- window resizing
keymap("n", "<C-Up>", ":resize -2<CR>", { silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- swap lines
keymap("n", "<A-j>", ":m .+1<CR>", { silent = true })
keymap("n", "<A-k>", ":m .-2<CR>", { silent = true })

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-P>', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvimtree
keymap("n", "<A-e>", ":NvimTreeToggle<CR>", { silent = true })
