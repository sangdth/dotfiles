local M = {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "BufRead",
}

function M.config()
  require("nvim-ts-autotag").setup {
    did_setup = false,
  }
end

return M
