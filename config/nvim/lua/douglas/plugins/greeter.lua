return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#DA4939" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FF875F" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFC66D" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#00FF03" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#00AFFF" })
    -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#8800FF" })

    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#f5e0dc" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#f2cdcd" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#f5c2e7" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#cba6f7" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#eba0ac" })

    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      { type = "text", val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ", opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ", opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ", opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ", opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" } },
      { type = "text", val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ", opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" } },
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("b", " " .. " File browser", ":NvimTreeFocus <CR>"),
      dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.config)
  end
}
