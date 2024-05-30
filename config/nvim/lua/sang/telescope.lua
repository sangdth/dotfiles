local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  }

  local icons = require "sang.icons"
  local actions = require "telescope.actions"
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"

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
        prompt_position = "bottom",
        width = 0.8,
        height = 0.9,
        -- preview_height = 0.6,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        -- "--fixed-strings",
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
        "node_modules",
        "vendor",
        "yarn.lock",
        "npm-lock.json",
        "pnpm-lock.json",
        "package-lock.json",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
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
end

return M
