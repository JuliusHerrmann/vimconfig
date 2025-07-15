return {
	"igorlfs/nvim-dap-view",
    lazy = true,
    enabled = false,
	---@module 'dap-view'
	---@type dapview.Config
	opts = {
		auto_toggle = false,
		winbar = {
			show = true,
			-- You can add a "console" section to merge the terminal with the other views
			sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl" },
			-- Must be one of the sections declared above (except for "console")
			default_section = "scopes",
			headers = {
				breakpoints = "Breakpoints [B]",
				scopes = "Scopes [S]",
				exceptions = "Exceptions [E]",
				watches = "Watches [W]",
				threads = "Threads [T]",
				repl = "REPL [R]",
				console = "Console [C]",
			},
			controls = {
				enabled = true,
				position = "right",
				buttons = {
					"play",
					"step_into",
					"step_over",
					"step_out",
					"step_back",
					"run_last",
					"terminate",
					"disconnect",
				},
				custom_buttons = {},
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
			},
		},
		windows = {
			height = 20,
			position = "below",
			terminal = {
				position = "left",
				width = 0.5,
				-- List of debug adapters for which the terminal should be ALWAYS hidden
				hide = {"scala", "metals"},
				-- Hide the terminal when starting a new session
				start_hidden = true,
			},
		},
		help = {
			border = nil,
		},
		-- Controls how to jump when selecting a breakpoint or navigating the stack
		switchbuf = "usevisible",
	},
}
