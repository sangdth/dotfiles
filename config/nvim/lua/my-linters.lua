local lint = require "lint"

lint.linters.eslint.cmd = "/Users/sangdang/.nvm/versions/node/v14.15.2/bin/eslint_d"

lint.linters_by_ft = {
  javascript = {"eslint"},
  javascriptreact = {"eslint"},
  typescript = {"eslint"},
  typescriptreact = {"eslint"},
}

vim.cmd([[au BufEnter *.js lua require('lint').try_lint() ]])
vim.cmd([[au BufWritePost *.js lua require('lint').try_lint() ]])
