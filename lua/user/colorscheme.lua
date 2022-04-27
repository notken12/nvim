-- For dark theme
vim.g.vscode_style = "dark"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- Enable italic comment
-- vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[set bg=dark]])
vim.cmd([[colorscheme vscode]])

-- vim.cmd [[
-- try
--   colorscheme gruvbox
--   set background=dark
-- catch /^Vim\%((\a\+)\)\=:E185/
--   set background=dark
-- endtry
-- ]]

-- vim.g.gruvbox_contrast_dark = 'medium'
-- vim.cmd([[set bg=dark]])
-- vim.cmd([[colorscheme gruvbox]])
--
-- -- If you want transparent background uncomment:
-- vim.g.gruvbox_transparent_bg = 1 
-- vim.cmd([[autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]])

-- vim.cmd([[colorscheme darkplus]])
