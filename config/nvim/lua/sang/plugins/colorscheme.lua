return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  config = function()
    require("catppuccin").setup {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        cmp = true,
        hop = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        gitsigns = {
          enabled = true,
          transparent = false,
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender", -- catppuccin color. Default: text
          colored_indent_levels = false,
        },
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    }

    vim.cmd.colorscheme "catppuccin"
  end,
}
