local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use 'arkav/lualine-lsp-progress'
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function () require("user.indentline") end
  }
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  -- use "christoomey/vim-tmux-navigator"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "gruvbox-community/gruvbox"
  use 'Mofiqul/vscode.nvim'
  -- use 'lunarvim/darkplus.nvim'
  -- use 'martinsione/darkplus.nvim'
  -- use '~/dev/vscode.nvim'

  -- cmp plugins
  use {"hrsh7th/nvim-cmp", after="friendly-snippets", config = function () require('user.cmp') end } -- The completion plugin
  use {"windwp/nvim-autopairs", after="nvim-cmp", config = function () require('user.autopairs') end } -- Autopairs, integrates with both cmp and treesitter
  use {"saadparwaiz1/cmp_luasnip", after="LuaSnip"} -- snippet completions
  use {"hrsh7th/cmp-nvim-lsp", after="cmp_luasnip"}
  use {"hrsh7th/cmp-buffer", after="nvim-cmp"}  -- buffer completions
  use {"hrsh7th/cmp-path", after="cmp-buffer"} -- path completions
  use {"hrsh7th/cmp-cmdline", after="nvim-cmp"} -- cmdline completions
  use {"ray-x/lsp_signature.nvim", after="nvim-cmp", config = function() require ('user.lua-signature') end} -- function signature

  -- snippets
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
  } -- a bunch of snippets to use
  use {"L3MON4D3/LuaSnip", after="nvim-cmp",
  } --snippet engine

  -- LSP
  use {"neovim/nvim-lspconfig", after="cmp-nvim-lsp", config = function () require('user.lsp') end} -- enable LSP
  use {"williamboman/nvim-lsp-installer", commit ="e65e4966e1b3db486ae548a5674f20a8416a42d0", after="nvim-cmp", 
  } -- simple to use language server installer
  use {"tamago324/nlsp-settings.nvim", after="nvim-cmp"} -- language server settings defined in json for
  use {"jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"

  -- Rust tools
  use "simrat39/rust-tools.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- Startup time profiling
  use "dstein64/vim-startuptime"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
