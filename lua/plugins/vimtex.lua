return {
	"lervag/vimtex",
	ft = { "tex", "bib" },
    keys = {
        {"<leader>ll", "<cmd>VimtexCompile<cr>"},
        {"<leader>lc", "<cmd>VimtexClean<cr>"},
        {"<leader>lv", "<cmd>VimtexView<cr>"}
    },
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
	end,
}
