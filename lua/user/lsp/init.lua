local present, mason = pcall(require, "mason")
if not present then return end
local present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not present then return end

mason.setup()
mason_lspconfig.setup()

require('user.lsp.lspconfig')
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

-- reload the current file so lsp actually starts for it
-- vim.defer_fn(function()
-- 	vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
-- end, 0)
