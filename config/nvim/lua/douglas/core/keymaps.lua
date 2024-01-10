local utils = require('douglas.core.utils')
-- keymap("", "<Space>", "<Nop>", { silent = true })
-- vim.g.mapleader = " "

-- window navigation
--keymap("n", "<C-O>b", "<C-W>s", { silent = true }) -- horizontal splitting
--keymap("n", "<C-O>r", "<C-W>v", { silent = true }) -- vertical splitting
utils.keymap("n", "<C-K>", "<C-W>k", { silent = true }) -- move to the top window
utils.keymap("n", "<C-J>", "<C-W>j", { silent = true }) -- move to the bottom window
utils.keymap("n", "<C-H>", "<C-W>h", { silent = true }) -- move to the left window
utils.keymap("n", "<C-L>", "<C-W>l", { silent = true }) -- move to the right window
--keymap("n", "qq", "<C-W>q", { silent = true })     -- close the current window
-- keymap("n", "ca", "<C-W>o", { silent = true })     -- close all windows

-- window resizing
utils.keymap("n", "<C-Up>", ":resize -2<CR>", { silent = true })
utils.keymap("n", "<C-Down>", ":resize +2<CR>", { silent = true })
utils.keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
utils.keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- swap lines
utils.keymap("n", "<A-j>", ":m .+1<CR>", { silent = true })
utils.keymap("n", "<A-k>", ":m .-2<CR>", { silent = true })

-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
