return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      lua = { "stylua" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
