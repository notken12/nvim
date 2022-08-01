local function get_hl(name)
  return vim.api.nvim_get_hl_by_name(name, true)
end

local function to_hex(color)
  return string.format("%x", color)
end

local bg = "NormalFloat"
local bg_hl = get_hl(bg)
local bg_hex = to_hex(bg_hl.background)

vim.cmd([[hi! TelescopeNormal guibg=#]] .. bg_hex)
--vim.cmd([[hi! link TelescopeBorder TelescopeNormal]])
local border_hl = get_hl("TelescopeBorder")
vim.cmd([[highlight! TelescopeBorder guifg=#]] ..
  bg_hex .. [[ guibg=#]] .. bg_hex)
vim.cmd([[highlight! TelescopeResultsBorder guifg=#]] ..
  bg_hex .. [[ guibg=#]] .. bg_hex)
vim.cmd([[highlight! TelescopePreviewBorder guifg=#]] ..
  bg_hex .. [[ guibg=#]] .. bg_hex)

local title_hl = get_hl("Constant")
vim.cmd([[highlight! TelescopeTitle gui=bold guifg=#]] .. bg_hex ..
  [[ guibg=#]] .. to_hex(title_hl.foreground))

local preview_hl = get_hl("String")
vim.cmd([[highlight! TelescopePreviewTitle gui=bold guifg=#]] .. bg_hex ..
  [[ guibg=#]] .. to_hex(preview_hl.foreground))

local prompt = "ColorColumn"
local prompt_hl = get_hl(prompt)
local prompt_bg_hex = to_hex(prompt_hl.background)

vim.cmd([[hi! TelescopePromptNormal guibg=#]] .. prompt_bg_hex)
vim.cmd([[hi! TelescopePromptBorder guibg=#]] .. prompt_bg_hex .. [[ guifg=#]] .. prompt_bg_hex)

vim.cmd([[nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]])
