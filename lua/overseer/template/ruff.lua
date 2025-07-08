local utils = require("utils")
local tool_name = "ruff"

return {
	name = tool_name,
	builder = function()
		return {
			name = tool_name,
			cmd = tool_name,
			args = {
				"check",
				"--output-format",
				"json-lines",
			},
			components = {
				{
					"on_output_parse",
					parser = {
						diagnostics = {
							"extract_json",
							{
								postprocess = function(result)
									result.lnum = result.location.row
									result.col = result.location.column
									result.text = result.message
									result.type = "W"
								end,
							},
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
