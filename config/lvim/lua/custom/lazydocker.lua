local S = {}

S.toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazydocker = Terminal:new {
    cmd = "lazydocker",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 1000,
      height = 100,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    -- on_close = function(_) end,
    count = 99,
  }
  lazydocker:toggle()
end

return S
