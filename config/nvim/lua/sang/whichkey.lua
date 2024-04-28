local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    q = { "<cmd>lua require 'sang.bufferline'.buf_kill 'bd'<CR>", "Close buffer" },
    h = { "<cmd>nohlsearch<CR>", "NOHL" },
    [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
    v = { "<cmd>vsplit<CR>", "Split" },
    b = { name = "Buffers" },
    d = { name = "Debug" },
    f = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" },
    g = {
      name = "Git",
      g = { "<cmd>lua require 'sang.toggleterm'.lazygit_toggle()<cr>", "Lazygit" },
    },
    p = { name = "Plugins" },
    t = { name = "Test" },
    a = {
      name = "Tab",
      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },
    T = { name = "Treesitter" },

    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      f = {
        "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
        "Format",
      },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      h = { "<cmd>lua require('sang.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    }
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
