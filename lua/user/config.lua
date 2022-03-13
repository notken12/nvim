--lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
-- require('presence')
require('user.gitsigns')
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" } }}
-- require('vgit').setup()
-- require('user.vgit')
require('user.toggleterm')
