return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  config = function()
    local icons = require "sang.utils.icons"

    require("ibl").setup {
      debounce = 100,
      indent = {
        char = icons.ui.LineMiddle,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        buftypes = {
          "terminal",
          "nofile",
        },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "text",
        },
      },
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  end,
}
