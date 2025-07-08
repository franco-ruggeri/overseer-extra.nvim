local utils = require("utils")
local tool_name = "pylint"

return {
	name = tool_name,
	builder = function()
		return {
			name = tool_name,
			cmd = tool_name,
			args = {
				"--output-format",
				"json",
				"--ignore",
				".venv",
				".",
			},
			components = {
				{
					"on_output_parse",
					parser = {
						diagnostics = {
							"sequence",
							{
								{ "skip_until", "{" },
								{
									"extract",
									{ append = false },
									'"type": "(.+)"',
									"type",
								},
								{ "skip_lines", 2 },
								{
									"extract",
									{ append = false },
									'"line": (%d+)',
									"lnum",
								},
								{
									"extract",
									{ append = false },
									'"column": (%d+)',
									"col",
								},
								{ "skip_lines", 2 },
								{
									"extract",
									{ append = false },
									'"path": "([^"]+)"',
									"filename",
								},
								{
									"extract",
									{ append = false },
									'"symbol": "([^"]+)"',
									"code",
								},
								{
									"extract",
									'"message": "([^"]+)"',
									"text",
								},
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
