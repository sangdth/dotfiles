local M = {
  "echasnovski/mini.nvim",
  version = "*",
  event = "BufRead",
  lazy = true,
  config = function()
    require("mini.cursorword").setup { delay = 100 }

    require("mini.surround").setup {
      mappings = {
        add = "as", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        replace = "cs", -- Replace surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        update_n_lines = "", -- Update `n_lines`
      },
      search_method = "cover_or_next",
    }
  end,
}

return M
