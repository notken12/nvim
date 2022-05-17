-- Disable squiggly things at end of file
vim.wo.fillchars = "eob: "

-- For dark theme
vim.g.vscode_style = "dark"
-- Enable transparent background
-- vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
vim.opt.background = "dark"
vim.cmd([[colorscheme vscode]])

vim.g.gruvbox_contrast_dark = "medium"
vim.opt.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])
--
-- -- If you want transparent background uncomment:
-- vim.g.gruvbox_transparent_bg = 1
-- vim.cmd([[autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]])

-- vim.cmd([[colorscheme mogo]])
