local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

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

local dont_setup = {
	["jdtls"] = true,
}

local servers = mason_lspconfig.get_installed_servers()
for _i, server in ipairs(servers) do
	if not dont_setup[server] then
		local opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		}
		if server == "jsonls" then
			local jsonls_opts = require("user.lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server == "sumneko_lua" then
			local sumneko_opts = require("user.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		if server == "rust_analyzer" then
			-- Initialize the LSP via rust-tools instead
			require("user.rusttools").setup()
			-- Only if standalone support is needed
		end

		local merged_opts = vim.tbl_deep_extend("force", server_opts[server] or {}, opts)
		lspconfig[server].setup(merged_opts)
	end
end

-- print("lsp setup")
