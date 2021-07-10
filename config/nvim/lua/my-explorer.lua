local cmd = vim.cmd
local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 45
g.nvim_tree_ignore = {}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_tab_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_allow_resize = 1
g.nvim_tree_special_files = {}

g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default       = "",
    symlink       = "",
    git = {
        unstaged  = "",
        staged    = "",
        unmerged  = "",
        renamed   = "",
        untracked = "ﳁ"
    },
    folder = {
        default   = "",
        open      = "",
        symlink   = "" -- 
    }
}

local get_lua_cb = function(cb_name)
    return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- Mappings for nvimtree

vim.api.nvim_set_keymap(
    "n",
    "<C-e>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

g.nvim_tree_bindings = {
    { key = "<",                                  cb = tree_cb("prev_sibling") },
    { key = "<BS>",                               cb = tree_cb("close_node") },
    { key = "<C-r>",                              cb = tree_cb("full_rename") },
    { key = "<C-t>",                              cb = tree_cb("tabnew") },
    { key = "<C-x>",                              cb = tree_cb("split") },
    { key = "<S-CR>",                             cb = tree_cb("close_node") },
    { key = "<Tab>",                              cb = tree_cb("preview") },
    { key = ">",                                  cb = tree_cb("next_sibling") },
    { key = "H",                                  cb = tree_cb("toggle_dotfiles") },
    { key = "I",                                  cb = tree_cb("toggle_ignored") },
    { key = "J",                                  cb = tree_cb("last_sibling") },
    { key = "K",                                  cb = tree_cb("first_sibling") },
    { key = "P",                                  cb = tree_cb("parent_node") },
    { key = "R",                                  cb = tree_cb("refresh") },
    { key = "Y",                                  cb = tree_cb("copy_path") },
    { key = "[c",                                 cb = tree_cb("prev_git_item") },
    { key = "]c",                                 cb = tree_cb("next_git_item") },
    { key = "a",                                  cb = tree_cb("create") },
    { key = "c",                                  cb = tree_cb("copy") },
    { key = "d",                                  cb = tree_cb("remove") },
    { key = "g?",                                 cb = tree_cb("toggle_help") },
    { key = "gy",                                 cb = tree_cb("copy_absolute_path") },
    { key = "p",                                  cb = tree_cb("paste") },
    { key = "q",                                  cb = tree_cb("close") },
    { key = "r",                                  cb = tree_cb("rename") },
    { key = "x",                                  cb = tree_cb("cut") },
    { key = "y",                                  cb = tree_cb("copy_name") },
    { key = {"-", "<BS>"},                        cb = tree_cb("dir_up") },
    { key = {"<2-RightMouse>", "<C-]>", "<CR>"},  cb = tree_cb("cd") },
    { key = {"<C-v>", "E"},                       cb = tree_cb("vsplit") },
    { key = {"o", "<2-LeftMouse>"},               cb = tree_cb("edit") },
}

cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
cmd "hi NvimTreeIndentMarker guifg=#22272e"
cmd "hi NvimTreeNormal guibg=#1b1f27"
cmd "hi NvimTreeVertSplit guifg=#1e222a"
