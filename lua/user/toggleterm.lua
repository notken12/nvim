local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local M = {}

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  -- shading_factor = 1,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  -- shell = "fish",
  float_opts = {
    border = "solid",
    winblend = 0,
  },
  highlights = {
    FloatBorder = { link = "NormalFloat" },
    -- FloatBorder = { link = "VertSplit" },
    Normal = { link = "NormalFloat" },
    NormalFloat = { link = "NormalFloat" },
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end,
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

M.lazygit_toggle = function()
  lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

M.node_toggle = function()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

M.ncdu_toggle = function()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

M.htop_toggle = function()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

M.python_toggle = function()
  python:toggle()
end

local java_run = Terminal:new({ cmd = "javac % && java %", hidden = true })
M.java_run_toggle = function()
  java_run:toggle()
end

return M
