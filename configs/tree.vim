
"" netrw
" let g:netrw_altv=1
" let g:netrw_winsize=80
" let g:netrw_liststyle=3
" let g:netrw_banner = 0

"" nerdtree
let NERDTreeShowHidden=1
let NERDChristmasTree=1    
let NERDTreeIgnore=['\.git$', '^node_modules$']
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeChDirMode=2
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1

"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"" open file tree
" nnoremap <leader>pv :Lex <bar> :vertical resize 25<CR>
nnoremap <leader>pv ::NERDTreeToggleVCS<CR>
