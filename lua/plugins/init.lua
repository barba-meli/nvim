-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'gruvbox-community/gruvbox' }

  -- used to verify startup time, run :StartupTime
  -- use {'dstein64/vim-startuptime'}

  use {
    'tpope/vim-fugitive',
  }
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require("plugins.gitsigns")
    end
  }
  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      require("lsp")
    end
  }

  use { 'tpope/vim-commentary' }

  use { 'mbbill/undotree' }

  use { 'folke/which-key.nvim' }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons' -- optional, for file icons
    },
    config = function()
      require('plugins.filetree')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    -- requires = {
    --   'nvim-treesitter/nvim-treesitter-refactor', {
    --     'nvim-treesitter/completion-treesitter',
    --     run = function()
    --       vim.cmd [[TSUpdate]]
    --     end
    --   }
    -- },
    config = function()
      require('plugins.treesitter')
    end
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('plugins.telescope')
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", 'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      require('plugins.completion')
    end
  }

  use { 'nvim-treesitter/nvim-treesitter-context' }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.pairs")
    end
  }

  use { "windwp/nvim-ts-autotag",
    after = 'nvim-treesitter',
  }



  -- use {
  --   'mhartington/formatter.nvim',
  --   config = function()
  --     require('plugins.formatter')
  --   end
  -- }

  use { 'norcalli/nvim-colorizer.lua' }
end)
