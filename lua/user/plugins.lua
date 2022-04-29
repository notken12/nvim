local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

function packer_lazy_load(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, 0)
	end
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({
		"lewis6991/impatient.nvim",
		-- config = function() require('user.impatient') end
	})

	use("wbthomason/packer.nvim") -- Have packer manage itself

	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		keys = { "gcc", "gc" },
		-- event = {"BufRead", "BufNewFile"},
	})

	use({
		"numToStr/Comment.nvim", -- Easily comment stuff
		-- keys = {'gcc', 'gc'},
		after = "nvim-ts-context-commentstring",
		config = function()
			require("user.comment")
		end,
	})

	use("kyazdani42/nvim-web-devicons")
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.nvim-tree")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("user.bufferline")
		end,
	})
	use({ "moll/vim-bbye", event = "BufRead" })

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.lualine")
		end,
	})
	use("arkav/lualine-lsp-progress")

	use({
		"akinsho/toggleterm.nvim",
		opt = true,
		-- event="VimEnter",
		setup = function()
			packer_lazy_load("toggleterm.nvim")
		end,
		config = function()
			require("user.toggleterm")
		end,
	})

	use({
		"ahmedkhalf/project.nvim",
		opt = true,
		-- event="VimEnter",
		setup = function()
			packer_lazy_load("project.nvim")
		end,
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
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use({
		"folke/which-key.nvim",
		config = function()
			require("user.whichkey")
		end,
	})
	-- use "christoomey/vim-tmux-navigator"

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("gruvbox-community/gruvbox")
	use("Mofiqul/vscode.nvim")
	-- use 'lunarvim/darkplus.nvim'
	-- use 'martinsione/darkplus.nvim'
	-- use '~/dev/vscode.nvim'

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

	-- snippets
	use({
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	}) -- a bunch of snippets to use
	use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" }) --snippet engine

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		opt = true,
		-- after="cmp-nvim-lsp",
		setup = function()
			packer_lazy_load("nvim-lspconfig", 0)
			-- reload the current file so lsp actually starts for it
			vim.defer_fn(function()
				vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
			end, 0)
		end,
		config = function()
			require("user.lsp")
		end,
	}) -- enable LSP

	use({
		"ray-x/lsp_signature.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("user.lua-signature")
		end,
	}) -- function signature

	use({
		"williamboman/nvim-lsp-installer", -- simple to use language server installer
		-- commit ="e65e4966e1b3db486ae548a5674f20a8416a42d0",
		after = "nvim-cmp",
		config = function()
			require("user.lsp.lsp-installer")
		end,
	})
	use({ "tamago324/nlsp-settings.nvim", after = "nvim-cmp" }) -- language server settings defined in json for
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		opt = true,
		-- event = "VimEnter",
		setup = function()
			packer_lazy_load("telescope.nvim")
		end,
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

	-- Git
	-- use "tpope/vim-fugitive"
	use({
		"lewis6991/gitsigns.nvim",
		opt = true,
		-- event = {"BufRead", "BufNewFile"},
		setup = function()
			packer_lazy_load("gitsigns.nvim", 0)
		end,
		config = function()
			require("user.gitsigns")
		end,
	})

	-- Rust tools
	use({ "simrat39/rust-tools.nvim", event = { "BufRead", "BufNewFile" } })

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		event = { "BufRead", "BufNewFile" },
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
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- Startup time profiling
	use("dstein64/vim-startuptime")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
