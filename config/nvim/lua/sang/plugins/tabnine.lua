return {
  "tzachar/cmp-tabnine",
  event = "InsertEnter",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",

  config = function()
    local tabnine = require "cmp_tabnine.config"

    tabnine:setup {
      max_lines = 10,
      max_num_results = 20,
      sort = true,
      -- disable_auto_comment = true,
      -- accept_keymap = "<CR>",
      -- dismiss_keymap = "<Esc>",
      -- debounce_ms = 800,
      -- suggestion_color = { gui = "#808080", cterm = 244 },
      -- exclude_filetypes = { "TelescopePrompt", "NvimTree" },
      -- log_file_path = nil, -- absolute path to Tabnine log file
    }
  end,
}
