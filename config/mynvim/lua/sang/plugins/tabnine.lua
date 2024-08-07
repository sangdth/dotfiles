return {
  "tzachar/cmp-tabnine",
  event = "InsertEnter",
  build = "./install.sh",
  dependencies = "hrsh7th/nvim-cmp",

  -- config = function()
  --   require("tabnine").setup {
  --     disable_auto_comment = true,
  --     accept_keymap = "<Right>",
  --     dismiss_keymap = "<Left>",
  --     debounce_ms = 800,
  --     suggestion_color = { gui = "#808080", cterm = 244 },
  --     exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  --     log_file_path = nil, -- absolute path to Tabnine log file
  --   }
  -- end,
}
