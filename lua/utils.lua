local M = {}

M.trim = function(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- http://lua-users.org/wiki/FileInputOutput

-- see if the file exists
M.file_exists = function(file)
	local f = io.open(file, "rb")
	if f then
		f:close()
	end
	return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
M.lines_from = function(file)
	if not M.file_exists(file) then
		return {}
	end
	local lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

-- Write a string to a file.
M.write_file = function(filename, contents)
	local fh = assert(io.open(filename, "wb"))
	fh:write(contents)
	fh:flush()
	fh:close()
end

-- Append a string to a file.
M.append_file = function(filename, contents)
	local fh = assert(io.open(filename, "a+"))
	fh:write(contents)
	fh:close()
end

-- M.append_line = function(filename, contents)
--   local fh = assert(io.open(filename, "a+"))
--   fh:write(contents)
--   fh:close()


M.get_hl = function(name)
	local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
	if not ok then
		return nil
	end
	return hl
end

M.to_hex = function (color)
	return string.format("%x", color)
end

return M
