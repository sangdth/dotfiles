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

require("lazy").setup({
{
  "nvim-tree/nvim-tree.lua",
  version = "45400cd7e02027937cd5e49845545e606ecf5a1f",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("core.nvim-tree")
  end,
},
{
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("core.which-key")
    end,
},
})
