return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
    'f-person/git-blame.nvim',
  },
  config = function()
    local noice = require('noice')
    local notify = require('notify')
    local lualine = require('lualine')
    local gitblame = require('gitblame')

    noice.setup({})

    notify.setup({
      background_colour = "#000000",
      level = 2,
      minimum_width = 50,
      max_width = 80,
      render = "wrapped-compact",
      stages = "fade",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 500,
      top_down = true
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
