return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Pmenu" })
		vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "Pmenu" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#21252b" })

		require("onedarkpro").setup({
			options = {
				style = "dark",
				transparency = true,
			},
		})
		vim.cmd([[colorscheme onedark]])
	end,
}
