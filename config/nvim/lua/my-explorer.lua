-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
local cmd = vim.cmd
local g = vim.g

vim.o.termguicolors = true

vim.api.nvim_set_keymap(
    "n",
    "<C-e>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

-- g.nvim_tree_icons = {
--     default       = "",
--     symlink       = "",
--     git = {
--         unstaged  = "",
--         staged    = "",
--         unmerged  = "",
--         renamed   = "",
--         untracked = "ﳁ"
--     },
--     folder = {
--         default   = "",
--         open      = "",
--         symlink   = "" -- 
--     },
--     lsp = {
--         hint      = "",
--         info      = "",
--         warning   = "",
--         error     = ""
--     }
-- }

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list = {
    { key = "<",                         cb = tree_cb("prev_sibling") },
    { key = "<BS>",                      cb = tree_cb("close_node") },
    { key = "<C-r>",                     cb = tree_cb("full_rename") },
    { key = "<C-t>",                     cb = tree_cb("tabnew") },
    { key = "<S-CR>",                    cb = tree_cb("close_node") },
    { key = "<Tab>",                     cb = tree_cb("preview") },
    { key = ">",                         cb = tree_cb("next_sibling") },
    { key = "H",                         cb = tree_cb("toggle_dotfiles") },
    { key = "I",                         cb = tree_cb("toggle_ignored") },
    { key = "J",                         cb = tree_cb("last_sibling") },
    { key = "K",                         cb = tree_cb("first_sibling") },
    { key = "R",                         cb = tree_cb("refresh") },
    { key = "Y",                         cb = tree_cb("copy_path") },
    { key = "[c",                        cb = tree_cb("prev_git_item") },
    { key = "]c",                        cb = tree_cb("next_git_item") },
    { key = "a",                         cb = tree_cb("create") },
    { key = "c",                         cb = tree_cb("copy") },
    { key = "d",                         cb = tree_cb("remove") },
    { key = "g?",                        cb = tree_cb("toggle_help") },
    { key = "gy",                        cb = tree_cb("copy_absolute_path") },
    { key = "p",                         cb = tree_cb("paste") },
    { key = "q",                         cb = tree_cb("close") },
    { key = "r",                         cb = tree_cb("rename") },
    { key = "x",                         cb = tree_cb("cut") },
    { key = "y",                         cb = tree_cb("copy_name") },
    { key = {"-", "<BS>"},               cb = tree_cb("dir_up") },
    { key = {"<2-RightMouse>", "<CR>"},  cb = tree_cb("cd") },
    { key = {"<C-s>", "S"},              cb = tree_cb("split") },
    { key = {"<C-v>", "V"},              cb = tree_cb("vsplit") },
    { key = {"P","h"},                   cb = tree_cb("parent_node") },
    { key = {"o", "<2-LeftMouse>"},      cb = tree_cb("edit") },
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 50,
    height = 30,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = list
    }
  }
}

cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
cmd "hi NvimTreeIndentMarker guifg=#22272e"
cmd "hi NvimTreeBg guibg = #ff0000"
cmd "hi NvimTreeNormal guibg=#242b38"
cmd "hi NvimTreeVertSplit guifg=#1e222a"
