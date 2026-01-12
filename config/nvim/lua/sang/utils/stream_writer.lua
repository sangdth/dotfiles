local uv = vim.uv or vim.loop
local ns = vim.api.nvim_create_namespace "sang_stream_writer"

local defaults = {
  chunk_size = 8,
  interval = 12,
  initial_delay = 0,
  join_undo = true,
}

local sessions = {}

local function normalize_text(text)
  if type(text) == "table" then
    return table.concat(text, "\n")
  end
  return text
end

local function chunkify(str, size)
  local out = {}
  local total = vim.fn.strchars(str)
  local offset = 0
  while offset < total do
    out[#out + 1] = vim.fn.strcharpart(str, offset, size)
    offset = offset + size
  end
  return out
end

local function stop_session(bufnr)
  local session = sessions[bufnr]
  if not session then
    return
  end
  if session.timer then
    pcall(session.timer.stop, session.timer)
    pcall(session.timer.close, session.timer)
  end
  if session.mark and vim.api.nvim_buf_is_valid(bufnr) then
    pcall(vim.api.nvim_buf_del_extmark, bufnr, ns, session.mark)
  end
  sessions[bufnr] = nil
end

local function finish(bufnr, session, row, col)
  stop_session(bufnr)
  if session and session.opts.on_done then
    pcall(session.opts.on_done, bufnr, row, col)
  end
end

local function next_pos(lines, row, col)
  if #lines > 1 then
    return row + #lines - 1, #lines[#lines]
  end
  return row, col + #lines[1]
end

local M = {}

function M.setup(opts)
  defaults = vim.tbl_extend("force", defaults, opts or {})
  vim.api.nvim_create_autocmd({ "BufWipeout", "BufUnload" }, {
    callback = function(args)
      stop_session(args.buf)
    end,
  })
end

function M.stop(bufnr)
  stop_session(bufnr or vim.api.nvim_get_current_buf())
end

function M.active(bufnr)
  return sessions[bufnr or vim.api.nvim_get_current_buf()] ~= nil
end

function M.stream(opts)
  opts = opts or {}
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
    return nil, "invalid buffer"
  end
  if vim.bo[bufnr].readonly or not vim.bo[bufnr].modifiable then
    return nil, "buffer is not modifiable"
  end

  local text = normalize_text(opts.text or opts.lines)
  if not text or text == "" then
    return nil, "no text to stream"
  end

  stop_session(bufnr)

  local cfg = vim.tbl_extend("force", defaults, opts)
  cfg.chunk_size = math.max(1, cfg.chunk_size or defaults.chunk_size)

  local row, col
  if cfg.pos then
    row = (cfg.pos[1] or 1) - 1
    col = cfg.pos[2] or 0
  else
    local cur = vim.api.nvim_win_get_cursor(cfg.win or 0)
    row = cur[1] - 1
    col = cur[2]
  end

  local mark = vim.api.nvim_buf_set_extmark(bufnr, ns, row, col, { right_gravity = false })
  local queue = chunkify(text, cfg.chunk_size)

  local session = {
    bufnr = bufnr,
    mark = mark,
    queue = queue,
    timer = uv.new_timer(),
    opts = cfg,
  }
  sessions[bufnr] = session

  local function step()
    if not sessions[bufnr] then
      return
    end
    if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
      return finish(bufnr, session)
    end
    if vim.bo[bufnr].readonly or not vim.bo[bufnr].modifiable then
      return finish(bufnr, session)
    end

    local chunk = table.remove(queue, 1)
    if not chunk then
      return finish(bufnr, session)
    end

    local pos = vim.api.nvim_buf_get_extmark_by_id(bufnr, ns, mark, { details = true })
    if not pos then
      return finish(bufnr, session)
    end

    local r, c = pos[1], pos[2]
    local lines = vim.split(chunk, "\n", { plain = true, trimempty = false })

    if session.opts.join_undo then
      pcall(vim.cmd, "undojoin")
    end

    vim.api.nvim_buf_set_text(bufnr, r, c, r, c, lines)

    r, c = next_pos(lines, r, c)
    vim.api.nvim_buf_set_extmark(bufnr, ns, r, c, { id = mark, right_gravity = false })

    if session.opts.on_step then
      pcall(session.opts.on_step, bufnr, r, c, chunk)
    end

    if #queue == 0 then
      finish(bufnr, session, r, c)
    end
  end

  session.timer:start(cfg.initial_delay or 0, cfg.interval or defaults.interval, function()
    vim.schedule(step)
  end)

  return {
    stop = function()
      stop_session(bufnr)
    end,
  }
end

return M
