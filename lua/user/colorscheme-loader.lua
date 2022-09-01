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
  local name = file:read("l")
  local bg = file:read("l")
  io.close(file)
  return { name = name, bg = bg }
end

M.load = function()
  local data = M.get()
  if data then
    if data.bg then
      vim.o.background = data.bg
    end
    if data.name then
      pcall(vim.cmd, [[colorscheme ]] .. data.name)
    end
  end
end

M.save = function()
  local path = M.get_path()
  local file = io.open(path, "w+")
  file:write(vim.g.colors_name .. "\n" .. vim.o.background)
  io.close(file)
end

return M
