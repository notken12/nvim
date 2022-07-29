-- Disable squiggly things at end of file
vim.wo.fillchars = "eob: "
-- For dark theme
vim.g.vscode_style = "dark"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
vim.opt.background = "dark"
-- vim.cmd([[colorscheme vscode]])

-- vim.opt.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 1
-- vim.cmd([[colorscheme gruvbox-material]])

vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent = true
-- vim.cmd([[colorscheme tokyonight]])

-- vim.cmd([[colorscheme nordfox]])

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = false

-- vim.cmd([[colorscheme nord]])

-- Default options:
require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = false },
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = false, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  globalStatus = false, -- adjust window separators highlight for laststatus=3
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {},
  overrides = {},
})

vim.cmd([[colorscheme kanagawa]])

-- vim.cmd([[colorscheme mogo]])

require('user.telescope-no-borders')
