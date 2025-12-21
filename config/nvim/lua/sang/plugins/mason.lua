return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    require("mason").setup {
      ui = {
        border = "rounded",
      },
    }

    require("mason-tool-installer").setup {
      "eslint",
      "prettier",
    }
  end,
}
