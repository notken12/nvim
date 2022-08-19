require("user.impatient")
require("user.options")
-- require("user.keymaps")
require("user.autocommands")
require("user.plugins")
-- require("mogo").setup()

-- Cache the humungous packer_compiled.lua file with impatient.nvim
-- for a solid speedup
require("packer_compiled")
require('user.lsp')
