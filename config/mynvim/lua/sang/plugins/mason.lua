return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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

    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
        "rust_analyzer",
      },
    }
  end
}
