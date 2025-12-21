return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    local icons = require "sang.utils.icons"

    require("lspsaga").setup {
      ui = {
        code_action = icons.ui.Lightbulb,
      },
      code_action = {
        keys = {
          quit = "<Esc>",
        },
      },
    }
  end,
}
