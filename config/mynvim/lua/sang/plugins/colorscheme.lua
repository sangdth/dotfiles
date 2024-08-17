return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        hop = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "pink", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
      }
    })

    vim.cmd.colorscheme "catppuccin"
  end
}

