return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    local noice = require('noice')
    local notify = require('notify')
    local lualine = require('lualine')

    noice.setup({
      cmdline = {
        enabled = true,
      },
      messages = {
        enabled = true,
      },
      popupmenu = {
        enabled = true,
      }
    })

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
      timeout = 2500,
      top_down = true
    })

    lualine.setup({
      options = {
        theme = 'catppuccin',
        -- theme = 'gruvbox',
      },
      sections = {
        lualine_x = {
          -- {
          --   noice.api.status.message.get_hl,
          --   cond = noice.api.status.message.has,
          -- },
          {
            noice.api.status.command.get,
            cond = noice.api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            noice.api.statusline.mode.get,
            cond = noice.api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          -- {
          --   noice.api.status.mode.get,
          --   cond = noice.api.status.mode.has,
          --   color = { fg = "#ff9e64" },
          -- },
          -- {
          --   noice.api.status.search.get,
          --   cond = noice.api.status.search.has,
          --   color = { fg = "#ff9e64" },
          -- },
        },
        -- lualine_c = {
        --   { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available }
        -- },
      }
    })
  end
}
