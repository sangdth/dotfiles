return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
  config = function()
    local icons = require "sang.utils.icons"
    local wk = require "which-key"

    wk.register {
      ["<leader>gj"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
      ["<leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
      ["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      ["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      ["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      ["<leader>gR"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      ["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      ["<leader>gu"] = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      ["<leader>gd"] = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    }

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
      current_line_blame_formatter = "<summary> [<author>, <author_time:%d.%m.%Y>]",
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
