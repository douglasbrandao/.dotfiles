local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
  return
end

local git_blame_status, git_blame = pcall(require, "gitblame")

if not git_blame_status then
  return
end

vim.g.gitblame_message_when_not_committed = 'This line hasn\'t been committed yet'
vim.g.gitblame_message_template = '<author>, <date> • <summary>'
vim.g.gitblame_display_virtual_text = 0

lualine.setup({
  sections = {
    lualine_c = {
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
    }
  }
})

