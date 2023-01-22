local formatting = require("null-ls").builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	sources = {
		formatting.rustfmt,
		formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.name == "rust_analyzer" then -- you can add more by adding or
			client.resolved_capabilities.document_formatting = false
		end

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
