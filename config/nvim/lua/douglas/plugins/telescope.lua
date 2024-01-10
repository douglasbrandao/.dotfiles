local utils = require('douglas.core.utils')

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'ThePrimeagen/harpoon',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.load_extension('harpoon')

    -- keymaps
    vim.keymap.set('n', '<C-P>', builtin.find_files, {})
    vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
    vim.keymap.set('n', '<C-B>', builtin.buffers, {})

    -- harpoon
    utils.keymap("n", [[hm]], ":Telescope harpoon marks<CR>")
  end
}
