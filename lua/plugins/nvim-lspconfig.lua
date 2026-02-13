return {
	"neovim/nvim-lspconfig",
	dependencies = { "mason-org/mason-lspconfig.nvim" }, -- make sure to load this after mason-lspconfig
	lazy = false,
	priority = 50,
	config = function()
		-- UNCOMMENT IN AN EMERGENCY
		vim.lsp.set_log_level("off")
		-- vim.lsp.set_log_level("debug")

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)


		vim.keymap.set("n", "gD", "<cmd>Telescope lsp_declarations<cr>")
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ max_height = 25, max_width = 120 })
		end)
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>")
		vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end)
		-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<cr>")
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
        vim.keymap.del("n", "grr")

		-- -- Use LspAttach autocommand to only map the following keys
		-- -- after the language server attaches to the current buffer
		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(ev)
		-- 		-- Enable completion triggered by <c-x><c-o>
		-- 		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		--
		-- 		-- Buffer local mappings.
		-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
		-- 		local opts = { buffer = ev.buf }
		-- 		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		-- 		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		-- 		vim.keymap.set("n", "gD", "<cmd>Telescope lsp_declatations<cr>", opts)
		-- 		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
		-- 		vim.keymap.set("n", "K", function()
		-- 			vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
		-- 		end, opts)
		-- 		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- 		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
		-- 		vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
		-- 		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- 		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- 		vim.keymap.set("n", "<space>wl", function()
		-- 			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- 		end, opts)
		-- 		-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		-- 		vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<cr>", opts)
		-- 		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		-- 		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		-- 		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- 		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
		-- 		-- vim.keymap.set('n', '<space>f', function()
		-- 		--   vim.lsp.buf.format { async = true }
		-- 		-- end, opts)
		-- 	end,
		-- })

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
				},
				-- numhl = {
				--     [vim.diagnostic.severity.ERROR] = "",
				--     [vim.diagnostic.severity.WARN] = "",
				--     [vim.diagnostic.severity.HINT] = "",
				--     [vim.diagnostic.severity.INFO] = ""
				-- }
			},
		})
		--
		vim.lsp.inlay_hint.enable(true)
		-- vim.lsp.codelens = {
		-- 	enabled = true,
		-- }
		-- -- nvim-cmp supports additional completion capabilities
		-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	end,
}
