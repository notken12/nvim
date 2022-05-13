local utils = require("utils")

local M = {}

M.get_filename = function()
	return vim.fn.stdpath("config") .. "/mogo.txt"
end

M.add_tip = function(tip)
	local file = M.get_filename()
	utils.append_file(file, utils.trim(tip) .. "\n")
end

M.get_random_tip = function()
	local file = M.get_filename()
	local lines = utils.lines_from(file)

	math.randomseed(os.time())

	local i = math.random(#lines)
	return lines[i]
end

M.setup = function()
	vim.api.nvim_create_user_command("Mogo", function(args)
		if args.args ~= "" then
			-- Add tip if not empty
			M.add_tip(args.args)
		else
			-- Otherwise print a random tip
			print(M.get_random_tip())
		end
	end, {
		nargs = "*",
		desc = "Add a dashboard tip",
	})
end

return M
