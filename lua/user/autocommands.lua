local autocmd = vim.api.nvim_create_autocmd

-- Disable statusline in alpha
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

autocmd("ColorScheme", {
  callback = function()
    require("user.lualine").setup()
    require("user.telescope-no-borders")
  end,
})

-- autocmd("VimEnter", {
-- 	callback = function()
-- 		require("user.keymaps")
-- 	end,
-- })

autocmd("TextYankPost", {
  callback = function()
    require("vim.highlight").on_yank({
      higroup = "visual",
      timeout = 200,
    })
  end,
})
