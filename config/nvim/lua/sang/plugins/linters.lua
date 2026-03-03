return {
  "mfussenegger/nvim-lint",
  event = { "BufNewFile", "BufReadPost", "BufReadPre" },
  opts = {
    -- Event to trigger linters
    events = { "BufWritePost", "BufReadPost" },
    linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      python = { "ruff" },
      -- ['_'] = { 'fallback linter' },
    },
  },

  config = function(_, opts)
    local M = {}
    local lint = require "lint"

    lint.linters_by_ft = opts.linters_by_ft

    function M.lint()
      local names = lint._resolve_linter_by_ft(vim.bo.filetype)
      names = vim.list_extend({}, names)

      -- Swap eslint for biomejs when biome.json is in the project
      local has_biome = vim.fs.find({ "biome.json", "biome.jsonc" }, {
        upward = true,
        path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h"),
      })[1]
      if has_biome then
        names = vim.tbl_filter(function(name) return name ~= "eslint" end, names)
        table.insert(names, "biomejs")
      end

      -- Add fallback linters.
      if #names == 0 then
        vim.list_extend(names, lint.linters_by_ft["_"] or {})
      end

      -- Add global linters.
      vim.list_extend(names, lint.linters_by_ft["*"] or {})

      -- Filter out linters that don't exist or don't match the condition.
      local ctx = { filename = vim.api.nvim_buf_get_name(0) }
      ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
      names = vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        if not linter then
          -- TODO Find a way to show message
          -- LazyVim.warn("Linter not found: " .. name, { title = "nvim-lint" })
        end
        return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
      end, names)

      -- Run linters.
      if #names > 0 then
        lint.try_lint(names)
      end
    end

    function M.debounce(ms, fn)
      local timer = vim.uv.new_timer()
      return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
          timer:stop()
          vim.schedule_wrap(fn)(unpack(argv))
        end)
      end
    end

    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = M.debounce(100, M.lint),
    })
  end,
}
