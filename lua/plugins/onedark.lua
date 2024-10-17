return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedarkpro").setup({
			options = {
                style = "dark",
				transparency = true,
			},
		})
		vim.cmd([[colorscheme onedark]])
	end,
}
