return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"vim-tree/nvim-web-devicons",
		{
			"windwp/nvim-autopairs",
			opts = { disable_filetype = { "TelescopePrompt", "vim" } },
		},
	},

	-- use a release tag to download pre-built binaries
	-- version = '1.*',
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	build = "cargo build --release",
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "default",

			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			-- show with a list of providers
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},

			["<C-Tab>"] = {
				"snippet_forward",
				"fallback",
			},
			["<C-S-Tab>"] = {
				"snippet_backward",
				"fallback",
			},

			-- -- control whether the next command will be run when using a function
			-- ["<C-n>"] = {
			-- 	function(cmp)
			-- 		if some_condition then
			-- 			return
			-- 		end -- runs the next command
			-- 		return true -- doesn't run the next command
			-- 	end,
			-- 	"select_next",
			-- },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			ghost_text = { enabled = true },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = "rounded",
				},
			},
			menu = {
				-- border = "single",
				draw = {
					-- columns = {
					-- 	{ "kind_icon", "label", "label_description", gap = 1 },
					-- 	{ "kind" },
					-- },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", "kind", gap = 1 },
					},
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,
						},
					},
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- Experimental signature help support
		signature = { enabled = true },
		-- Use a preset for snippets, check the snippets documentation for more information
		--snippets = { preset = 'luasnip' },
	},
	opts_extend = { "sources.default" },
}
