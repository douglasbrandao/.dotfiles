return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' }
      },
      format_on_save = {
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    })
  end,
}
