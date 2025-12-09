return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "igorlfs/nvim-dap-view" },
		{ "igorlfs/nvim-dap-ui" },
		{ "theHamsta/nvim-dap-virtual-text" },
	},
	lazy = true,
	cmd = { "DapContinue", "DapToggleBreakpoint" },
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Breakpoint (debugger)",
		},
		{
			"<leader>dB",
			function()
				vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
					if input then
						require("dap").set_breakpoint(input)
					end
				end)
			end,
			desc = "Conditional breakpoint (debugger)",
		},
		{
			"<leader>dr",
			function()
				require("dap").continue()
			end,
			desc = "Continue (debugger)",
		},
		{
			"<leader>dc",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to cursor (debugger)",
		},
		{
			"<leader>dx",
			function()
				require("dap").terminate()
			end,
			desc = "Stop (debugger)",
		},
		{
			"<leader>dR",
			function()
				require("dap").restart()
			end,
			desc = "Restart (debugger)",
		},
		{
			"<leader>dK",
			function()
				require("dapui").eval()
			end,
			desc = "Hover (debugger)",
		},
		{
			"<Down>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<Right>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<Left>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<Up>",
			function()
				require("dap").restart_frame()
			end,
		},
		-- {"<leader>du", "<cmd>DapViewToggle<cr>", desc = "Show DapView (debugger)"},
		{ "<leader>du", "<Cmd> lua require('dapui').toggle()<CR>", desc = "Show Dap UI (debugger)" },
	},
	config = function()
		local dap = require("dap")
		-- colors
		local sign = vim.fn.sign_define
		sign("DapStopped", {
			text = "➤", -- or '▶️' or '➤' or any icon you prefer
			texthl = "DiagnosticWarn",
			linehl = "Visual", -- this highlights the entire line
			numhl = "DiagnosticWarn", -- this highlights the line number
		})
		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "red" })
		sign("DapBreakpointCondition", { text = "󰯳", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "red" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "red" })

		dap.configurations.scala = {
			{
				type = "scala",
				request = "launch",
				name = "AddPort",
				metals = {
					mainClass = "kugelblitz.Kugelblitz",
					args = { "canes.lua", "results/", "AddPort", "AddPort3x3mul" },
				},
			},
			{
				type = "scala",
				request = "launch",
				name = "TestConfig",
				metals = {
					mainClass = "kugelblitz.Kugelblitz",
					args = { "canes.lua", "results/", "TestConfig", "TestConfig1x1mul" },
				},
			},
			{
				type = "scala",
				request = "launch",
				name = "TestAluPP",
				metals = {
					mainClass = "kugelblitz.Kugelblitz",
					args = { "canes.lua", "results/", "TestAluPP", "TestAluPP3x3mul" },
				},
			},
			{
				type = "scala",
				request = "launch",
				name = "fixed addport",
				metals = {
					mainClass = "kugelblitz.Kugelblitz",
					args = { "fixed.lua", "results/", "AddPort.fixed.v"},
				},
			}
			-- {
			-- 	type = "scala",
			-- 	request = "launch",
			-- 	name = "Run or Test Target",
			-- 	metals = {
			-- 		runType = "runOrTestFile",
			-- 	},
			-- },
			-- {
			-- 	type = "scala",
			-- 	request = "launch",
			-- 	name = "Test Target",
			-- 	metals = {
			-- 		runType = "testTarget",
			-- 	},
			-- },
			-- {
			-- 	type = "scala",
			-- 	request = "attach",
			-- 	name = "Attach to Localhost",
			-- 	hostName = "localhost",
			-- 	port = 5005,
			-- 	buildTarget = "root",
			-- },
		}

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			}
		}
		dap.configurations.cpp = {
			{
				type = "codelldb",
				request = "launch",
				name = "julius error model test 1",
				program = "${workspaceFolder}/../../build/contrib/nr/examples/ns3.45-julius-error-model-default",
				args = {
					"--errorModelType=ns3::NrEesmIrT1", "--ueY=100", "--mcs=15",
				},
			},
			{
				type = "codelldb",
				request = "launch",
				name = "(gdb) Launch cttc-nr-demo-default",
				program = "${workspaceFolder}/../../build/contrib/nr/examples/ns3.45-cttc-nr-demo-default",
				-- args = {
				--                 "--errorModelType", "ns3::NrEesmIrT1"
				--             },
			},
			{
				type = "codelldb",
				request = "launch",
				name = "(gdb) Launch cttc-error-model",
				program = "${workspaceFolder}/../../build/contrib/nr/examples/ns3.45-cttc-error-model-default",
				args = {
					"--errorModelType=ns3::NrEesmIrT1", "--ueY=80", "--mcs=10",
				},
			}
		}
	end,
}
