require("user.impatient")
require("user.options")
require("user.plugins")
require("user.autocommands")
require("mogo").setup()

-- Cache the humungous packer_compiled.lua file with impatient.nvim
-- for a solid speedup
require("packer_compiled")
