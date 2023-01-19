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
lvim.builtin.dap.active = true
lvim.builtin.gitsigns.active = true
lvim.builtin.terminal.active = true
lvim.builtin.breadcrumbs.active = false

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

-- Map the moving lines, remember set the escape sequence in your keyboard/terminal
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
lvim.builtin.which_key.mappings["th"] = { "<cmd>lua require'jester'.run()<CR>", "Run test under cursor" }
lvim.builtin.which_key.mappings["tf"] = { "<cmd>lua require'jester'.run_file()<CR>", "Run all tests in current file" }
lvim.builtin.which_key.mappings["bc"] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["c"] = {
	name = "Colorizer",
	t = { "<cmd>ColorizerToggle<CR>", "Toggle Colors" },
	r = { "<cmd>ColorizerReloadAllBuffers<CR>", "Reload all Buffers" },
}
lvim.builtin.which_key.mappings["S"] = {
	name = "Session",
	c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
	l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
	Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
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
	vim.opt.expandtab = false
end

lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.always_show_bufferline = true

local components = require "lvim.core.lualine.components"
components.diff.symbols = { added = " 落", modified = " ", removed = "  " }
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
-- local horizontalConfigs = { layout_strategy = "horizontal" }
lvim.builtin.telescope.defaults.layout_config = { width = 0.8 }
lvim.builtin.telescope.defaults.path_display.shorten = 10
lvim.builtin.telescope.defaults.selection_caret = " "
-- lvim.builtin.telescope.pickers = {
--   live_grep = horizontalConfigs,
--   find_files = horizontalConfigs,
-- }
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

lvim.builtin.terminal.size = 12
lvim.builtin.terminal.direction = "horizontal"

lvim.builtin.gitsigns.opts.current_line_blame = true

-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.git.enable = true -- we need this for git.ignore has effect
lvim.builtin.nvimtree.setup.git.ignore = true
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

lvim.icons.ui.LineLeft = "│"
lvim.builtin.indentlines.options.char = "│"
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

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.rainbow.disable = { "jsx" } -- idk why no effect
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

require("lvim.lsp.manager").setup("emmet_ls")

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
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
}

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
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
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
		"gpanders/editorconfig.nvim",
		event = "InsertEnter",
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
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
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		lazy = true,
		-- module = "persistence",
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
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"folke/lsp-colors.nvim",
		event = "BufRead",
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"David-Kunz/jester",
		config = function()
			require("jester").setup({
				cmd = "npx jest -t '$result' -- $file",
			})
		end
	},
}

-- autocommands cause the save format broken
-- lvim.autocommands = {
-- This autocommand is for opening the Alpha dashboard if the last buffer is empty
-- {
--     "BufAdd", {
--         pattern = "*",
--         callback = function(args)
--             local api = vim.api
--             local bufnr = args.buf
--             local bufname = api.nvim_buf_get_name(bufnr)
--             local bufmodified = api.nvim_buf_get_option(bufnr, "modified")
--             local ft = vim.api.nvim_buf_get_option(bufnr, "ft")

--             if ft == "" and bufname == "" and not bufmodified then
--                 local normal_buffers = vim.tbl_filter(function(buf)
--                     return api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and buf ~= bufnr
--                 end, api.nvim_list_bufs())

--                 if #normal_buffers == 1 then
--                     vim.schedule(function()
--                         vim.cmd("Alpha")
--                         vim.cmd("bd " .. bufnr)
--                     end)
--                 end
--             end
--         end,
--     },
-- },
-- {
--     "FileType",
--     {
--         pattern = "alpha",
--         callback = function()
--             vim.cmd [[
--         setlocal nofoldenable
--         set nobuflisted
--       ]]
--         end,
--     },
-- },
-- {
--     "ColorScheme", {
--         pattern = "*",
--         callback = function()
--             local theme_colors = require("tokyonight.colors").setup()
--             local groups_use_bg = {
--                 "TelescopeBorder",
--                 "TelescopeNormal",
--             }
--             for _, name in ipairs(groups_use_bg) do
--                 vim.cmd(string.format("hi %s guibg=" .. theme_colors.bg, name))
--             end

--             local groups_use_dark_bg = {
--                 "BufferLineFill",
--                 "MsgArea",
--                 "NvimTree",
--                 "NvimTreeEndOfBuffer",
--                 "NvimTreeNormal",
--                 "NvimTreeNormalNC",
--                 "NvimTreeStatusLine",
--                 "NvimTreeStatusLineNC",
--                 "PanelHeading",
--                 "StatusLine",
--                 "StatusLineNC",
--                 "VertSplit",
--             }
--             for _, name in ipairs(groups_use_dark_bg) do
--                 vim.cmd(string.format("hi %s guibg=" .. theme_colors.bg_dark, name))
--             end

--             vim.cmd("hi NvimTreeStatusLineNC guifg=" .. theme_colors.bg_dark)
--         end,
--     },
-- }
-- }
