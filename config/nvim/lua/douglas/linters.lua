local lint_status, lint = pcall(require, "lint")
if not lint_status then
  return
end

lint.linters_by_ft = {
  javascript = { "eslint_d", },
  typescript = { "eslint_d", },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
