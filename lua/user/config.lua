

--lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
-- require('presence')
require('user.plugins')
require('user.gitsigns')
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" } }}
-- require('vgit').setup()
-- require('user.vgit')
require('user.toggleterm')
require('user.nvim-tree')
require('user.bufferline')
require('user.tree')
require('user.tagbar')
-- vim.opt.termguicolors = true
-- require("bufferline").setup{}
-- require('bufferline.state').set_offset(30, "Explorer")

vim.cmd('wincmd p')
