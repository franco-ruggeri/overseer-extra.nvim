local utils = require("overseer-extra.utils")
local tool_name = "cmake"

return {
	name = tool_name,
	builder = function()
		return {
			name = tool_name,
			cmd = "sh",
			args = { "-c", "mkdir -p build && cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug && cmake --build build" },
			components = {
				{ "on_output_quickfix", open = true },
				{ "default" },
			},
		}
	end,
	condition = {
		callback = function(opts)
			return utils.is_cmake_project(opts.dir) and vim.fn.executable(tool_name) == 1
		end,
	},
}
