return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup {
      options = {
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = { "NvimTree" },
        disabled_filetypes = { statusline = { "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = { "diagnostics" },
        lualine_x = { "copilot", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {},
      },
      extensions = { "quickfix", "man", "fugitive" },
    }
  end,
}
