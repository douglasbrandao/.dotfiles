local utils = require('douglas.core.utils')

return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
          end
        end
      })

      local nvimtree = require('nvim-tree')

      nvimtree.setup({
        sort = {
          sorter = "case_sensitive",
        },
        sync_root_with_cwd = true,
        view = {
          adaptive_size = true,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
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
          update_root = true,
        }
      })

      -- keymaps
      vim.api.nvim_set_keymap("n", "<A-e>", ":NvimTreeToggle<CR>", { silent = true })
    end
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
      })
      utils.keymap("n", "-", "<CMD>Oil<CR>", { silent = true })
    end
  }
}
