local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                  _           ]],
	[[                                 (_)          ]],
	[[ _ __ ___   ___   __ _  _____   ___ _ __ ___  ]],
	[[| '_ ` _ \ / _ \ / _` |/ _ \ \ / / | '_ ` _ \ ]],
	[[| | | | | | (_) | (_| | (_) \ v /| | | | | | |]],
	[[|_| |_| |_|\___/ \__, |\___/ \_/ |_|_| |_| |_|]],
	[[                  __/ |                       ]],
	[[                 |___/                        ]],
}
dashboard.section.header.val = {
	[[                                            __                ]],
	[[  ___ ___     ___      __     ___   __  __ /\_\    ___ ___    ]],
	[[ / __` __`\  / __`\  /'_ `\  / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\ \/\ \L\ \/\ \L\ \/\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \_\ \____/\ \____ \ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/_/\/___/  \/___L\ \/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                       /\____/                                ]],
	[[                       \_/__/                                 ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":exe 'edit '.stdpath('config').'/init.lua' <CR>"),
	dashboard.button("q", "  Quit Mogovim", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	local names = { "mogo", "mog", "soug", "mango" }
	return "⚡ greetings " .. names[math.random(#names)] .. "  "
	-- return "⚡ mogo ⚡ "
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

-- ┌──────────────────────────────────────────────────────────┐
-- │                  /                                       │
-- │    header_padding                                        │
-- │                  \  ┌──────────────┐ ____                │
-- │                     │    header    │     \               │
-- │                  /  └──────────────┘      \              │
-- │ head_butt_padding                          \             │
-- │                  \                          occu_        │
-- │                  ┌────────────────────┐     height       │
-- │                  │       button       │    /             │
-- │                  │       button       │   /              │
-- │                  │       button       │  /               │
-- │                  └────────────────────┘‾‾                │
-- │                  /                                       │
-- │ foot_butt_padding                                        │
-- │                  \  ┌──────────────┐                     │
-- │                     │    footer    │                     │
-- │                     └──────────────┘                     │
-- │                                                          │
-- └──────────────────────────────────────────────────────────┘

local head_butt_padding = 4
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val - 3
local foot_butt_padding = math.floor((vim.fn.winheight("$") - 2 * header_padding - occu_height))

dashboard.config.layout = {
	{ type = "padding", val = header_padding },
	dashboard.section.header,
	{ type = "padding", val = head_butt_padding },
	dashboard.section.buttons,
	{ type = "padding", val = foot_butt_padding },
	dashboard.section.footer,
}
