local options = {noremap = true}

vim.api.nvim_set_keymap('n', '<leader>pv', '<cmd>NERDTreeToggleVCS<CR>', options)

vim.g["NERDTreeShowHidden"] = 1
vim.g["NERDChristmasTree"] = 1
vim.g["NERDTreeIgnore"] = {'.git$', '^node_modules$', '^undodir$'}
vim.g["g:NERDTreeFileExtensionHighlightFullName"] = 1
vim.g["g:NERDTreePatternMatchHighlightFullName"] = 1
vim.g["NERDTreeChDirMode"] = 2
vim.g["NERDTreeHighlightCursorline"] = 1
vim.g["NERDTreeQuitOnOpen"] = 0
vim.g["NERDTreeShowLineNumbers"] = 1
