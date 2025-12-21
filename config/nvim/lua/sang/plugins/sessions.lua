return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
  },

  config = function()
    require("auto-session").setup {
      bypass_save_filetypes = { "alpha", "dashboard", "noice", "notify" }, -- or whatever dashboard you use
    }
  end,
}
