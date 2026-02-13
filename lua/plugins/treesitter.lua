return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 15, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
			},
		},
	},
	config = function()
		local languages = {
			"markdown",
			"markdown_inline",
			"c",
			"cpp",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"rust",
			"java",
			"python",
			"javascript",
			"json",
            "scala",
            "css",
            "html",
            "javascript",
            "matlab",
		}
		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		--- @param filetype string For supported languages see https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
		local function treesitter_enable(filetype)
			local WAIT_TIME = 1000 * 30 -- 30 seconds
			require("nvim-treesitter").install(filetype):wait(WAIT_TIME)
			local lang = vim.treesitter.language.get_lang(filetype)
			vim.api.nvim_create_autocmd("FileType", {
				desc = "Enable Treesitter features for " .. lang,
				pattern = vim.treesitter.language.get_filetypes(lang),
				callback = function()
					if vim.treesitter.query.get(lang, "highlights") then
						vim.treesitter.start()
					end
					if vim.treesitter.query.get(lang, "indents") then
						vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
					end
					if vim.treesitter.query.get(lang, "folds") then
						vim.wo.foldmethod = "expr"
						vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					end
				end,
			})
		end

		for _, l in pairs(languages) do
			treesitter_enable(l)
		end

		return treesitter_enable
	end,
}
