-- local present, mason = pcall(require, "mason")
-- if not present then
-- 	return
-- end
-- local present, mason_lspconfig = pcall(require, "mason-lspconfig")
-- if not present then
-- 	return
-- end

-- mason.setup()
-- mason_lspconfig.setup()

-- require("user.lsp.lspconfig")
-- require("user.lsp.handlers").setup()
--[[ require("user.lsp.null-ls") ]]

-- reload the current file so lsp actually starts for it
-- vim.defer_fn(function()
-- 	vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
-- end, 0)

local present, lsp = pcall(require, "lsp-zero")
if not present then
	return
end

lsp.preset("recommended")
lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = false,
	call_servers = "local",
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})
lsp.nvim_workspace()
lsp.setup()

require("user.cmp")
require("user.autopairs")
