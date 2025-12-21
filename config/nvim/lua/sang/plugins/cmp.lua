local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    {
      "tzachar/cmp-ai",
    },
  },
}

local source_names = {
  buffer = "",
  calc = "󰇔",
  cmp_tabnine = "󰋙",
  cmp_ai = "",
  copilot = "",
  dotenv = "",
  emoji = "",
  luasnip = "",
  nvim_lsp = "",
  nvim_lua = "󰢱",
  path = "",
  treesitter = "󰐅",
}

function M.config()
  local cmp = require "cmp"
  local mapping = require "cmp.config.mapping"
  local window = require "cmp.config.window"
  local luasnip = require "luasnip"
  local icons = require "sang.utils.icons"
  -- local T = require "utils.table"

  require("luasnip/loaders/from_vscode").lazy_load()

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  cmp.setup {
    enabled = function()
      local buftype = vim.api.nvim_buf_get_option(0, "buftype")
      if buftype == "prompt" then
        return false
      end
      return true
    end,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = mapping.preset.insert {
      ["<C-k>"] = mapping(mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = mapping(mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = mapping(mapping.select_next_item(), { "i", "c" }),
      ["<Up>"] = mapping(mapping.select_prev_item(), { "i", "c" }),
      ["<C-b>"] = mapping(mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = mapping(mapping.scroll_docs(1), { "i", "c" }),
      ["<C-x>"] = mapping(
        mapping.complete {
          config = {
            sources = cmp.config.sources {
              { name = "cmp_ai" },
            },
          },
        },
        { "i", "c" }
      ),
      ["<C-e>"] = mapping {
        i = mapping.abort(),
        c = mapping.close(),
      },

      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = mapping.confirm { select = true },
      ["<Tab>"] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      expandable_indicator = true,
      fields = { "kind", "abbr", "menu" },
      kind_icons = icons.kind,
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = source_names[entry.source.name]

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        if entry.source.name == "cmp_tabnine" or entry.source.name == "cmp_ai" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        return vim_item
      end,
    },
    sources = {
      -- { name = "cmp_ai" },
      { name = "buffer" },
      { name = "calc" },
      { name = "cmp_tabnine" },
      { name = "copilot" },
      { name = "dotenv" },
      { name = "emoji" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "treesitter" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = window.bordered(),
      documentation = window.bordered(),
    },
    completion = {
      ---@usage The minimum length of a word to complete on.
      keyword_length = 1,
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  }
end

return M
