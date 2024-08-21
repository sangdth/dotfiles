require "sang.core.launch"
require "sang.core.options"
require "sang.core.keymaps"
require "sang.core.autocmds"

spec "sang.plugins.alpha" -- NOT
spec "sang.plugins.autopairs" -- NOT
spec "sang.plugins.autotags" -- NOT
spec "sang.plugins.bqf"
spec "sang.plugins.bufferline" -- NOT
spec "sang.plugins.cmp" -- NOT
-- spec "sang.plugins.colorizer"
spec "sang.plugins.colorscheme"
spec "sang.plugins.comment"
spec "sang.plugins.devicons"
spec "sang.plugins.formatters" -- NOT
spec "sang.plugins.gitsigns"
-- spec "sang.plugins.harpoon"
spec "sang.plugins.hop"
-- spec "sang.plugins.illuminate"
spec "sang.plugins.indentline"
spec "sang.plugins.linters"
spec "sang.plugins.lspconfig"
spec "sang.plugins.mason" -- NOT
spec "sang.plugins.mini"
-- spec "sang.plugins.navic"
spec "sang.plugins.nvimtree" -- NOT
-- spec "sang.plugins.project"
spec "sang.plugins.rename"
-- spec "sang.plugins.schemastore"
spec "sang.plugins.spider"
spec "sang.plugins.splitjoin"
spec "sang.plugins.tabnine"
spec "sang.plugins.telescope"
spec "sang.plugins.toggleterm"
spec "sang.plugins.treesitter"
-- spec "sang.plugins.whichkey"
spec "sang.plugins.lualine" -- NOT
-- spec "sang.plugins.ufo"

require "sang.core.lazy"
