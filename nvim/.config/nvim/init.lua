require('packages')
require('config')
require('keybindings')

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == 'sumneko_lua' then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
    end
    server:setup(opts)
end)

