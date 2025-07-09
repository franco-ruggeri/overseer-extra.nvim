local M = {}

M.is_cmake_project = function(cwd)
	return #vim.fs.find("CMakeLists.txt", { path = cwd, type = "file" }) > 0
end

M.is_python_project = function(cwd)
	return #vim.fs.find("pyproject.toml", { path = cwd, type = "file" }) > 0
end

return M
