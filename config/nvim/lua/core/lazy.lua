local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
{
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("core.nvim-tree")
  end,
},
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("core.which-key")
    end,
},
{
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ':TSUpdate',
    config = function()
      require("core.treesitter")
    end,
},
   {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require "core.bufferline"
    end,
  },
})
