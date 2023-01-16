require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "hls", "html", "marksman", "sqlls", "yamlls", "bashls", "rust" },
	automatic_installation = true,
})
