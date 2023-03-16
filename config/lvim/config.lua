vim.opt.autoindent = true
vim.opt.cmdheight = 2
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = "eob: "
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- Using ufo provider need a large value
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.formatoptions = "crjql"
vim.opt.lazyredraw = true
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.number = true
vim.opt.redrawtime = 1500
vim.opt.relativenumber = true
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.shiftwidth = 2
vim.opt.shortmess = "a"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.synmaxcol = 150
vim.opt.tabstop = 4
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10 -- https://vi.stackexchange.com/a/24938/19109
vim.opt.updatetime = 200
vim.opt.whichwrap = "<,>,[,]"

vim.api.nvim_clear_autocmds { pattern = { "alpha" }, group = "_filetype_settings" }

-- General
lvim.colorscheme = "tokyonight-night"
lvim.leader = "space"
lvim.line_wrap_cursor_movement = false
lvim.log.level = "warn"
lvim.format_on_save = true

-- Control the core plugins here
lvim.builtin.alpha.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.breadcrumbs.active = false

-- Keymappings [view all the defaults by pressing <leader>Lk]
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<C-a>"] = "<cmd>ToggleTermToggleAll<CR>"
lvim.keys.normal_mode["sa"] = "<cmd>Telescope live_grep<CR>"
lvim.keys.normal_mode["sda"] = "<cmd>Telescope dir live_grep<CR>"
lvim.keys.normal_mode["sf"] = "<cmd>Telescope find_files<CR>"
lvim.keys.normal_mode["sdf"] = "<cmd>Telescope dir find_files<CR>"
lvim.keys.normal_mode["sg"] = "<cmd>Telescope git_files<CR>"
lvim.keys.normal_mode["sb"] = "<cmd>Telescope buffers<CR>"
lvim.keys.normal_mode["sh"] = "<cmd>Telescope current_buffer_fuzzy_find<CR>"
lvim.keys.normal_mode["sr"] = "<cmd>Telescope oldfiles<CR>"
lvim.keys.normal_mode["sk"] = "<cmd>TSJJoin<CR>"
lvim.keys.normal_mode["sj"] = "<cmd>TSJSplit<CR>"
lvim.keys.normal_mode["sm"] = "<cmd>TSJToggle<CR>"
lvim.keys.normal_mode["<Up>"] = ":cprev<CR>"
lvim.keys.normal_mode["<Down>"] = ":cnext<CR>"
lvim.keys.normal_mode["<Left>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = "<cmd>BufferLineCycleNext<CR>"

-- Sort list in visual mode
lvim.keys.visual_mode["ss"] = ":'<,'>sort<CR>"

vim.keymap.set('n', 'cl', function()
  local word = vim.fn.expand("<cword>")
  local newRow = "console.log('### " .. word .. ": ', { " .. word .. " });"
  vim.cmd.norm("o" .. newRow)
end, { silent = true })

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["f"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" }
lvim.builtin.which_key.mappings["n"] = { ":noh<CR>", "Clear highlight" }
lvim.builtin.which_key.mappings["q"] = { ":BufferKill<CR>", "Close current buffer" }
lvim.builtin.which_key.mappings["gdo"] = { ":DiffviewOpen<CR>", "Open Git Diffview" }
lvim.builtin.which_key.mappings["gdc"] = { ":DiffviewClose<CR>", "Close Git Diffview" }
lvim.builtin.which_key.mappings["gdf"] = { ":DiffviewToggleFiles<CR>", "Toggle Git Diffview files" }
lvim.builtin.which_key.mappings["gdh"] = { ":DiffviewFileHistory<CR>", "Git Diffview file history" }
lvim.builtin.which_key.mappings["ll"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show diagnostics" }
lvim.builtin.which_key.mappings["jh"] = { "<cmd>lua require'jester'.run()<CR>", "Run test under cursor" }
lvim.builtin.which_key.mappings["ja"] = { "<cmd>lua require'jester'.run_file()<CR>", "Run all tests in current file" }
lvim.builtin.which_key.mappings["bc"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["c"] = {
  name = "Colorizer",
  t = { "<cmd>ColorizerToggle<CR>", "Toggle Colorizer" },
  r = { "<cmd>ColorizerReloadAllBuffers<CR>", "Reload all Buffers" },
  d = { "<cmd>lua require'custom.lazydocker'.toggle()<CR>", "Toggle Lazydocker" },
}
lvim.builtin.which_key.mappings["Sa"] = { "<cmd>lua require('spectre').open()<CR>", "Search and replace global" }
lvim.builtin.which_key.mappings["Sh"] = { "viw:lua require('spectre').open_file_search()<CR>" }
lvim.builtin.which_key.mappings["X"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "toggle trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  D = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type definitions" },
}

lvim.builtin.project.active = false

-- My working place use 4 spaces indentation
local is_work_dir = string.find(vim.fn.getcwd(), "/Users/sangdang/Lokalise")
local exceptions = {
  json = true,
  yml = true,
  yaml = true,
}
if is_work_dir and exceptions[vim.bo.filetype] == nil then
  vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
  vim.opt.expandtab = false
end

lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.always_show_bufferline = true

local components = require "lvim.core.lualine.components"
components.diff.symbols = {
  added = " 落",
  modified = " ",
  removed = " ",
}
lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.options.disabled_filetypes = { "packer", "NvimTree" }
lvim.builtin.lualine.extensions = { "quickfix", "nvim-tree" }
lvim.builtin.lualine.sections = {
  lualine_a = {},
  lualine_b = { { "filename", file_status = true, path = 3 } },
  lualine_c = { components.branch, components.diff },
  lualine_x = {
    components.diagnostics,
    components.lsp,
    {
      "filetype",
      colored = true, -- Displays filetype icon in color if set to true
      icon_only = true, -- Display only an icon for filetype
    },
  },
  lualine_y = {},
}
lvim.builtin.lualine.inactive_sections = {
  lualine_x = {},
}

-- We use protected-mode (pcall) just in case the plugin wasn't loaded
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.layout_config = { width = 0.8 }
lvim.builtin.telescope.defaults.path_display.shorten = 10
lvim.builtin.telescope.defaults.selection_caret = " "
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
    -- ["<C-j>"] = actions.move_selection_next,
    -- ["<C-k>"] = actions.move_selection_previous,
    -- conflict with lazygit
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
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "dir") -- load the extension princejoogie/dir-telescope.nvim
end

lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.terminal.direction = "float"
lvim.builtin.terminal.float_opts = {
  border = "none",
  width = 1000,
  height = 100,
}

lvim.builtin.gitsigns.active = true
lvim.builtin.gitsigns.opts.current_line_blame = true

-- Project.nvim change the cwd, while waiting for a way to make it respects git submodule.
-- I disabled it for now
lvim.builtin.project.active = false

lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.git.enable = true -- we need this for git.ignore has effect
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.git.timeout = 400 -- some big repo need longer than 200ms
lvim.builtin.nvimtree.setup.hijack_cursor = true
lvim.builtin.nvimtree.setup.hijack_unnamed_buffer_when_opening = true
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
lvim.builtin.nvimtree.setup.renderer.special_files = {}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs = {
  default = "",
  symlink = "",
  bookmark = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "ﬤ",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "",
  },
  folder = {
    arrow_closed = "",
    arrow_open = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}
lvim.builtin.nvimtree.setup.filters = {
  dotfiles = false,
  custom = { ".DS_Store" },
  exclude = { ".env" }
}
lvim.builtin.nvimtree.setup.diagnostics = {
  enable = true,
  show_on_dirs = false,
  debounce_delay = 50,
  icons = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}

lvim.builtin.indentlines.options.char = "│"
lvim.builtin.indentlines.options.context_char = "│"
lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.use_treesitter = true
lvim.builtin.indentlines.options.space_char_blankline = " "
lvim.builtin.indentlines.options.context_patterns = {
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
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.disable = { "jsx" } -- idk why no effect
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "css",
  "cmake",
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
  "vim",
}

lvim.lsp.diagnostics.virtual_text = true

-- require("lvim.lsp.manager").setup("emmet_ls")

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
    exe = "eslint",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}

lvim.builtin.dap.active = true
lvim.builtin.dap.breakpoint.text = "🛑"
-- lvim.builtin.dap.on_config_done = function(dap)
--   dap.adapters.chrome = {
--     type = 'executable',
--     command = 'node',
--     args = { os.getenv('HOME') .. '/Applications/vscode-chrome-debug/out/src/chromeDebug.js' },
--   }
--   dap.adapters.firefox = {
--     type = 'executable',
--     command = 'node',
--     args = { os.getenv('HOME') .. '/Applications/vscode-firefox-debug/dist/adapter.bundle.js' },
--   }
--   dap.adapters.node2 = {
--     type = 'executable',
--     command = 'node',
--     args = { os.getenv('HOME') .. '/Applications/vscode-node-debug2/out/src/nodeDebug.js' },
--   }
--   dap.adapters.cppdbg = {
--     id = 'cppdbg',
--     type = 'executable',
--     command = os.getenv('HOME') .. '/Applications/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
--   }
--   dap.configurations.typescript = {
--     {
--       name = 'Debug TypeScript with Firefox',
--       type = 'firefox',
--       request = 'launch',
--       reAttach = true,
--       url = 'http://localhost:3000',
--       webRoot = '${workspaceFolder}',
--     }
--   }
--   dap.configurations.node2 = {
--     {
--       name = 'Debug javascript with node',
--       type = 'node2',
--       request = 'attach',
--       reAttach = true,
--       protocol = 'inspector',
--       url = 'http://localhost:3000',
--       cwd = vim.fn.getcwd(),
--       skipFiles = { "<node_internals>/**/*.js" },
--     }
--   }
--   dap.configurations.javascript = {
--     {
--       type = "chrome",
--       request = "attach",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       webRoot = "${workspaceFolder}"
--     }
--   }
--   dap.configurations.typescriptreact = {
--     {
--       type = "chrome",
--       request = "attach",
--       program = "${file}",
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       webRoot = "${workspaceFolder}"
--     }
--   }
-- end

-- Additional Plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    lazy = true,
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
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    lazy = true,
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
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
    event = "InsertEnter",
    lazy = true,
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
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    lazy = true,
    config = function()
      require('ufo').setup({
        provider_selector = function() -- func(bfnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
    dependencies = "kevinhwang91/promise-async",
  },
  {
    "AndrewRadev/tagalong.vim",
    event = "InsertEnter",
    lazy = true,
  },
  {
    'echasnovski/mini.nvim',
    version = "*",
    event = "BufRead",
    lazy = true,
    config = function()
      require('mini.cursorword').setup({ delay = 200 })

      require('mini.surround').setup({
        mappings = {
          add = 'as', -- Add surrounding in Normal and Visual modes
          delete = 'ds', -- Delete surrounding
          replace = 'cs', -- Replace surrounding
          find = '', -- Find surrounding (to the right)
          find_left = '', -- Find surrounding (to the left)
          highlight = '', -- Highlight surrounding
          update_n_lines = '', -- Update `n_lines`
        },
        search_method = 'cover_or_next',
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    lazy = true,
  },
  -- {
  --   "AndrewRadev/splitjoin.vim",
  --   event = "BufRead",
  --   lazy = true,
  -- },
  {
    "gpanders/editorconfig.nvim",
    event = "BufWrite",
    lazy = true,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "TroubleToggle",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    lazy = true,
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help", "toggleterm", "nvimtree" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/persistence.nvim",
    -- this will only start session saving when an actual file was opened
    event = "BufReadPre",
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    lazy = true,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
    lazy = true,
  },
  {
    "David-Kunz/jester",
    lazy = true,
    event = "BufRead",
    config = function()
      require("jester").setup({
        cmd = "jest -t --coverage=false '$result' -- $file",
      })
    end
  },
  {
    "princejoogie/dir-telescope.nvim",
    lazy = true,
    event = "VimEnter",
    -- telescope.nvim is a required dependency
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        hidden = true,
        respect_gitignore = true,
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = "BufRead",
    config = function()
      require("yanky").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    'Wansmer/treesj',
    event = "BufRead",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 999,
      })
    end,
  }
}
