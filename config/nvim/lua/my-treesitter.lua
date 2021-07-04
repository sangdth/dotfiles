local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python"
    },
    -- highlight = { -- cause the crash
    --     enable = true,
    --     use_languagetree = true
    -- },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true
    },
}
