local M = {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufRead",
}

function M.config()
  require("nvim-ts-autotag").setup()
end

return M
