require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "hls", "html", "marksman", "sqlls", "yamlls", "bashls" },
	automatic_installation = true,
})
-- require("mason-lspconfig").hls.setup({})
-- require("mason-lspconfig").sumneko_lua.setup({})
-- require("mason-lspconfig").marksman.setup({})
