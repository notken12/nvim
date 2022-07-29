local status_ok, lualine = pcall(require, "lualine")
local utils = require("utils")
if not status_ok then
  return
end

local status_ok_icons, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok_icons then
  return
end

local vscode_theme = require("user.lualine.vscode-theme")

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

vim.cmd([[
 function! Show_diff(a,b,c,d)
     Gitsigns diffthis
 endfunction
]])

local diff = {
  "diff",
  colored = false,
  symbols = { added = "+ ", modified = " ", removed = "- " }, -- changes diff symbols
  fmt = function(str)
    if str == "" then
      return ""
    end
    return "%@Show_diff@" .. str .. "%X"
  end,
}

local mode_icons = {
  insert = "+",
  normal = "",
  command = "⌘",
  terminal = "",
  visual = "",
  replace = "",
  ["v-line"] = "",
}

local mode = {
  "mode",
  fmt = function(str)
    local icon = mode_icons[str:lower()] or ""
    -- return icon .. " " .. str:sub(1, 1)
    -- return icon .. " " .. str
    return str
  end,
  color = { gui = "bold" }
}

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
  colored = false,
}

local filename = {
  "filename",
  file_status = false,
  padding = { left = 1, right = 1 },
  fmt = function(str)
    if str == "" then
      return nil
    end
    local ft = vim.bo.filetype
    local icon = nvim_web_devicons.get_icon_by_filetype(ft) or ""
    return icon .. " " .. str
  end,
  symbols = {
    unnamed = "",
  },
}
local function git_user_name()
  local handle = io.popen("git config -l | rg user.name")
  if handle == nil then
    return nil
  end
  local result = handle:read("*a")
  handle:close()
  return "   " .. result:sub(11, #result - 1)
end

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  fmt = function(str)
    local result = str
    -- if result ~= "" then
    -- 	result = result .. (git_user_name() or "")
    -- end
    return result
  end,
}

local location = {
  "location",
  color = { gui = "bold" },
}

local lsp_progress = {
  "lsp_progress",
  -- With spinner
  -- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
  -- colors = {
  --   percentage  = colors.cyan,
  --   title  = colors.cyan,
  --   message  = colors.cyan,
  --   spinner = colors.cyan,
  --   lsp_client_name = colors.magenta,
  --   use = true,
  -- },
  separators = {
    component = " ",
    progress = " | ",
    percentage = { pre = "", post = "%% " },
    title = { pre = "", post = ": " },
    lsp_client_name = { pre = "", post = "" }, spinner = { pre = "", post = "" },
    message = { commenced = "In Progress", completed = "Completed" },
  },
  display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
  timer = { progress_enddelay = 500, spinner = 200, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { "⠟ ", "⠯ ", "⠷ ", "⠾ ", "⠽ ", "⠻ " },
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
  -- return math.floor(line_ratio * 100 + 0.5) .. "%%"
end

local spaces = function()
  return " spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function window()
  return " " .. vim.api.nvim_win_get_number(0)
end

vim.cmd([[
 function! Show_lsp_clients(a,b,c,d)
     LspInfo
 endfunction
]])

local function lsp_client_names()
  local clients = vim.lsp.buf_get_clients()
  if #clients == 0 then
    return ""
  end
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, " " .. client.name)
  end
  local formatted = table.concat(client_names, "  ")
  local with_click_event = "%@Show_lsp_clients@" .. formatted .. "%X"
  return with_click_event
end

local function should_use_vscode_theme()
  return vim.g.colors_name == "vscode" or vim.g.colors_name == "mogo"
end

local function should_use_tokyonight_theme()
  return vim.g.colors_name == "tokyonight"
end

local function should_use_nord_theme()
  return vim.g.colors_name == "nord"
end

local function theme()
  if should_use_vscode_theme() then
    return vscode_theme
  elseif should_use_tokyonight_theme() then
    return "tokyonight"
  elseif should_use_nord_theme() then
    return "nord"
  end
  return "auto"
end

local powerline_component_separators = { left = "", right = "" }
local powerline_section_separators = { left = "", right = "" }
local normal_component_separators = { left = "|", right = "|" }
local normal_section_separators = { left = "", right = "" }

local function component_separators()
  if should_use_vscode_theme() then
    return normal_separators
  end
  return powerline_component_separators
end

local function section_separators()
  if should_use_vscode_theme() then
    return normal_separators
  end
  return powerline_section_separators
end

local fileformat = {
  "fileformat",
  padding = { left = 1, right = 1 },
}

local M = {}

M.setup = function()
  lualine.setup({
    options = {
      icons_enabled = true,
      -- theme = "auto",
      theme = theme(),
      component_separators = component_separators(),
      section_separators = section_separators(),
      -- component_separators = normal_component_separators,
      -- section_separators = normal_section_separators,
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch, },
      lualine_c = { diagnostics, lsp_progress },
      lualine_x = { diff, lsp_client_names },
      lualine_y = { filetype },
      lualine_z = { location },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end

M.setup()

return M
