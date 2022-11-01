local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local ok, jdtls = pcall(require, "jdtls")
if ok then
  jdtls.setup_dap()
end

local utils = require("utils")

local ok, mason_dap = pcall(require, "mason-nvim-dap")
if not ok then
  return
end

-- dap.setup()
mason_dap.setup()

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticSignError" }
)
