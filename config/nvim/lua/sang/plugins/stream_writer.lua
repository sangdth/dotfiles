return {
  name = "stream-writer-local",
  dir = vim.fn.stdpath "config",
  lazy = false,
  config = function()
    local streamer = require "sang.utils.stream_writer"
    streamer.setup()

    local function resolve_text(cmd)
      if cmd.args ~= "" then
        local reg = cmd.args:match "^@(.+)$"
        if reg then
          return vim.fn.getreg(reg)
        end
        return cmd.args
      end
      return vim.fn.getreg '"'
    end

    vim.api.nvim_create_user_command("StreamWrite", function(cmd)
      local text = resolve_text(cmd)
      local ok, err = streamer.stream {
        text = text,
        bufnr = 0,
        pos = cmd.range > 0 and { cmd.line1, 0 } or nil,
      }
      if not ok and err then
        vim.notify(("StreamWrite: %s"):format(err), vim.log.levels.WARN)
      end
    end, {
      nargs = "*",
      range = true,
      desc = "Stream-insert text (args, @<reg>, or unnamed register)",
    })

    vim.api.nvim_create_user_command("StreamStop", function(cmd)
      local target = cmd.args ~= "" and tonumber(cmd.args) or nil
      streamer.stop(target)
    end, {
      nargs = "?",
      desc = "Stop any active stream in the current buffer (or bufnr)",
    })
  end,
}
