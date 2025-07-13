return {
	"ibhagwan/fzf-lua",
    enabled = false,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	cmd = "FzfLua",
	keys = {
		{ "<leader><space>", "<cmd>FzfLua files<cr>" },
		{ "<leader>b", "<cmd>FzfLua buffers<cr>" },
		-- { "<leader>sb", "<cmd>FzfLua current_buffer_fuzzy_find<cr>" },
		{ "<leader>sp", "<cmd>FzfLua live_grep<cr>" },
		{ "<leader>so", "<cmd>FzfLua tags<cr>" },
		{ "<leader>?", "<cmd>FzfLua oldfiles<cr>" },
	},
	opts = {
        "telescope",
        winopts={preview={default="bat"}}
    },
}
