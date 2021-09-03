" search
set ignorecase
set smartcase
set incsearch

set wildmode=longest,list,full
set wildmenu

" ignore files
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" clear search
nnoremap <leader><space> :nohlsearch<CR>
