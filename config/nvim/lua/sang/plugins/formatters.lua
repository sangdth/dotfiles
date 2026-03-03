return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local conform = require "conform"

    -- Use biome when biome.json is in the project, otherwise prettier
    local function biome_or_prettier(bufnr)
      if vim.fs.find({ "biome.json", "biome.jsonc" }, {
        upward = true,
        path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":h"),
      })[1] then
        return { "biome" }
      end
      return { "prettier" }
    end

    conform.setup {
      formatters_by_ft = {
        javascript = biome_or_prettier,
        typescript = biome_or_prettier,
        javascriptreact = biome_or_prettier,
        typescriptreact = biome_or_prettier,
        css = biome_or_prettier,
        json = biome_or_prettier,
        graphql = biome_or_prettier,
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        svelte = { "prettier" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
      },
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return {}
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return {}
        end
        return {
          -- async = false,
          lsp_format = "fallback",
          timeout_ms = 500,
        }
      end,
    }
  end,
}
