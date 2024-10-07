return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader><space>", desc = "telescope files" },
			{ "<leader>?", desc = "telescope oldfiles" },
			{ "<leader>D", desc = "lsp type definitions" },
			{ "<leader>a", desc = "Buffer Pick" },
			{ "<leader>b", desc = "telescope buffers" },
			{ "<leader>c", group = "copy options" },
			{ "<leader>c<space>", desc = "show copy history" },
			{ "<leader>ca", desc = "lsp code actions" },
			{ "<leader>co", desc = "show copy history" },
			{ "<leader>e", desc = "show diagnostic" },
			{ "<leader>q", desc = "diagnostic loclist" },
			{ "<leader>rn", desc = "lsp rename" },
			{ "<leader>s", group = "telescope actions" },
			{ "<leader>sb", desc = "buffer fuzzy search" },
			{ "<leader>so", desc = "document symbols" },
			{ "<leader>sp", desc = "live grep in project" },
			{ "<leader>w", group = "lsp workspace" },
			{ "<leader>wa", desc = "add workspace folder" },
			{ "<leader>wl", desc = "list workspace folders" },
			{ "<leader>wr", desc = "remove workspace folder" },
		})
	end,
}
