local is_git_blame_status_ok, git_blame = pcall(require, "gitblame")
if not is_git_blame_status_ok then
  return
end

vim.g.gitblame_message_when_not_committed = 'This line hasn\'t been committed yet'
vim.g.gitblame_message_template = '<author>, <date> • <summary>'
