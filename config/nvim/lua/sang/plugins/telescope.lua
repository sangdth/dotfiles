return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local icons = require "sang.utils.icons"
    local actions = require "telescope.actions"
    local previewers = require "telescope.previewers"
    local sorters = require "telescope.sorters"

    local colors = require("catppuccin.palettes").get_palette()
    local TelescopeColor = {
      TelescopeMatching = { bg = colors.mantle, fg = colors.yellow },
      TelescopeSelection = { bg = colors.mantle, fg = colors.text, bold = true },

      TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
      TelescopePreviewNormal = { bg = colors.crust },
      TelescopePreviewTitle = { bg = colors.crust, fg = colors.crust },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      TelescopePromptNormal = { bg = colors.surface0 },
      TelescopePromptPrefix = { bg = colors.surface0 },
      TelescopePromptTitle = { bg = colors.green, fg = colors.mantle },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopeResultsNormal = { bg = colors.mantle, fg = colors.overlay2 },
      TelescopeResultsTitle = { bg = colors.mantle, fg = colors.mantle },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    require("telescope").setup {
      theme = "dropdown",
      defaults = {
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        file_sorter = sorters.get_fuzzy_file,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = icons.ui.Bar .. "  ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "smart" },
        color_devicons = true,
        winblend = 0,
        border = {},
        borderchars = nil,
        sorting_strategy = nil,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        layout_strategy = "horizontal",
        layout_config = {
          width = { padding = 0 },
          height = { padding = 0 },
          prompt_position = "bottom", -- this broke the code actions float
          -- preview_width = 0.6,
          -- preview_height = 0.6,
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        file_ignore_patterns = {
          "%.git/",
          "^.next/",
          "^.cache",
          "%.gif",
          "%.png",
          "%.jpg",
          "%.svg",
          "%.webp",
          "^node_modules/",
          "^graphqls/index.ts",
          "^graphqls/schema.json",
          "^graphqls/schema.graphql",
          "prisma/migrations/.*/.*%.sql",
          "node_modules",
          "vendor",
          "yarn.lock",
          "npm%-lock.json",
          "pnpm%-lock.json",
          "pnpm%-lock.yaml",
          "package%-lock.json",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        live_grep = {
          only_sort_text = true,
        },
        grep_string = {
          only_sort_text = true,
        },
        find_files = {
          hidden = true,
        },
        planets = {
          show_pluto = true,
          show_moon = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
        lsp_document_symbols = {},
        colorscheme = {
          enable_preview = true,
        },
        -- lsp_references = {
        --   initial_mode = "normal",
        -- },
        -- lsp_definitions = {
        --   initial_mode = "normal",
        -- },
        -- lsp_declarations = {
        --   initial_mode = "normal",
        -- },
        -- lsp_implementations = {
        --   initial_mode = "normal",
        -- },
        buffers = {
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    }
  end,
}
