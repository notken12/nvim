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
    -- print(vim.g.colors_name)
    --[[ require("user.telescope-no-borders").setup() ]]
    require("user.colorscheme-loader").save()
    local ok, lualine = pcall(require, "user.lualine")
    if ok then
      lualine.setup()
    end
  end,
})

autocmd("OptionSet", {
  callback = function(v)
    if v.option_type == "bg" or v.option_type == "background" then
      require("user.colorscheme-loader").save()
      local ok, lualine = pcall(require, "user.lualine")
      if ok then
        lualine.setup()
      end
    end
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
