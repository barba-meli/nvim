vim.cmd [[packadd packer.nvim]]
local use = require("packer").use

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {'gruvbox-community/gruvbox'}
    use {
        'tpope/vim-commentary',
        config = function()
            require('plugins.commentary')
        end
    }
    use {
        'mbbill/undotree',
        config = function()
            require('plugins.undotree')
        end
    }
    use {
        "preservim/nerdtree",
        config = function()
            require('plugins.nerdtree')
        end
    }
    use {'tiagofumo/vim-nerdtree-syntax-highlight'}
    use {
        'folke/which-key.nvim',
        config = function()
            require('plugins.whichkey')
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-refactor', {
                'nvim-treesitter/completion-treesitter',
                run = function()
                    vim.cmd [[TSUpdate]]
                end
            }
        },
        config = function()
            require('plugins.treesitter')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require('plugins.telescope')
        end
    }
    use {'L3MON4D3/LuaSnip'}
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "quangnguyen30192/cmp-nvim-ultisnips", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-path", 'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ', 'honza/vim-snippets', 'SirVer/ultisnips', "hrsh7th/cmp-buffer", 'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip'

        },
        config = function()
            require('plugins.completion')
        end
    }
    use {
        'mhartington/formatter.nvim',
        config = function()
            require('plugins.formatter')
        end
    }
end)
