local function myprogress()
  local cur = vim.fn.line "."
  local total = vim.fn.line "$"

  -- Calculate the number of digits in total
  local digits = math.floor(math.log10(total)) + 1

  -- Format the current line number with leading zeros
  local format_str = "%0" .. digits .. "d/%d"

  return string.format(format_str, cur, total)
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = { "NvimTree" },
        disabled_filetypes = { statusline = { "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = { "diagnostics" },
        -- lualine_x = {
        --   {
        --     "lsp_status",
        --     icon = "",
        --     symbols = {
        --       -- Standard unicode symbols to cycle through for LSP progress:
        --       spinner = {
        --         "󰐽",
        --         "󰀚",
        --         "󰀚",
        --         "󰐾",
        --         "󰐾",
        --         "󰐾",
        --         "󰗝",
        --         "󰗝",
        --         "󰗝",
        --         "󰗝",
        --       },
        --       done = "󰄳",
        --       -- Delimiter inserted between LSP names:
        --       separator = " ",
        --       color = { fg = "green" },
        --     },
        --     -- List of LSP names to ignore (e.g., `null-ls`):
        --     ignore_lsp = {},
        --   },
        --   "filetype",
        -- },
        lualine_x = {
          {
            function()
              -- Check if MCPHub is loaded
              if not vim.g.loaded_mcphub then
                return "󰐻 -"
              end

              local count = vim.g.mcphub_servers_count or 0
              local status = vim.g.mcphub_status or "stopped"
              local executing = vim.g.mcphub_executing

              -- Show "-" when stopped
              if status == "stopped" then
                return "󰐻 -"
              end

              -- Show spinner when executing, starting, or restarting
              if executing or status == "starting" or status == "restarting" then
                local frames = { "󰐽", "󰀚", "󰀚", "󰐾", "󰐾", "󰐾", "󰗝", "󰗝", "󰗝", "󰗝" }

                local frame = math.floor(vim.loop.now() / 100) % #frames + 1
                return "󰐻 " .. frames[frame]
              end

              return "󰐻 " .. count
            end,
            color = function()
              if not vim.g.loaded_mcphub then
                return { fg = "#6c7086" } -- Gray for not loaded
              end

              local status = vim.g.mcphub_status or "stopped"
              if status == "ready" or status == "restarted" then
                return { fg = "#50fa7b" } -- Green for connected
              elseif status == "starting" or status == "restarting" then
                return { fg = "#ffb86c" } -- Orange for connecting
              else
                return { fg = "#ff5555" } -- Red for error/stopped
              end
            end,
          },
        },
        lualine_y = { myprogress },
        lualine_z = {},
      },
      extensions = { "quickfix", "man", "fugitive" },
    }
  end,
}
