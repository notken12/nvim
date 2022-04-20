vim.cmd [[
try
  colorscheme gruvbox
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  set background=dark
endtry
]]
