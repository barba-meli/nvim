local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {horizontal = {mirror = false}, vertical = {mirror = false}},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-s>"] = actions.select_vertical,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down
            },
            n = {
                ["<Esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-s>"] = actions.select_vertical,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down
            }
        },
        file_ignore_patterns = {'.git/*', 'node_modules/*', 'bower_components/*', '.svn/*', '.hg/*', 'CVS/*', '.next/*', '.docz/*', '.DS_Store'}
    }
}

local options = {noremap = true}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
