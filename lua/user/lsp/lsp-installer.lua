local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp_installer.setup()

local server_opts = {
	["rust_analyzer"] = {
		checkOnSave = {
			allFeatures = true,
			overrideCommand = {
				"cargo",
				"clippy",
				"--workspace",
				"--message-format=json",
				"--all-targets",
				"--all-features",
			},
		},
	},
}

local servers = lsp_installer.get_installed_servers()
for _i, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
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
		require("user.rusttools").setup()
		-- Only if standalone support is needed
	end

	local merged_opts = vim.tbl_deep_extend("force", server_opts[server.name] or {}, opts)
	lspconfig[server.name].setup(merged_opts)
end
