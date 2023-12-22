local git_blame_status, git_blame = pcall(require, "gitblame")

if not git_blame_status then
  return
end

vim.g.gitblame_message_when_not_committed = 'This line hasn\'t been committed yet'
vim.g.gitblame_message_template = '<author>, <date> • <summary>'
