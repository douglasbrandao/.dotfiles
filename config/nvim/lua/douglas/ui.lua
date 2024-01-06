local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
  return
end

local git_blame_status, git_blame = pcall(require, "gitblame")

if not git_blame_status then
  return
end

local noice_status, noice = pcall(require, "noice")

if not noice_status then
  return
end

local notify_status, notify = pcall(require, "notify")

if not notify_status then
  return
end

vim.g.gitblame_message_when_not_committed = 'This line hasn\'t been committed yet'
vim.g.gitblame_message_template = '<author>, <date> • <summary>'
vim.g.gitblame_display_virtual_text = 0

noice.setup({})

notify.setup({
  background_colour = "#000000"
})

lualine.setup({
  sections = {
    lualine_c = {
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
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
