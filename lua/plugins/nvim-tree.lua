return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeOpen" },
	keys = {
		{ "<C-b>", "<cmd>NvimTreeToggle<cr>" },
		{ "<leader>r", "<cmd>NvimTreeRefresh<cr>" },
	},
	opts = {
		renderer = {
			full_name = true,
		},
        filters = {
            dotfiles = true,
        }
	},
}
