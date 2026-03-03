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

    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "ts_ls",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
        "tailwindcss",
      },
    }

    require("mason-tool-installer").setup {
      ensure_installed = {
        "biome",
        "eslint",
        "prettier",
      },
    }
  end,
}
