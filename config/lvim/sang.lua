local S = {}

S.lazydocker_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazydocker = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazydocker:toggle()
end

return S
