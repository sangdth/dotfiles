local S = {}

S.toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazyjira = Terminal:new {
    cmd = "lazyjira",
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
  lazyjira:toggle()
end

return S
