-- https://github.com/mattn/efm-langserver
local lspconfig = require('lspconfig')

local prettier_d = require"servers.prettier_d"
local eslint_d = require"servers.eslint_d"

local formatter = prettier_d
local linter = eslint_d

local languages = {
  javascript = {formatter, linter},
  typescript = {formatter, linter},
  javascriptreact = {formatter, linter},
  typescriptreact = {formatter, linter},
  ['javascript.jsx'] = {formatter, linter},
  ['typescript.tsx'] = {formatter, linter},
  vue = {formatter, linter},
  yaml = {formatter},
  json = {formatter},
  html = {formatter},
  scss = {formatter},
  css = {formatter},
  markdown = {formatter},
}

-- local efm_config = os.getenv('HOME') .. '/.config/efm-langserver/config.yaml'

-- local bin_path = language_server_path .. "/efm-langserver/efm-langserver"
local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  -- on_attach = function(client)
  --   client.resolved_capabilities.document_formatting = true
  --   client.resolved_capabilities.goto_definition = false
  --   set_lsp_config(client)
  -- end,
  -- return {
    --cmd = {
    --  bin_path,
    --  "-c",
    --   efm_config,
    --   --[[ "-loglevel",
    --  "10",
    --  "-logfile",
    --  "/tmp/efm.log" ]]
    --},

  root_dir = function(fname)
    if not eslint_config_exists() then
      print 'eslint configuration not found'
      return nil
    end
    -- check if eslint_d installed globally!
    -- return lspconfig.util.root_pattern("package.json", ".git")
    return vim.fn.getcwd()
    -- return getcwd()
    -- local cwd = lspconfig.util.root_pattern("tsconfig.json")(fname) or
    --          lspconfig.util.root_pattern(".eslintrc.json", ".git")(fname) or
    --          lspconfig.util.root_pattern("package.json", ".git/", ".zshrc")(fname);
    -- return cwd
  end,

  filetypes = vim.tbl_keys(languages),

  -- init_options = {
  --   documentFormatting = true
  -- },

  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = languages
  },
}
