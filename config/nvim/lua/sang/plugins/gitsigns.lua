return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
  config = function()
    local icons = require "sang.utils.icons"

    require("gitsigns").setup {
      signs = {
        add = {
          text = icons.ui.BoldLineMiddle,
          -- hl = "GitSignsAdd",
          -- numhl = "GitSignsAddNr",
          -- linehl = "GitSignsAddLn",
        },
        change = {
          text = icons.ui.BoldLineMiddle,
          -- hl = "GitSignsChange",
          -- numhl = "GitSignsChangeNr",
          -- linehl = "GitSignsChangeLn",
        },
        delete = {
          text = icons.ui.TriangleShortArrowRight,
          -- hl = "GitSignsDelete",
          -- numhl = "GitSignsDeleteNr",
          -- linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          text = icons.ui.TriangleShortArrowRight,
          -- hl = "GitSignsDelete",
          -- numhl = "GitSignsDeleteNr",
          -- linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          text = icons.ui.BoldLineMiddle,
          -- hl = "GitSignsChange",
          -- numhl = "GitSignsChangeNr",
          -- linehl = "GitSignsChangeLn",
        },
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_formatter = "[<author> | <author_time:%d.%m.%Y>] <summary>",
      update_debounce = 200,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    }
  end,
}
