local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/lazydev.nvim" },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap("n", "gI", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "gla", vim.lsp.buf.code_action, opts)
  keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
  keymap("n", "glj", vim.diagnostic.goto_next, opts)
  keymap("n", "glk", vim.diagnostic.goto_prev, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    lsp_keymaps(ev.buf)

    -- Esc: close hover floats
    vim.keymap.set("n", "<Esc>", function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
          pcall(vim.api.nvim_win_close, win, true)
        end
      end
    end, { buffer = ev.buf, noremap = true, silent = true })

    -- Space Space: show hover docs
    vim.keymap.set("n", "<Space><Space>", function()
      vim.lsp.buf.hover { focusable = false, silent = true }
    end, { buffer = ev.buf, noremap = true, silent = true })

    -- gd inside hover floats: grab word, close float, search workspace symbols
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        local win = vim.api.nvim_get_current_win()
        if vim.api.nvim_win_get_config(win).relative == "" then return end
        local buf = vim.api.nvim_get_current_buf()
        if vim.b[buf].float_gd_mapped then return end
        vim.b[buf].float_gd_mapped = true
        vim.keymap.set("n", "gd", function()
          local word = vim.fn.expand "<cword>"
          for _, w in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(w).relative ~= "" then
              pcall(vim.api.nvim_win_close, w, true)
            end
          end
          vim.schedule(function()
            require("telescope.builtin").lsp_workspace_symbols { default_text = word }
          end)
        end, { buffer = buf, noremap = true, silent = true })
      end,
    })

  end,
})

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  -- Add cmp-nvim-lsp capabilities if available
  local cmp_nvim_lsp = require "cmp_nvim_lsp"
  if cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities then
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
  end

  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
end

function M.config()
  local icons = require "sang.utils.icons"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "ts_ls", -- Changed from tsserver
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "gopls",
    "rust_analyzer",
    "marksman", -- Markdown LSP
    "tailwindcss", -- Tailwind CSS LSP
  }

  vim.diagnostic.config {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
      },
    },
    virtual_text = {
      prefix = "󰌵",
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      header = "",
      prefix = "",
    },
  }

  for _, server in pairs(servers) do
    local opts = {
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "sang.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("lazydev").setup()
    end

    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(servers)
end

return M
