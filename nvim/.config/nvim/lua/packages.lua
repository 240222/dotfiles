local fn = vim.fn
local install_path = fn.stdpath('data')..'~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

-- Start Plugins --
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
        local startify = require('alpha.themes.startify')
        startify.section.bottom_buttons.val = {
          startify.button('e', 'new file', ':ene <bar> startinsert<cr>'),
          startify.button('v', 'nvim config', ':e ~/.config/nvim/init.lua<cr>'),
          startify.button('q', 'quit nvim', ':qa<cr>'),
        }
        vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', { noremap = true })
      end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

-- End Packages --

  if packer_bootstrap then
    require('packer').sync()
  end
end)
