return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = { "lua", "vimdoc", "markdown", "markdown_inline", "bash", "python", "typescript" },
      auto_install = true,
    }
  end,
}
