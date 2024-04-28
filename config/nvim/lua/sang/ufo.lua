local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufRead",
  lazy = true,
}

function M.config()
  require("ufo").setup {
    provider_selector = function() -- (bfnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  }
end

return M
