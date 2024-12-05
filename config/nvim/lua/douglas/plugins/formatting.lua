return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' }
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 2500,
    },
  }
}
