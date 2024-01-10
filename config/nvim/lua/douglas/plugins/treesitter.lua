return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local nvim_treesitter_configs = require('nvim-treesitter.configs')
    nvim_treesitter_configs.setup {
      ensure_installed = { "lua", "vim", "python", "javascript", "typescript" },
      auto_install = true,
      sync_install = false,
      ignore_install = { "" },
      highlight = {
        enable = true,
      },
      indent = { enable = true }
    }
  end
}
