return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        max_join_length = 99,
      })
    end,
  },
}
