local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end
cybu.setup({
	style = {
		border = "rounded",
		hide_buffer_id = true,
	},
	exclude = {
		"qf",
		"alpha",
	},
})
