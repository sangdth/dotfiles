local function myprogress()
  local cur = vim.fn.line "."
  local total = vim.fn.line "$"

  -- Calculate the number of digits in total
  local digits = math.floor(math.log10(total)) + 1

  -- Format the current line number with leading zeros
  local format_str = "%0" .. digits .. "d/%d"

  return string.format(format_str, cur, total)
end

-- Cache for claudecode connection status (updated async)
local claude_connected_cache = false
local claude_cache_timer = nil

local function update_claude_status()
  vim.schedule(function()
    local ok, claudecode = pcall(require, "claudecode")
    if ok and claudecode.is_claude_connected then
      claude_connected_cache = claudecode.is_claude_connected()
    end
  end)
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Start async timer to update claude status every 2 seconds
    claude_cache_timer = vim.loop.new_timer()
    claude_cache_timer:start(0, 2000, vim.schedule_wrap(update_claude_status))

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
        lualine_z = {
          {
            function()
              -- Use cached value instead of blocking call
              return claude_connected_cache and "" or ""
            end,
            icon = "🤖",
          },
        },
      },
      extensions = { "quickfix", "man", "fugitive" },
    }
  end,
}
