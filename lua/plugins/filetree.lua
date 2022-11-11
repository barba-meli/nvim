local wk = require('plugins.whichkey')

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  open_on_setup = true,
  sort_by = "case_sensitive",
  on_attach = function(bufnr)


    wk.register({
      ["<CR>"]          = { "edit" },
      o                 = { "edit" },
      ["<2-LeftMouse>"] = { "edit" },
      ["<C-e>"]         = { "edit_in_place" },
      O                 = { "edit_no_picker" },
      ["<C-v>"]         = { "vsplit" },
      ["<C-x>"]         = { "split" },
      ["<C-t>"]         = { "tabnew" },
      ["<"]             = { "prev_sibling" },
      [">"]             = { "next_sibling" },
      P                 = { "parent_node" },
      ["<BS>"]          = { "close_node" },
      ["<Tab>"]         = { "preview" },
      K                 = { "first_sibling" },
      J                 = { "last_sibling" },
      I                 = { "toggle_git_ignored" },
      H                 = { "toggle_dotfiles" },
      U                 = { "toggle_custom" },
      R                 = { "refresh" },
      a                 = { "create" },
      d                 = { "remove" },
      D                 = { "trash" },
      r                 = { "rename" },
      ["<C-r>"]         = { "full_rename" },
      x                 = { "cut" },
      c                 = { "copy" },
      p                 = { "paste" },
      y                 = { "copy_name" },
      Y                 = { "copy_path" },
      gy                = { "copy_absolute_path" },
      ["[e"]            = { "prev_diag_item" },
      ["[c"]            = { "prev_git_item" },
      ["]e"]            = { "next_diag_item" },
      ["]c"]            = { "next_git_item" },
      ["-"]             = { "dir_up" },
      s                 = { "system_open" },
      q                 = { "close" },
      W                 = { "collapse_all" },
      E                 = { "expand_all" },
      ["<C-k>"]         = { "toggle_file_info" },
    }, { mode = "n", buffer = bufnr })
  end,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
      }
    }
  },
  renderer = { group_empty = true },
  filters = { dotfiles = true }
})

wk.register({ pv = { '<cmd>NvimTreeToggle<CR>', "Project view" } }, { prefix = "<leader>", mode = "n" })
