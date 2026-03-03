local M = {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "sj", "<cmd>TSJSplit<CR>" },
    { "sk", "<cmd>TSJJoin<CR>" },
  },
}

function M.config()
  require("treesj").setup {
    use_default_keymaps = false,
    max_join_length = 99,
  }
end

return M
