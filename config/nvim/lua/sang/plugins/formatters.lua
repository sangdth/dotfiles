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
      python = { "isort", "black" },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      local ignore_filetypes = { "sql", "java" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return {}
      end
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return {}
      end
      return {
        -- async = false,
        lsp_fallback = true,
        timeout_ms = 500,
      }
    end,
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
