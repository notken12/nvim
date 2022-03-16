-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Status bar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Color theme 👀
  use 'morhetz/gruvbox'
  
  -- tmux navigator
  use 'christoomey/vim-tmux-navigator'
  
  -- git integration
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  
  -- gcc and gc for commenting lines
  use 'tpope/vim-commentary'

  -- Dashboard on start
  use 'glepnir/dashboard-nvim'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  
  -- Tab bar
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  
  -- Git gutter and blame
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
    -- tag = 'release' -- To use the latest release
  }
  
  -- Toggle terminal
  use {"akinsho/toggleterm.nvim"}
  
  -- Ctrl + p search
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  })
  
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    -- config = function() require'nvim-tree'.setup {} end
  }
  
  -- Code outliner
  use {
    'preservim/tagbar'
  }
  
  -- Autocomplete
  use {'neoclide/coc.nvim', branch = 'release'}
  
  -- Syntax parser
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  
  -- Vue support for COC
  use {
    'yaegassy/coc-volar',
    run = 'npm ci'
  }


end)
