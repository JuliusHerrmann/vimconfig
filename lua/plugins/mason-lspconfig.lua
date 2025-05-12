
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      telemetry = {
                enable = false,
            },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
    },
  },
})

return {
	"mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
	priority = 500, -- make sure to load this before nvim lspconfig and after mason
	lazy = false,
	config = function()
		require("mason-lspconfig").setup({
            automatic_enable = true
		})
	end,
}
