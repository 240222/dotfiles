local fn = vim.fn
local install_path = fn.stdpath('data')..'~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

-- Start Plugins --
use 'wbthomason/packer.nvim'
use 'folke/tokyonight.nvim'
use 'Pocco81/TrueZen.nvim'
use 'numToStr/Comment.nvim'
use 'kyazdani42/nvim-web-devicons'
use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt=true}
}
 -- Explorer
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  config = function() require'nvim-tree'.setup {} end
}
-- Alpha dashboard
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
      end
  }

use {
     'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'}}
}

use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}

use 'numToStr/FTerm.nvim'
  use {
   'yamatsum/nvim-nonicons',
   requires = {'kyazdani42/nvim-web-devicons'}
}

-- Autocompletion
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'

-- Snippets
use 'L3MON4D3/LuaSnip'
use 'rafamadriz/friendly-snippets'

-- LSP 


-- End Plugins --

if packer_bootstrap then
    require('packer').sync()
  end
end)
