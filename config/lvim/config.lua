vim.opt.autoindent = true
vim.opt.cmdheight = 2
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = "eob: "
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.formatoptions = "crjql"
vim.opt.lazyredraw = true
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.number = true
vim.opt.redrawtime = 1500
vim.opt.relativenumber = true
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.shiftwidth = 2
vim.opt.shortmess = "a"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.synmaxcol = 150
vim.opt.tabstop = 2
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10 -- https://vi.stackexchange.com/a/24938/19109
vim.opt.updatetime = 200
vim.opt.whichwrap = "<,>,[,]"

-- General
lvim.colorscheme = "tokyonight-night"
lvim.leader = "space"
lvim.line_wrap_cursor_movement = false
lvim.log.level = "warn"
lvim.format_on_save = true

-- Keymappings [view all the defaults by pressing <leader>Lk]
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<C-a>"] = "<cmd>ToggleTermToggleAll<CR>"
lvim.keys.normal_mode["sa"] = "<cmd>Telescope live_grep<CR>"
lvim.keys.normal_mode["sf"] = "<cmd>Telescope find_files<CR>"
lvim.keys.normal_mode["sg"] = "<cmd>Telescope git_files<CR>"
lvim.keys.normal_mode["sb"] = "<cmd>Telescope buffers<CR>"
lvim.keys.normal_mode["sh"] = "<cmd>Telescope current_buffer_fuzzy_find<CR>"
lvim.keys.normal_mode["sr"] = "<cmd>Telescope oldfiles<CR>"
lvim.keys.normal_mode["sk"] = "<cmd>SplitjoinJoin<CR>"
lvim.keys.normal_mode["sj"] = "<cmd>SplitjoinSplit<CR>"
lvim.keys.normal_mode["cl"] = "+yiwoconsole.log('### <word>: ', <word>a);<Esc>"
lvim.keys.normal_mode["<Up>"] = ":cprev<CR>"
lvim.keys.normal_mode["<Down>"] = ":cnext<CR>"
lvim.keys.normal_mode["<Left>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = "<cmd>BufferLineCycleNext<CR>"

-- Map the moving lines, Remember set the escape sequence in your keyboard/terminal
lvim.keys.normal_mode["<A-j>"] = ":m .+1<CR>=="
lvim.keys.normal_mode["<A-k>"] = ":m .-2<CR>=="
lvim.keys.visual_mode["<A-j>"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["<A-k>"] = ":m '<-2<CR>gv=gv"

-- Sort list in visual mode
lvim.keys.visual_mode["ss"] = ":'<,'>sort<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["q"] = { ":BufferKill<CR>", "Close current buffer" }
lvim.builtin.which_key.mappings["gdo"] = { ":DiffviewOpen<CR>", "Open Git Diffview" }
lvim.builtin.which_key.mappings["gdc"] = { ":DiffviewClose<CR>", "Close Git Diffview" }
lvim.builtin.which_key.mappings["gdf"] = { ":DiffviewToggleFiles<CR>", "Toggle Git Diffview files" }
lvim.builtin.which_key.mappings["gdh"] = { ":DiffviewFileHistory<CR>", "Git Diffview file history" }
lvim.builtin.which_key.mappings["n"] = { ":noh<CR>", "Clear highlight" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" }
lvim.builtin.which_key.mappings["ll"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostics" }
lvim.builtin.which_key.mappings["bc"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["c"] = {
  name = "Colorizer",
  t = { "<cmd>ColorizerToggle<CR>", "Toggle Colors" },
  r = { "<cmd>ColorizerReloadAllBuffers<CR>", "Reload all Buffers" },
}
lvim.builtin.which_key.mappings["x"] = {
  name = "Diagnostics",
  x = { "<cmd>TroubleToggle<cr>", "toggle trouble" },
  W = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  D = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type definitions" },
}

lvim.builtin.project.patterns = { ".git" }

-- My working place use 4 spaces indentation
local is_work_dir = string.find(vim.fn.getcwd(), "/Users/sangdang/Lokalise")
local exceptions = {
  json = true,
  yml = true,
  yaml = true,
}
if is_work_dir and exceptions[vim.bo.filetype] == nil then
  vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
  vim.opt.tabstop = 4
end

lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.always_show_bufferline = true

local components = require "lvim.core.lualine.components"
components.diff.symbols = { added = " 落", modified = " ", removed = "  " }
lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.options.disabled_filetypes = { "packer", "NvimTree" }
lvim.builtin.lualine.sections = {
  lualine_a = {},
  lualine_b = { { "filename", file_status = true, path = 3 } },
  lualine_c = {}, -- "os.date('%T')" -- it does not update
  lualine_y = { components.diff, components.branch },
  lualine_z = { "location" },
}

-- We use protected-mode (pcall) just in case the plugin wasn't loaded
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.path_display.shorten = 10
lvim.builtin.telescope.defaults.selection_caret = "∙ "
lvim.builtin.telescope.defaults.file_ignore_patterns = {
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
  "package-lock.json",
}
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.alpha.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.notify.active = false

lvim.builtin.terminal.active = true
lvim.builtin.terminal.size = 12
lvim.builtin.terminal.direction = "horizontal"

lvim.builtin.gitsigns.active = true
lvim.builtin.gitsigns.opts.current_line_blame = true

-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.number = false
lvim.builtin.nvimtree.setup.view.relativenumber = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 45 -- For some reason, put view width inside setup does not work :D
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.hijack_cursor = true
lvim.builtin.nvimtree.setup.hijack_unnamed_buffer_when_opening = true
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
lvim.builtin.nvimtree.setup.renderer.special_files = {}
lvim.builtin.nvimtree.icons = {
  git = {
    unstaged  = "",
    staged    = "",
    unmerged  = "",
    renamed   = "",
    deleted   = "",
    untracked = "",
    ignored   = "",
  },
  folder = {
    arrow_open   = "",
    arrow_closed = "",
    default      = "",
    open         = "",
    empty        = "",
    empty_open   = "",
    symlink      = "",
    symlink_open = "",
  }
}

-- local tree_cb = require "nvim-tree.config".nvim_tree_callback
-- require "nvim-tree".setup {
--   filters = {
--     custom = { ".DS_Store" },
--   },
--   view = {
--     mappings = {
--       list = {
--         { key = { "<C-v>", "V" }, cb = tree_cb("vsplit") },
--       },
--     },
--   },
-- }

-- looks like the lvim still use old versions of nvim-tree
-- Redraw the Dashboard after opening/closing the nvim-tree
-- local tree_api = require('nvim-tree.api')
-- local TreeEvent = require('nvim-tree.api').events.Event

-- tree_api.events.subscribe(TreeEvent.TreeOpen, function()
--     vim.api.nvim_command(":AlphaRedraw")
-- end)
-- tree_api.events.subscribe(TreeEvent.TreeClose, function()
--     vim.api.nvim_command(":AlphaRedraw")
-- end)

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.rainbow.enable = false
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "go",
  "graphql",
  "java",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "typescript",
  "yaml",
}

lvim.lsp.diagnostics.virtual_text = true
-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier", -- prettier_d_slim somehow ignore the eslint rules
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "graphql", "json", "yaml" },
  },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "graphql" },
  },
}

lvim.builtin.dap.active = true
lvim.builtin.dap.breakpoint.text = "🛑"
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.chrome = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/Applications/vscode-chrome-debug/out/src/chromeDebug.js' },
  }
  dap.adapters.firefox = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/Applications/vscode-firefox-debug/dist/adapter.bundle.js' },
  }
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/Applications/vscode-node-debug2/out/src/nodeDebug.js' },
  }
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = os.getenv('HOME') .. '/Applications/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  }
  dap.configurations.typescript = {
    {
      name = 'Debug TypeScript with Firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = true,
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
    }
  }
  dap.configurations.node2 = {
    {
      name = 'Debug javascript with node',
      type = 'node2',
      request = 'attach',
      reAttach = true,
      protocol = 'inspector',
      url = 'http://localhost:3000',
      cwd = vim.fn.getcwd(),
      skipFiles = { "<node_internals>/**/*.js" },
    }
  }
  dap.configurations.javascript = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    }
  }
  dap.configurations.typescriptreact = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    }
  }
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
    },
  }
end

-- Additional Plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup {
        keys = 'asdghklqwertyuiopzxcvbnmfj1234567890'
      }
      vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
      --   require "lsp_signature".setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        char = "│",
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        space_char_blankline = " ",
        show_current_context = true,
        use_treesitter = true,
        buftype_exclude = { "alpha", "terminal", "NvimTree" },
        filetype_exclude = {
          "alpha",
          "help",
          "terminal",
          "dashboard",
          "NvimTree",
          "lspinfo",
          "NormalFloat",
        },
        context_patterns = {
          '^for',
          '^if',
          '^object',
          '^table',
          '^while',
          'arguments',
          'block',
          'class',
          'declaration',
          'expression',
          'function',
          'jsx_attribute',
          'jsx_closing_element',
          'jsx_element',
          'jsx_fragment',
          'jsx_opening_element',
          'jsx_self_closing_element',
          'method',
          'pattern',
          'primary_expression',
          'statement',
          'switch_body',
        },
      }
      vim.api.nvim_set_hl(0, "IndentBlanklineChar", { foreground = "#24283b" })
      -- vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { foreground = "#999999" })
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup({ "*" }, {
        mode = "background",
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 3,
        sort = true,
        ignored_file_types = {
          html = true,
          json = true,
          yaml = true,
        }
      }
    end,
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    config = function()
      require('ufo').setup({
        provider_selector = function() -- func(bfnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
    requires = "kevinhwang91/promise-async",
  },
  {
    "mattn/emmet-vim",
    event = "BufRead",
  },
  {
    "AndrewRadev/tagalong.vim",
    event = "BufRead",
  },
  {
    "tpope/vim-surround",
    event = "BufRead",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "AndrewRadev/splitjoin.vim",
    event = "BufRead",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "gpanders/editorconfig.nvim",
    event = "InsertEnter",
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        stop_eof = true,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help", "toggleterm", "nvimtree" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
}

-- vim.api.nvim_echo({ { 'first chunk and ', 'name' }, { 'second chunk to echo', 'None' } }, false, {})

-- autocommands cause the save format broken
lvim.autocommands = {
  -- {
  --   "BufEnter", {
  --     pattern = "*",
  --     callback = function()
  --       -- need to get total buffers before open alpha
  --       local bufnr = vim.api.nvim_get_current_buf()
  --       local bufname = vim.api.nvim_buf_get_name(bufnr)
  --       local bufmodified = vim.api.nvim_buf_get_option(bufnr, "modified")
  --       local ft = vim.api.nvim_buf_get_option(bufnr, "ft")

  --       local should_open_alpha = bufname == "" and not bufmodified and ft == ""
  --       if should_open_alpha then
  --         vim.cmd("Alpha")
  --       end
  --     end,
  --   }
  -- },
  {
    "FileType", {
      pattern = "alpha",
      command = "setlocal nofoldenable",
    }
  },
  {
    "ColorScheme", {
      pattern = "*",
      callback = function()
        local theme_colors = require("tokyonight.colors").setup()
        local groups_use_bg = {
          "TelescopeBorder",
          "TelescopeNormal",
        }
        for _, name in ipairs(groups_use_bg) do
          vim.cmd(string.format("hi %s guibg=" .. theme_colors.bg, name))
        end

        local groups_use_dark_bg = {
          "BufferLineFill",
          "MsgArea",
          "NvimTree",
          "NvimTreeEndOfBuffer",
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeStatusLine",
          "NvimTreeStatusLineNC",
          "PanelHeading",
          "StatusLine",
          "StatusLineNC",
          "VertSplit",
        }
        for _, name in ipairs(groups_use_dark_bg) do
          vim.cmd(string.format("hi %s guibg=" .. theme_colors.bg_dark, name))
        end

        vim.cmd("hi NvimTreeStatusLineNC guifg=" .. theme_colors.bg_dark)
      end,
    },
  }
}
