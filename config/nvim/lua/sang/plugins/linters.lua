local M = {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
}

function M.config()
  local lint = require "lint"

  lint.linters_by_ft = {
    javascript = { "eslint" },
    typescript = { "eslint" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },
    svelte = { "eslint" },
    python = { "ruff" },
  }

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })

  vim.keymap.set("n", "<leader>le", function()
    lint.try_lint()
  end, { desc = "Trigger linting for current file" })

  -- Set pylint to work in virtualenv
  -- lint.linters.pylint.cmd = "python"
  -- lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }
end

return M
