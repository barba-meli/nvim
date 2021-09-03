"" neovim

set path+=**
let mapleader = " "

" " Plugins
"
source $HOME/.config/nvim/plugins/autoload.vim
source $HOME/.config/nvim/plugins/pluginsList.vim
source $HOME/.config/nvim/plugins/whichKey.vim
source $HOME/.config/nvim/plugins/treesitter.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/lsp/index.vim



" " settings
"
source $HOME/.config/nvim/configs/colors.vim
source $HOME/.config/nvim/configs/maps.vim
source $HOME/.config/nvim/configs/tree.vim
source $HOME/.config/nvim/configs/helpers.vim
source $HOME/.config/nvim/configs/navigation.vim
source $HOME/.config/nvim/configs/undo.vim
source $HOME/.config/nvim/configs/finder.vim
source $HOME/.config/nvim/configs/misc.vim

lua require("barba")
