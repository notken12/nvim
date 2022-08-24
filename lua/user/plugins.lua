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

    -- use("nathom/filetype.nvim")
    -- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

    use({
      "wbthomason/packer.nvim",
      --event = "VimEnter",
    }) -- Have packer manage itself

    use({
      "JoosepAlviste/nvim-ts-context-commentstring",
      keys = { "gc", "gb", "gcc" },
    })

    use({
      "numToStr/Comment.nvim", -- Easily comment stuff
      after = "nvim-ts-context-commentstring",
      config = [[require("user.comment")]],
    })
    -- Colorschemes
    use({
      "sainnhe/gruvbox-material",
    })
    use({
      "rebelot/kanagawa.nvim",
      config = [[require("user.colorscheme")]],
    })
    use({
      "Mofiqul/vscode.nvim",
    })
    use({
      "folke/tokyonight.nvim",
    })
    use({
      "EdenEast/nightfox.nvim",
      tag = "v1.0.0",
    })
    use({
      "shaunsingh/nord.nvim",
    })
    use("marko-cerovac/material.nvim")
    use 'navarasu/onedark.nvim'
    use 'sainnhe/everforest'

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
      -- after = "packer.nvim",
      after = "lualine-lsp-progress",
      -- setup = function()
      -- 	packer_lazy_load("lualine.nvim")
      -- end,
      config = [[require("user.lualine").setup()]],
    })
    use({ "arkav/lualine-lsp-progress" })

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
    -- use({ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" })
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

    use({
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    })

    use({ "tamago324/nlsp-settings.nvim" }) -- language server settings defined in json for
    use({ "jose-elias-alvarez/null-ls.nvim" })
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
    use({ "simrat39/rust-tools.nvim" })
    use({ "mfussenegger/nvim-jdtls",
      --config=[[require("user.jdtls")]]
    })

    -- Debugging
    use({
      "mfussenegger/nvim-dap",
      module = "dap",
      config = [[require("user.nvim-dap")]],
    })
    use({
      "Pocco81/dap-buddy.nvim",
      -- after = "nvim-dap",
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
      "ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({
          disable_legacy_commands = true
        })
      end,
    })

    -- use({
    -- 	"ghillb/cybu.nvim",
    -- 	-- branch = "v1.x", -- won't receive breaking changes
    -- 	branch = "main", -- timely updates
    -- 	cmd = { "CybuPrev", "CybuNext" },
    -- 	config = [[require("user.cybu")]],
    -- })
    --
    -- use({
    --   "notken12/gps-bar",
    --   after = "nvim-web-devicons",
    --   config = function()
    --     require("gps-bar").setup({
    --       separator = " > ",
    --     })
    --   end,
    -- })

    -- use({
    --   'andweeb/presence.nvim',
    --   config = function()
    --     -- The setup config table shows all available config options with their default values:
    --     require("presence"):setup({
    --       -- General options
    --       auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    --       neovim_image_text  = "Mogo's text editor of choice", -- Text displayed when hovered over the Neovim image
    --       main_image         = "neovim", -- Main image display (either "neovim" or "file")
    --       -- client_id          = "793271441293967371", -- Use your own Discord application client id (not recommended)
    --       log_level          = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    --       debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    --       enable_line_number = false, -- Displays the current line number instead of the current project
    --       blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    --       buttons            = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    --       file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    --
    --       -- Rich Presence text options
    --       editing_text        = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    --       file_explorer_text  = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    --       git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    --       plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    --       reading_text        = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    --       workspace_text      = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    --       line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    --     })
    --   end
    -- })

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
