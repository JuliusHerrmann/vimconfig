return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			-- Below uses cmake
			-- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	cmd = "Telescope",
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
		{ "<leader>sp", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>so", "<cmd>Telescope tags<cr>" },
		{ "<leader>?", "<cmd>Telescope oldfiles<cr>" },
	},
	config = function()
		-- local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				-- mappings = {
				-- 	i = {
				-- 		["<esc>"] = actions.close,
				-- 	},
				-- },
				border = false,
				prompt_prefix = " 🪐 ",
				selection_caret = "> ",
				entry_prefix = "  ",
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				winblend = 0,
			},
			extensions = {
				"themes",
				"terms",
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
