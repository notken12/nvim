local present, nvim_gps = pcall(require, "nvim-gps")
if not present then
	return
end

nvim_gps.setup({
	disable_icons = false,
	separator = " > ",
	icons = {
		["class-name"] = " ", -- Classes and class-like objects
		["function-name"] = " ", -- Functions
		["method-name"] = " ", -- Methods (functions inside class-like objects)
		["container-name"] = " ", -- Containers (example: lua tables)
		["tag-name"] = "炙", -- Tags (example: html tags)
	},
})
