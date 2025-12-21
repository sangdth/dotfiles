local M = {}

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"

function M.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

return M
