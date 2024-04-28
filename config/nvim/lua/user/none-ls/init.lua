local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  local services = require "user.utils.services"
  local lsp = require "user.lspconfig"
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics =  null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    -- on_attach = M.common_on_attach,
    -- on_init = M.common_on_init,
    -- on_exit = M.common_on_exit,
    capabilities = lsp.common_capabilities(),
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      null_ls.builtins.completion.spell,
    },
  }

  local formatters = {
    {
      exe = "prettier", -- prettier_d_slim somehow ignore the eslint rules
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "graphql", "json", "yaml" },
    },
  }
  local linters = {
    {
      exe = "eslint",
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
  }

  services.register_sources(linters, null_ls.methods.DIAGNOSTICS)
  services.register_sources(formatters, null_ls.methods.FORMATTING)
end

return M
