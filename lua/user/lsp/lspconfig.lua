local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local utils = require("utils")

local jdtls_folder = utils.path_join(vim.fn.stdpath("data"), "mason", "packages", "jdtls")
local jdtls_jar = utils.path_join(jdtls_folder, "plugins", "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar")
local jdtls_bin_folder = utils.path_join(jdtls_folder, "bin")
local jdtls_binary_path = utils.path_join(jdtls_bin_folder, "jdtls")

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
  ["jdtls"] = {
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml"),
    cmd = {
      "java",
      "-jar",
      jdtls_jar,
      "-configuration",
      utils.path_join(jdtls_folder, "config_win"),
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.level=ALL",
      "-noverify",
      "-Xmx1G",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-data",
      utils.path_join(".", ".jdtls_data"),
    },
    single_file_support = true,
    -- autostart = false
  },
}

local servers = mason_lspconfig.get_installed_servers()
for _i, server in ipairs(servers) do
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
