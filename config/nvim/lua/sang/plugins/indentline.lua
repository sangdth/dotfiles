return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require "sang.utils.icons"
    return {
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
          "quickfix",
          "prompt",
        },
        filetypes = {
          "",
          "checkhealth",
          "dashboard",
          "gitcommit",
          "help",
          "lazy",
          "lspinfo",
          "man",
          "neogitstatus",
          "NvimTree",
          "startify",
          "TelescopePrompt",
          "TelescopeResults",
          "Trouble",
          "text",
        },
      },
    }
  end,
  config = function(_, opts)
    require("ibl").setup(opts)
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  end,
}
