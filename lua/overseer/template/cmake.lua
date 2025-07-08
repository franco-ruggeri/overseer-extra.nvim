local utils = require("utils")

return {
	name = "cmake",
	builder = function()
		return {
			name = "cmake",
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
			return utils.is_cmake_project(opts.dir) and vim.fn.executable("cmake") == 1
		end,
	},
}
