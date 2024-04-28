local M = {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
}

function M.config()
  require("treesj").setup {
    use_default_keymaps = false,
    max_join_length = 99,
  }
end

return M
