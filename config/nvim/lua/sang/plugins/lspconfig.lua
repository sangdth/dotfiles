local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim" },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "gla", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
  keymap(bufnr, "n", "glj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap(bufnr, "n", "glk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
end

M.on_attach = function(_, bufnr)
  lsp_keymaps(bufnr)
end

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

local border = require "sang.utils.border"

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
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
      },
      -- copied from doc
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        [vim.diagnostic.severity.WARN] = "WarningMsg",
        [vim.diagnostic.severity.INFO] = "InfoMsg",
        [vim.diagnostic.severity.HINT] = "HintMsg",
      },
    },
    virtual_text = {
      prefix = "󰌵", -- Default ■
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      -- border = border,
      -- source = "always",
      header = "",
      prefix = "",
    },
  }

  -- for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values")) do
  --   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  -- end

  -- local colors = require("catppuccin.palettes").get_palette()
  -- why the color has 0 effect here?
  -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=#333 guibg=#333]]

  -- Setup on_attach via LspAttach autocmd
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(nil, args.buf)
    end,
  })

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

  for _, server in pairs(servers) do
    local opts = {
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "sang.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup()
    end

    if server == "ts_ls" then
      local lspconfig_util = require("lspconfig.util")
      opts.root_dir = lspconfig_util.root_pattern("package.json", ".git")
    end

    vim.lsp.config(server, opts)
  end

  vim.lsp.enable(servers)
end

return M
