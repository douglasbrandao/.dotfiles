return {
  -- https://github.com/tpope/vim-fugitive
  {
    'tpope/vim-fugitive'
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')

      gitsigns.setup {
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%d/%m/%Y> - <summary>',
      }

      -- mapping
      vim.keymap.set('n', '<leader>gp', ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set('n', '<leader>gt', ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  }
}
