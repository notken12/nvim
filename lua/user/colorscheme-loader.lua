local M = {}

local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

M.get_path = function()
	local dog = vim.fn.stdpath("data")
	return trim(dog) .. "/current-colorscheme"
end

M.get = function()
	local path = M.get_path()
	local file = io.open(path, "r")
	if not file then
		return nil
	end
	local name = file:read()
	io.close(file)
	return name
end

M.load = function()
	local name = M.get()
	if name then
		vim.cmd([[colorscheme ]] .. name)
	end
end

M.save = function()
	local path = M.get_path()
	local file = io.open(path, "w+")
	file:write(vim.g.colors_name)
	io.close(file)
end

return M
