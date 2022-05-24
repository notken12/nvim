-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1, -- or 0,
	files = 1, -- or 0,
	folder_arrows = 1, -- or 0
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

-- nvim_tree.setup({})

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = false,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	-- auto_close = true,
	-- auto_open = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = { ".git", "node_modules", ".cache" },
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = { ".git" },
	},
	git = {
		enable = false,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	-- root_folder_modifier = ":t",
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
		},
	},
})

-- nvim_tree.open()
-- nvim_tree.focus()
