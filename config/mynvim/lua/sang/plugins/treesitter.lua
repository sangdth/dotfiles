return {
  "nvim-treesitter/nvim-treesitter",
  lazy = vim.fn.argc(-1) == 0,
  build = ":TSUpdate",
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
  end,
  config = function()
    local configs = require "nvim-treesitter.configs"
    ---@diagnostic disable-next-line: missing-fields
    configs.setup {
      ensure_installed = { "lua", "vimdoc", "markdown", "markdown_inline", "bash", "python", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
      auto_install = true,
    }
  end,
}
