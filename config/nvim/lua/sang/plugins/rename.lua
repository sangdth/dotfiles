local M = {
  -- https://github.com/smjonas/inc-rename.nvim#readme
  "smjonas/inc-rename.nvim",
  event = "BufRead",
  config = function()
    require("inc_rename").setup {
      show_message = true,
      cmd_name = "IncRename",
      hl_group = "Substitute",
      preview_empty_name = false,
    }

    vim.keymap.set("n", "rn", function()
      return ":IncRename " .. vim.fn.expand "<cword>"
    end, { expr = true })
  end,
}

return M
