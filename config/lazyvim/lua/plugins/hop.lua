return {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    lazy = true,

    config = function()
      require("hop").setup({
        keys = "asdghklqwertyuiopzxcvbnmfj1234567890",
      })
      vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true })
    end,
  },
}
