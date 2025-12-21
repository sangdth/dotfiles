return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  -- uncomment the following line to load hub lazily
  --cmd = "MCPHub",  -- lazy load
  build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  config = function()
    require("mcphub").setup()

    -- local lualine = require "lualine"
    -- local config = lualine.get_config()
    -- table.insert(config.sections.lualine_x, require "mcphub.extensions.lualine")
    -- require("lualine").setup(config)
  end,
}
