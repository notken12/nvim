-- Automatically install packer
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

	print("Cloning packer..")
	-- remove the dir before cloning
	vim.fn.delete(packer_path, "rf")
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		"--depth",
		"20",
		packer_path,
	})

	vim.cmd("packadd packer.nvim")
	present, packer = pcall(require, "packer")

	if present then
		print("Packer cloned successfully.")
		PACKER_BOOTSTRAP = true
	else
		error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
	end
end

vim.cmd([[packadd packer.nvim]])

function packer_lazy_load(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			packer.loader(plugin)
		end, 0)
	end
end

-- Have packer use a popup window
packer.init({
	profile = {
		enable = false,
		threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	compile_on_sync = true,
})

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

-- Install your plugins here
return packer.startup({
	function(use)
		-- My plugins here
		use({
			"lewis6991/impatient.nvim",
			-- config = function() require('user.impatient') end
		})

		-- use("nathom/filetype.nvim")
		-- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

		use({
			"wbthomason/packer.nvim",
			event = "VimEnter",
		}) -- Have packer manage itself

		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
			keys = { "gc", "gb" },
		})

		use({
			"numToStr/Comment.nvim", -- Easily comment stuff
			after = "nvim-ts-context-commentstring",
			config = [[require("user.comment")]],
		})
		-- Colorschemes
		use({
			"sainnhe/gruvbox-material",
			after = "packer.nvim",
		})
		use({
			"Mofiqul/vscode.nvim",
			after = "packer.nvim",
			config = [[require("user.colorscheme")]],
		})
		use({
			"shaunsingh/nord.nvim",
			after = "packer.nvim",
		})
		use({
			"rktjmp/lush.nvim",
			cmd = { "Lushify", "LushImport", "LushRunQuickstart", "LushRunTutorial" },
		})

		use({ "kyazdani42/nvim-web-devicons", after = "vscode.nvim" })
		use({
			"kyazdani42/nvim-tree.lua",
			ft = "alpha",
			cmd = { "NvimTreeToggle", "NvimTreeFocus" },
			config = [[require("user.nvim-tree")]],
		})

		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = [[require("user.bufferline")]],
		})
		-- use({
		-- 	"rafcamlet/tabline-framework.nvim",
		-- 	requires = "nvim-web-devicons",
		-- 	config = [[require("user.tabline")]],
		-- })
		use({ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } })

		use({
			"nvim-lualine/lualine.nvim",
			after = "lualine-lsp-progress",
			-- setup = function()
			-- 	packer_lazy_load("lualine.nvim")
			-- end,
			config = [[require("user.lualine")]],
		})
		use({ "arkav/lualine-lsp-progress", after = "nvim-web-devicons" })

		-- Show outline in winbar
		use({
			"SmiteshP/nvim-gps",
			after = "nvim-treesitter",
			config = [[require("user.nvim-gps")]],
		})

		use({
			"akinsho/toggleterm.nvim",
			cmd = "ToggleTerm",
			config = [[require("user.toggleterm")]],
		})

		use({
			"ahmedkhalf/project.nvim",
			after = "telescope.nvim",
			config = [[require("user.project")]],
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = [[require("user.indentline")]],
		})
		use({
			"goolord/alpha-nvim",
			-- after = "packer.nvim",
			-- disable = true,
			config = [[require("user.alpha")]],
		})
		use({ "antoinemadec/FixCursorHold.nvim", after = "packer.nvim" }) -- This is needed to fix lsp doc highlight
		use({
			"folke/which-key.nvim",
			opt = true,
			setup = [[packer_lazy_load("which-key.nvim")]],
			config = [[require("user.whichkey")]],
		})

		-- cmp plugins
		use({
			"hrsh7th/nvim-cmp",
			after = "friendly-snippets",
			config = [[require("user.cmp")]],
		}) -- The completion plugin
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = [[require("user.autopairs")]],
		}) -- Autopairs, integrates with both cmp and treesitter
		use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- buffer completions
		use({ "hrsh7th/cmp-path", after = "cmp-buffer" }) -- path completions
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" }) -- cmdline completions
		use({ "hrsh7th/cmp-calc", after = "nvim-cmp" }) -- math completions
		-- use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }) -- display function signature

		-- snippets
		use({
			"rafamadriz/friendly-snippets",
			event = "InsertEnter",
		}) -- a bunch of snippets to use
		use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" }) --snippet engine

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			after = "nvim-lsp-installer",
			-- module = "lspconfig",
			config = [[require("user.lsp")]],
			requires = { "nlsp-settings.nvim", "null-ls.nvim" },
		}) -- enable LSP

		use({
			"williamboman/nvim-lsp-installer", -- simple to use language server installer
			opt = true,
			after = "nvim-web-devicons",
			setup = function()
				packer_lazy_load("nvim-lsp-installer")
			end,
		})
		use({ "tamago324/nlsp-settings.nvim", after = "nvim-lsp-installer" }) -- language server settings defined in json for
		use({ "jose-elias-alvarez/null-ls.nvim", after = "nvim-lsp-installer" }) -- for formatters and linters
		use({ "kosayoda/nvim-lightbulb", after = "nvim-lspconfig", config = [[require("user.lightbulb")]] })

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			module = "telescope",
			config = [[require("user.telescope")]],
		})
		use({
			"nvim-telescope/telescope-dap.nvim",
			after = { "nvim-dap" },
			config = [[require("user.telescope-dap")]],
		})
		use({
			"nvim-telescope/telescope-ui-select.nvim",
			after = "packer.nvim",
			-- after = "telescope.nvim",
			-- config = [[require("user.telescope-ui-select"]],
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufRead", "BufNewFile" },
			setup = function()
				packer_lazy_load("nvim-treesitter")
			end,
			config = [[require("user.treesitter")]],
		})
		use({
			"David-Kunz/treesitter-unit",
			after = "nvim-treesitter",
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = [[require("user.colorizer")]],
		})

		-- Git
		-- use "tpope/vim-fugitive"
		use({
			"lewis6991/gitsigns.nvim",
			opt = true,
			setup = function()
				packer_lazy_load("gitsigns.nvim")
			end,
			config = [[require("user.gitsigns")]],
		})
		use({
			"akinsho/git-conflict.nvim",
			opt = true,
			setup = function()
				packer_lazy_load("git-conflict.nvim")
			end,
			config = [[require("user.git-conflict")]],
		})

		-- Rust tools
		use({ "simrat39/rust-tools.nvim", after = "nvim-lsp-installer" })

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			module = "dap",
			config = [[require("user.nvim-dap")]],
		})
		use({
			"Pocco81/dap-buddy.nvim",
			after = "nvim-dap",
		})
		use({
			"theHamsta/nvim-dap-virtual-text",
			after = "nvim-dap",
			config = [[require("user.nvim-dap-virtual-text")]],
		})
		use({
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			module = "dapui",
			config = [[require("user.nvim-dap-ui")]],
		})

		-- use({
		-- 	"folke/twilight.nvim",
		-- 	config = [[require("user.twilight")]],
		-- })

		-- Startup time profiling
		use({
			"tweekmonster/startuptime.vim",
			cmd = "StartupTime",
		})

		use({
			"ghillb/cybu.nvim",
			-- branch = "v1.x", -- won't receive breaking changes
			branch = "main", -- timely updates
			cmd = { "CybuPrev", "CybuNext" },
			config = [[require("user.cybu")]],
		})

		use({
			"notken12/gps-bar",
			after = "nvim-web-devicons",
			config = function()
				require("gps-bar").setup({
					separator = " > ",
				})
			end,
		})

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		-- Move packer_compiled lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
