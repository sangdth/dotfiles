local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "lua", "vimdoc", "markdown", "markdown_inline", "bash", "python", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
    sync_install = false,
    auto_install = true,
  }
end

return M
