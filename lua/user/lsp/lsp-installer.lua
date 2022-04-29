local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

print("lsp installer")
lsp_installer.setup()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local servers = lsp_installer.get_installed_servers()
for _i, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	print(server.name)
	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "rust_analyzer" then
		-- Initialize the LSP via rust-tools instead
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.            --
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			-- server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
		-- Only if standalone support is needed
		require("rust-tools").start_standalone_if_required()
		lspconfig.rust_analyzer.setup({})
		-- return
	end

	lspconfig[server.name].setup(opts)
end
