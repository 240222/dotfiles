local fn = vim.fn

-- Auto-install of packer if it doesn't exist
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system{'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
  print "Install packer. You need to close and reopen nvim."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads nvim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so there is no error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Start packer in a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install plugins 
return require('packer').startup(function(use)

  -- Put your plugins here: 
  use 'wbthomason/packer.nvim' 
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'folke/tokyonight.nvim'
  -- Autodompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  -- Snippets
  use 'L3MON4D3/Luasnip'
  use 'rafamadriz/friendly-snippets'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer' -- easy way to install lsp servers
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }}
  }

  -- Support for Vim icons
  use 'ryanoasis/vim-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)