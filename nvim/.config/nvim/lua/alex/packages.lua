local fn = vim.fn
local install_path = fn.stdpath("data") .. "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
return require("packer").startup(function(use)
	-- Start Plugins --
	use("wbthomason/packer.nvim")

	-- LSP
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'simrat39/rust-tools.nvim'

        -- Optional dependencies
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use {
          'nvim-telescope/telescope.nvim', tag = '0.1.1',
          -- or                          , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
        use {'nvim-telescope/telescope-dap.nvim'}
        use({
          'nvim-treesitter/nvim-treesitter', 
          run = ':TSUpdate',
        })

        -- Debugging
        use 'mfussenegger/nvim-dap'
        use {'theHamsta/nvim-dap-virtual-text'}
        use {'rcarriga/nvim-dap-ui'}

        -- Themes 

	-- Explorer

	-- Alpha dashboard

	-- Telescope

	-- Null-ls 

	-- Buffers

	-- Project

	-- Markdown

	-- Automatically create TOC for markdown files

	-- End Plugins --

	if packer_bootstrap then
		require("packer").sync()
	end
end)
