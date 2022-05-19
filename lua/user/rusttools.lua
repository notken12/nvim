local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end

local M = {}

local opts = {
	tools = {
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			only_current_line = false,
			show_parameter_hints = true,
			-- prefix for parameter hints
			-- default: "<-"
			parameter_hints_prefix = "",

			-- prefix for all the other hints (type, chaining)
			-- default: "=>"
			other_hints_prefix = "",
			highlight = "Comment",
		},
		on_initialized = function(status)
			require("rust-tools.inlay_hints").set_inlay_hints()
		end,
	},
	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- standalone file support
		-- setting it to false may improve startup time
		standalone = false,
	}, -- rust-analyer options
}

M.setup = function()
	rust_tools.setup(opts)
	-- rust_tools.start_standalone_if_required()
	-- require("rust-tools.inlay_hints").set_inlay_hints()
end

return M
