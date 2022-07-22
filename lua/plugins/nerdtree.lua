local wk = require('plugins.whichkey')
wk.register({pv = {'<cmd>NERDTreeToggleVCS<CR>', "Project view"}}, {prefix = "<leader>", mode = "n"})

vim.g["NERDTreeShowHidden"] = 1
vim.g["NERDChristmasTree"] = 1
vim.g["NERDTreeIgnore"] = {'.git$', '^node_modules$', '^undodir$'}
vim.g["NERDTreeFileExtensionHighlightFullName"] = 1
vim.g["NERDTreeExactMatchHighlightFullName"] = 1
vim.g["NERDTreePatternMatchHighlightFullName"] = 1
vim.g["NERDTreeChDirMode"] = 2
vim.g["NERDTreeHighlightCursorline"] = 1
vim.g["NERDTreeQuitOnOpen"] = 0
vim.g["NERDTreeShowLineNumbers"] = 1
vim.g["NERDTreeSyntaxEnabledExtensions"] = {
    "bmp", "css", "go", "html", "java", "jpg", "js", "json", "jsx", "less", "lua", "markdown", "md", "php", "png", "py", "scss", "sh", "sql", "vim",
    "ts", "tsx"
}
