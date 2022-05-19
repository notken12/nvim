local present, tabline_framework = pcall(require, "tabline_framework")
if not present then
	return
end

local render = function(f)
	f.add(" 🐶 ")

	f.make_tabs(function(info)
		f.add(" " .. info.index .. " ")
		f.add(info.filename or "[no name]")
		f.add(info.modified and "+")
		f.add(" ")
	end)
end

tabline_framework.setup({
	-- Render function is resposible for generating content of tabline
	-- This is the place where you do your magic!
	render = render,
})
