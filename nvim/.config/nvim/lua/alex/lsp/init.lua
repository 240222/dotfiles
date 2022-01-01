local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require('alex.lsp.lsp-signature')
require('alex.lsp.lsp-installer')
require('alex.lsp.handlers').setup()
require('alex.lsp.null-ls')
