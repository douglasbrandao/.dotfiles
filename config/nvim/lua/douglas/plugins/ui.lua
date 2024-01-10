return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "folke/noice.nvim",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    'f-person/git-blame.nvim',
  },
  config = function()
    local noice = require('noice')
    local notify = require('notify')
    local lualine = require('lualine')
    local gitblame = require('gitblame')

    notify.setup({
      background_colour = "#000000"
    })

    lualine.setup({
      sections = {
        lualine_c = {
          { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available }
        },
        lualine_x = {
          {
            noice.api.statusline.mode.get,
            cond = noice.api.statusline.mode.has,
            color = { fg = "ff9e64" },
          }
        }
      }
    })

    -- gitblame config
    vim.g.gitblame_message_when_not_committed = 'This line hasn\'t been committed yet'
    vim.g.gitblame_message_template = '<author>, <date> • <summary>'
    vim.g.gitblame_display_virtual_text = 0
  end
}
