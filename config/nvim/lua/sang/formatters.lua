local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local conform = require "conform"
  -- local wk = require "which-key"

  conform.setup {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      svelte = { "prettier" },
      lua = { "stylua" },
      rust = { "rustfmt" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  }

  -- wk.register {
  --   l = {
  --     f = {
  --       function()
  --         print "formatted"
  --         conform.format {
  --           lsp_fallback = true,
  --           async = false,
  --           timeout_ms = 500,
  --         }
  --       end,
  --       "Format file or selected range",
  --     },
  --   },
  -- }
end

return M
