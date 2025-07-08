return {
	name = "latexmk",
	builder = function()
		return {
			name = "latexmk",
			cmd = "latexmk",
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
			return #vim.fn.glob("*.tex", false, true) > 0 and vim.fn.executable("latexmk") == 1
		end,
	},
}
