local api = vim.api
local luv = vim.loop

local open_mode = luv.constants.O_CREAT + luv.constants.O_WRONLY + luv.constants.O_TRUNC

local H = {}

function H.split(str, sep)
    if sep == nil then
        sep = "%s"
    end
    local tempTable = {}
    for word in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(tempTable, word)
    end
    return tempTable
end

-- Copy from nvim-tree:
-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/lua/nvim-tree/fs.lua
function H.create_file(file)
  luv.fs_open(file, "w", open_mode, vim.schedule_wrap(function(err, fd)
    if err then
      api.nvim_err_writeln('Couldn\'t create file '..file)
    else
      luv.fs_chmod(file, 420)
      luv.fs_close(fd)
    end
  end))
end

return H
