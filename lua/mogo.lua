local utils = require("utils")

local M = {}

M.get_filename = function()
  return vim.fn.stdpath("config") .. "/mogo.txt"
end

M.add_tip = function(tip)
  local file = M.get_filename()
  utils.append_file(file, "\n" .. tip)
end

M.setup = function()
  vim.api.nvim_create_user_command("Mogo", function(args)
    M.add_tip(args.args)
  end, {
    nargs = "*",
    desc = "Add a dashboard tip",
  })
end

return M
