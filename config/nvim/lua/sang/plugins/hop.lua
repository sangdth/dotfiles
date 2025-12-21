local M = {
  "smoka7/hop.nvim",
  version = "*",
  event = "BufRead",
  lazy = true,
}

function M.config()
  require("hop").setup {
    keys = "asdghklqwertyuiopzxcvbnmfj1234567890",
  }
  vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true })
end

return M
