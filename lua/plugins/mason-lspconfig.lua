return {
	"williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
	priority = 500, -- make sure to load this before nvim lspconfig and after mason
	lazy = false,
	config = function()
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({})
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			-- For example, a handler override for the `rust_analyzer`:
			["rust_analyzer"] = function()
				require("rust-tools").setup({})
			end,
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
		})
	end,
}
