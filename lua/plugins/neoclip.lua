return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	keys = {
		{ "<leader>co", "<cmd>Telescope neoclip<cr>", mode = "n" },
	},
	opts = {},
}
