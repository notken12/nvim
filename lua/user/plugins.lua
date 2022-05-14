local fn = vim.fn

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

-- Install your plugins here
return packer.startup({
	function(use)
		-- My plugins here
		use({
			"lewis6991/impatient.nvim",
			-- config = function() require('user.impatient') end
		})

		use("nathom/filetype.nvim")
		-- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

		use({ "wbthomason/packer.nvim", event = "VimEnter" }) -- Have packer manage itself

		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
			keys = { "gcc", "gc" },
		})

		use({
			"numToStr/Comment.nvim", -- Easily comment stuff
			after = "nvim-ts-context-commentstring",
			config = function()
				require("user.comment")
			end,
		})
		-- Colorschemes
		use({ "lifepillar/gruvbox8", after = "packer.nvim" })
		use({ "LunarVim/Colorschemes", after = "packer.nvim" })
		use({
			"Mofiqul/vscode.nvim",
			after = "packer.nvim",
			config = function()
				require("user.colorscheme")
			end,
		})
		use({
			"lifepillar/vim-colortemplate",
			-- after = "packer.nvim",
		})

		use({ "kyazdani42/nvim-web-devicons", after = "vscode.nvim" })
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = { "NvimTreeToggle", "NvimTreeFocus" },

			config = function()
				require("user.nvim-tree")
			end,
		})

		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = function()
				require("user.bufferline")
			end,
		})
		use({ "moll/vim-bbye", cmd = { "Bdelete", "Bwipeout" } })

		use({
			"nvim-lualine/lualine.nvim",
			after = "nvim-web-devicons",
			-- setup = function()
			-- 	packer_lazy_load("lualine.nvim")
			-- end,
			config = function()
				require("user.lualine")
			end,
		})
		use({ "arkav/lualine-lsp-progress", after = "lualine.nvim" })

		use({
			"akinsho/toggleterm.nvim",
			cmd = "ToggleTerm",
			config = function()
				require("user.toggleterm")
			end,
		})

		use({
			"ahmedkhalf/project.nvim",
			after = "telescope.nvim",
			config = function()
				require("user.project")
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("user.indentline")
			end,
		})
		use({
			"goolord/alpha-nvim",
			config = function()
				require("user.alpha")
			end,
		})
		use({ "antoinemadec/FixCursorHold.nvim", after = "packer.nvim" }) -- This is needed to fix lsp doc highlight
		use({
			"folke/which-key.nvim",
			after = "nvim-web-devicons",
			setup = function()
				packer_lazy_load("which-key.nvim")
			end,
			config = function()
				require("user.whichkey")
			end,
		})

		-- cmp plugins
		use({
			"hrsh7th/nvim-cmp",
			after = "friendly-snippets",
			config = function()
				require("user.cmp")
			end,
		}) -- The completion plugin
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("user.autopairs")
			end,
		}) -- Autopairs, integrates with both cmp and treesitter
		use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- buffer completions
		use({ "hrsh7th/cmp-path", after = "cmp-buffer" }) -- path completions
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" }) -- cmdline completions
		use({ "hrsh7th/cmp-calc", after = "nvim-cmp" }) -- math completions
		use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }) -- display function signature

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
			config = function()
				require("user.lsp")
			end,
			requires = { "nlsp-settings.nvim", "null-ls.nvim" },
		}) -- enable LSP

		use({
			"williamboman/nvim-lsp-installer", -- simple to use language server installer
			opt = true,
			setup = function()
				packer_lazy_load("nvim-lsp-installer")
				-- reload the current file so lsp actually starts for it
				vim.defer_fn(function()
					vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
				end, 0)
			end,
		})
		use({ "tamago324/nlsp-settings.nvim", after = "nvim-lsp-installer" }) -- language server settings defined in json for
		use({ "jose-elias-alvarez/null-ls.nvim", after = "nvim-lsp-installer" }) -- for formatters and linters

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = function()
				require("user.telescope")
			end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufRead", "BufNewFile" },
			config = function()
				require("user.treesitter")
			end,
		})
		use({
			"David-Kunz/treesitter-unit",
			after = "nvim-treesitter",
		})

		-- Git
		-- use "tpope/vim-fugitive"
		use({
			"lewis6991/gitsigns.nvim",
			opt = true,
			setup = function()
				packer_lazy_load("gitsigns.nvim")
			end,
			config = function()
				require("user.gitsigns")
			end,
		})
		use({
			"akinsho/git-conflict.nvim",
			opt = true,
			setup = function()
				packer_lazy_load("git-conflict.nvim")
			end,
			config = function()
				require("user.git-conflict")
			end,
		})

		-- Rust tools
		use({ "simrat39/rust-tools.nvim", after = "nvim-lsp-installer" })

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			module = "dap",
			config = function()
				require("user.nvim-dap")
			end,
		})
		use({
			"theHamsta/nvim-dap-virtual-text",
			after = "nvim-dap",
			config = function()
				require("user.nvim-dap-virtual-text")
			end,
		})
		use({
			"nvim-telescope/telescope-dap.nvim",
			after = { "nvim-dap", "telescope.nvim" },
			config = function()
				require("user.telescope-dap")
			end,
		})
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, after = "nvim-dap" })

		-- Startup time profiling
		use({
			"tweekmonster/startuptime.vim",
			cmd = "StartupTime",
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
