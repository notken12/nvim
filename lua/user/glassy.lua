local M = {}

M.setup = function()
  local function hl(name, val)
    vim.api.nvim_set_hl(0, name, val)
  end

  local hl_groups = {
    "NormalFloat",
    "FloatBorder",
    "Normal",
    "Folded",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeCursorLine",
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePrompt",
    "TelescopeResults",
    "TelescopeResultsBorder",
    "TelescopePreview",
    "TelescopePreviewBorder",
    "TelescopePromptNormal",
    "TelescopePromptPrefix",
    "TelescopePromptBorder",
    "CursorLine",
    "Pmenu",
    "EndOfBuffer",
    "StatusLine",
    "TabLine",
    "TabLineSel",
    "TabLineFill",
  }

  for _, groups in ipairs(hl_groups) do
    hl(groups, { bg = "NONE" })
  end
end

return M
