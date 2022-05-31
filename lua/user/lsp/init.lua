require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

-- reload the current file so lsp actually starts for it
vim.defer_fn(function()
	vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
end, 0)
