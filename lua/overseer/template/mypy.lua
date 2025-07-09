local utils = require("overseer-extra.utils")
local tool_name = "mypy"

-- Based on https://github.com/nvimtools/none-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/mypy.lua
return {
	name = tool_name,
	builder = function()
		return {
			name = tool_name,
			cmd = tool_name,
			args = {
				"--hide-error-context",
				"--no-color-output",
				"--show-absolute-path",
				"--show-column-numbers",
				"--show-error-codes",
				"--no-error-summary",
				"--no-pretty",
				".",
			},
			components = {
				{
					"on_output_parse",
					parser = {
						diagnostics = {
							"extract",
							"([^:]+):(%d+):(%d+): (%a+): (.*)  %[([%a-]+)%]",
							"filename",
							"lnum",
							"col",
							"type",
							"text",
							"code",
						},
					},
				},
				{ "on_result_diagnostics" },
				{ "default" },
			},
		}
	end,
	condition = {
		callback = function(opts)
			return utils.is_python_project(opts.dir) and vim.fn.executable(tool_name) == 1
		end,
	},
}
