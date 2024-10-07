return {
	"github/copilot.vim",
	event = "InsertEnter",
	init = function()
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<A-c>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
