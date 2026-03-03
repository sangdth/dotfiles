return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
  },

  config = function(_, opts)
    require("auto-session").setup(vim.tbl_deep_extend("force", opts, {
      bypass_save_filetypes = { "alpha", "dashboard", "noice", "notify" },
    }))
  end,
}
