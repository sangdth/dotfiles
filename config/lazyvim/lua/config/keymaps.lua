-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Left>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Right>", "<cmd>BufferLineCycleNext<CR>")

-- vim.keymap.set("n", "<Space>", "", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
-- vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
-- vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
-- vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- vim.keymap.set("n", "<C-tab>", "<c-6>", opts)

-- vim.keymap.set("n", "n", "nzz", opts)
-- vim.keymap.set("n", "N", "Nzz", opts)
-- vim.keymap.set("n", "*", "*zz", opts)
-- vim.keymap.set("n", "#", "#zz", opts)
-- vim.keymap.set("n", "g*", "g*zz", opts)
-- vim.keymap.set("n", "g#", "g#zz", opts)

-- Use better way for searching
vim.keymap.set("n", "sa", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "sf", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "sb", "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set("n", "sh", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
vim.keymap.set("n", "<leader>q", "<cmd>lua require 'utils.buff_kill'.buff_kill 'bd'<CR>")

-- Move current line / block with Alt-j/k
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Split and join brackets
vim.keymap.set("n", "sj", "<cmd>TSJSplit<CR>", opts)
vim.keymap.set("n", "sk", "<cmd>TSJJoin<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Sort list in visual mode
vim.keymap.set("v", "ss", ":'<,'>sort<CR>", opts)

-- vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

-- QuickFix
vim.keymap.set("n", "]q", ":cnext<CR>", opts)
vim.keymap.set("n", "[q", ":cprev<CR>", opts)
vim.keymap.set("n", "<C-q>", ":call QuickFixToggle()<CR>", opts)

-- more good
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
vim.keymap.set({ "n", "x" }, "j", "gj", opts)
vim.keymap.set({ "n", "x" }, "k", "gk", opts)
vim.keymap.set("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
