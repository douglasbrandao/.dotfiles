" Indent
set autoindent
set shiftround
set shiftwidth=4
set expandtab
set tabstop=4
set smarttab

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text Render
set wrap
set encoding=utf-8
set linebreak
syntax enable

" Interface
set number
set relativenumber
set title

" Options
set confirm
set spell
set nomodeline
set noswapfile

" Move lines up and down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

