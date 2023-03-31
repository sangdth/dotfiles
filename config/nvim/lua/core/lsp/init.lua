local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

print('cococococ')
require("core.lsp.mason")
require("core.lsp.handlers")
-- require("core.lsp.null-ls")
