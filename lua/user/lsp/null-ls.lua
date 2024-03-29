local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local api = vim.api

local no_really = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "markdown", "text" },
  generator = {
    fn = function(params)
      local diagnostics = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find("mogo is bad")
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col,
            source = "mogo",
            message = "Don't you dare",
            severity = 1,
          })
        end
      end
      return diagnostics
    end,
  },
}

null_ls.register(no_really)

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettierd,
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    diagnostics.flake8,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      -- 	callback = function()
      -- 		vim.lsp.buf.format()
      -- 	end,
      -- })
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
    end
  end,
})
