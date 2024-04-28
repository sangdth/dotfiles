local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local conform = require "conform"
  -- local wk = require "which-key"

  conform.setup {
    formatters_by_ft = {
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      graphql = { "prettierd" },
      lua = { "stylua" },
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
