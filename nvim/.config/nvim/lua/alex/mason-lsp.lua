require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "html", "marksman", "sqlls", "yamlls", "bashls" },
	automatic_installation = true,
})
