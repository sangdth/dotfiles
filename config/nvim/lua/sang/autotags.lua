local M = {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = 'BufRead',
  config = function()
    require("nvim-ts-autotag").setup()
  end,
};

return M;
