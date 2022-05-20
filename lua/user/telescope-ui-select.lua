local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

print("telescope ui select")
telescope.load_extension("ui-select")
