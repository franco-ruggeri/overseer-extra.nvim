local tool_name = "latexmk"

return {
	name = tool_name,
	builder = function()
		return {
			name = tool_name,
			cmd = tool_name,
			args = {
				"-pdf",
				"-interaction=nonstopmode",
				"-synctex=1",
				"-outdir=output",
			},
			components = {
				{ "on_output_quickfix", open = true },
				{ "default" },
			},
		}
	end,
	condition = {
		callback = function()
			return #vim.fn.glob("*.tex", false, true) > 0 and vim.fn.executable(tool_name) == 1
		end,
	},
}
