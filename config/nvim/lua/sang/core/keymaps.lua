local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "Nop", opts)

keymap("n", "<C-i>", "<C-i>", opts)

keymap("n", "rn", vim.lsp.buf.rename, opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Use better way for searching
keymap("n", "sa", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "sf", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "sb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "sh", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "sl", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

-- Move current line / block with Alt-j/k
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Split and join brackets
keymap("n", "sj", "<cmd>TSJSplit<CR>", opts)
keymap("n", "sk", "<cmd>TSJJoin<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Sort list in visual mode
keymap("v", "ss", ":'<,'>sort<CR>", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

-- QuickFix
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprev<CR>", opts)
keymap("n", "<C-q>", ":call QuickFixToggle()<CR>", opts)

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", "<cmd>NvimTreeFocus<CR>", opts)
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>")
keymap("n", "<leader>q", "<cmd>lua require 'sang.plugins.bufferline'.buf_kill 'bd'<CR>")
keymap("n", "<leader>gg", "<cmd>lua require 'sang.plugins.toggleterm'.lazygit_toggle()<CR>")

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
