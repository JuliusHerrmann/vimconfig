return {
	"scalameta/nvim-metals",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "scala", "sbt", "java" },
	opts = function()
		local metals_config = require("metals").bare_config()
		metals_config.init_options.statusBarProvider = "on"
		metals_config.settings = {
			inlayHints = {
				byNameParameters = { enable = true },
				hintsInPatternMatch = { enable = true },
				implicitArguments = { enable = true },
				implicitConversions = { enable = true },
				inferredTypes = { enable = true },
				typeParameters = { enable = true },
			},
		}

		metals_config.on_attach = function(client, bufnr)
			-- your on_attach function
			require("metals").setup_dap()
		end

		return metals_config
	end,
	config = function(self, metals_config)
		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = self.ft,
			callback = function()
				require("metals").initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
