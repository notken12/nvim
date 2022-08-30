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

M.to_hex = function(color)
  return string.format("%x", color)
end

---The file system path separator for the current platform.
M.path_separator = "/"
M.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
if M.is_windows == true then
  M.path_separator = "\\"
end

---Split string into a table of strings using a separator.
---@param inputString string The string to split.
---@param sep string The separator to use.
---@return table table A table of strings.
M.split = function(inputString, sep)
  local fields = {}

  local pattern = string.format("([^%s]+)", sep)
  local _ = string.gsub(inputString, pattern, function(c)
    fields[#fields + 1] = c
  end)

  return fields
end

---Joins arbitrary number of paths together.
---@param ... string The paths to join.
---@return string
M.path_join = function(...)
  local args = { ... }
  if #args == 0 then
    return ""
  end

  local all_parts = {}
  if type(args[1]) == "string" and args[1]:sub(1, 1) == M.path_separator then
    all_parts[1] = ""
  end

  for _, arg in ipairs(args) do
    arg_parts = M.split(arg, M.path_separator)
    vim.list_extend(all_parts, arg_parts)
  end
  return table.concat(all_parts, M.path_separator)
end

return M
