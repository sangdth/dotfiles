-- Global configs
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

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
vim.opt.formatoptions = "cro" -- "crjql"
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

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_clear_autocmds { pattern = { "alpha" }, group = "_filetype_settings" }

-- General
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
lvim.log.level = "warn"
lvim.line_wrap_cursor_movement = false
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
lvim.keys.normal_mode["<Up>"] = "<cmd>lua vim.diagnostic.goto_prev()<cr>"
lvim.keys.normal_mode["<Down>"] = "<cmd>lua vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["<Left>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-b>"] = "<cmd>lua require'dap'.toggle_breakpoint()<CR>"

-- Sort list in visual mode
lvim.keys.visual_mode["ss"] = ":'<,'>sort<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["f"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" }
lvim.builtin.which_key.mappings["n"] = { ":noh<CR>", "Clear highlight" }
lvim.builtin.which_key.mappings["q"] = { ":BufferKill<CR>", "Close current buffer" }
lvim.builtin.which_key.mappings["gdo"] = { ":DiffviewOpen<CR>", "Open Git Diffview" }
lvim.builtin.which_key.mappings["gdc"] = { ":DiffviewClose<CR>", "Close Git Diffview" }
lvim.builtin.which_key.mappings["gdf"] = { ":DiffviewToggleFiles<CR>", "Toggle Git Diffview files" }
lvim.builtin.which_key.mappings["gdh"] = { ":DiffviewFileHistory<CR>", "Git Diffview file history" }
lvim.builtin.which_key.mappings["jh"] = { "<cmd>lua require'jester'.run()<CR>", "Run test under cursor" }
lvim.builtin.which_key.mappings["ja"] = { "<cmd>lua require'jester'.run_file()<CR>", "Run all tests in current file" }
lvim.builtin.which_key.mappings["bc"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["c"] = {
  name = "Colorizer",
  t = { "<cmd>ColorizerToggle<CR>", "Toggle Colorizer" },
  r = { "<cmd>ColorizerReloadAllBuffers<CR>", "Reload all Buffers" },
}
lvim.builtin.which_key.mappings["lz"] = {
  d = { "<cmd>lua require'custom.lazydocker'.toggle()<CR>", "Toggle lazydocker" },
  j = { "<cmd>lua require'custom.lazyjira'.toggle()<CR>", "Toggle lazyjira" },
}
lvim.builtin.which_key.mappings["X"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["gp"] = {
  name = "Goto Preview",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Goto Preview Definition" },
  t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Goto Preview Type Definition" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Goto Preview Implementation" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Goto Preview References" },
  q = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Goto Preview Close all Windows" },
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

-- My working place use 4 spaces indentation
local is_work_dir = string.find(vim.fn.getcwd(), os.getenv('HOME') .. "/Lokalise")
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
  added = "+",
  modified = "~",
  removed = "-",
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
      colored = true,   -- Displays filetype icon in color if set to true
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
  pcall(telescope.load_extension, "projects")
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

-- Project.nvim change the cwd on git submodules
lvim.builtin.project.active = false

lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.git.enable = true  -- we need this for git.ignore has effect
lvim.builtin.nvimtree.setup.git.ignore = true
lvim.builtin.nvimtree.setup.git.timeout = 1000 -- some big repo need longer than 200ms
lvim.builtin.nvimtree.setup.hijack_cursor = true
lvim.builtin.nvimtree.setup.hijack_unnamed_buffer_when_opening = true
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = false
lvim.builtin.nvimtree.setup.renderer.special_files = {}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs = {
  default = "",
  symlink = "",
  -- bookmark = "",
  git = {
    unstaged = "",
    staged = "",
    unmerged = "ﬤ",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "",
  },
  folder = {
    arrow_closed = "",
    arrow_open = "",
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
    -- hint = "",
    -- info = "",
    -- warning = "",
    -- error = "",
  },
}
-- https://discord.com/channels/701530051140780102/704077577920446636/1089452567681040384
-- lvim.builtin.nvimtree.setup.update_focused_file.ignore_list = { "lazy" }

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

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.rainbow.enable = false
lvim.builtin.treesitter.autotag = true

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
  {
    exe = "golangci-lint",
    filetypes = { "go" },
  },
}

lvim.builtin.dap.active = false
lvim.builtin.dap.breakpoint.text = "⛔"
lvim.builtin.dap.ui.auto_open = true

lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*" },
      command = "highlight IndentBlanklineChar guifg=#282c3e gui=nocombine",
    }
  },
  {
    { "BufEnter", "BufWinEnter" },
    {
      pattern = { "*.go", "go.mod" },
      command = "setlocal noexpandtab tabstop=4 shiftwidth=4",
    },
  },
  {
    { "BufEnter", "BufWinEnter" },
    {
      pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
      callback = function()
        vim.keymap.set("n", "cl", function()
          local word = vim.fn.expand("<cword>")
          local newRow = "console.log('### " .. word .. ": ', { " .. word .. " });"
          vim.cmd.norm("o" .. newRow)
        end, { silent = true })
      end
    }
  },
  {
    { "BufEnter", "BufWinEnter" },
    {
      pattern = { "*.go" },
      callback = function()
        vim.keymap.set("n", "cl", function()
          local word = vim.fn.expand("<cword>")
          local newRow = "fmt.Printf(\"### " .. word .. ": %s\", " .. word .. ")"
          vim.cmd.norm("o" .. newRow)
        end, { silent = true })
      end
    }
  },
  {
    "ColorScheme", {
    pattern = "*",
    callback = function()
      local theme_colors = require("tokyonight.colors").setup({})
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
        "NormalFloat",
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
      vim.cmd("hi CursorLineNr guifg=" .. theme_colors.blue)
    end,
  },
  },
}

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
    event = "BufRead",
    lazy = true,
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = 'BufRead',
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    lazy = true,
    config = function()
      require('ufo').setup({
        provider_selector = function() -- func(bfnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end,
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
          add = 'as',          -- Add surrounding in Normal and Visual modes
          delete = 'ds',       -- Delete surrounding
          replace = 'cs',      -- Replace surrounding
          find = '',           -- Find surrounding (to the right)
          find_left = '',      -- Find surrounding (to the left)
          highlight = '',      -- Highlight surrounding
          update_n_lines = '', -- Update `n_lines`
        },
        search_method = 'cover_or_next',
      })
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "TroubleToggle",
  },
  {
    "natecraddock/sessions.nvim",
    event = 'VimEnter',
    config = function()
      require("sessions").setup({
        events = { "VimLeavePre", "BufRead" },
        session_filepath = ".vim-session",
      })
    end
  },
  {
    "natecraddock/workspaces.nvim",
    event = 'VimEnter',
    config = function()
      require("workspaces").setup({
        hooks = {
          open_pre = {
            "SessionsStop",
            "silent %bdelete!",
          },
          open = {
            function()
              require("sessions").load(nil, { silent = true })
            end
          }
        },
      })
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPost",
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
    event = "BufReadPre",
    lazy = true,
    config = function()
      require("persistence").setup()
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
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 999,
      })
    end,
  },
  {
    "ray-x/sad.nvim",
    dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
    event = 'VimEnter',
    config = function()
      require("sad").setup {}
    end
  },
  {
    "codota/tabnine-nvim",
    event = "InsertEnter",
    build = "./dl_binaries.sh",
    config = function()
      require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        -- log_file_path = nil, -- absolute path to Tabnine log file
      })
    end
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          javascript = true,
          typescript = true,
          javascriptreact = true,
          typescriptreact = true,
          json = true,
          yaml = true,
          go = true,
          golang = true,
          ["*"] = false,
        },
      })
    end,
  },
  {
    -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
        require("copilot_cmp").setup()
      end, 100)
    end,
  },
  {
    -- https://github.com/smjonas/inc-rename.nvim#readme
    "smjonas/inc-rename.nvim",
    event = "BufRead",
    config = function()
      require("inc_rename").setup()

      vim.keymap.set("n", "rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    event = "BufRead",
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = true
      })

      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },
  -- {
  --   "microsoft/vscode-js-debug",
  --   lazy = true,
  --   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  -- },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   event = "BufRead",
  --   lazy = true,
  --   config = function()
  --     require("dap-vscode-js").setup({
  --       debugger_path = os.getenv("HOME") .. "/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug",
  --       adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node',
  --         'chrome' },
  --     })

  --     for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  --       require("dap").configurations[language] = {
  --         -- debug single Node.js files
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Launch file",
  --           program = "${file}",
  --           cwd = "${workspaceFolder}",
  --         },
  --         -- debug node processes like express applications
  --         {
  --           type = "pwa-node",
  --           request = "attach",
  --           name = "Attach",
  --           processId = require("dap.utils").pick_process,
  --           cwd = "${workspaceFolder}",
  --         },
  --         -- debug web applications
  --         {
  --           type = "pwa-chrome",
  --           request = "launch",
  --           name = "Start Chrome with \"localhost\"",
  --           url = "http://localhost:3000",
  --           webRoot = "${workspaceFolder}",
  --           userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
  --         },
  --       }
  --     end
  --   end
  -- },
}
