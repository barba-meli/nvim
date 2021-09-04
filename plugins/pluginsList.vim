" plugins

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'folke/which-key.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

call plug#end()
