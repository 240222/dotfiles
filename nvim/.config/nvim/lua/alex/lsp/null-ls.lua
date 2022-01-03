local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"css",
				"html",
				"json",
				"yaml",
				"markdown",
			},
			extra_args = { "--single-quote", "--jsx-single-quote" },
		}),
		formatting.stylua,
		formatting.elm_format,
		diagnostics.eslint_d.with({
			filetypes = {
				"javascript",
			},
		}),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
