" See: https://github.com/tylerlum/vim_configuration/blob/master/.vimrc

syntax on
colorscheme slate
set termguicolors

"set tabstop=4
"set softtabstop=4
"set expandtab
set showmatch

set number
set showcmd
set cursorline
highlight clear CursorLine
highlight LineNr ctermfg=gray

set paste
set hlsearch
set ignorecase
set smartcase
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
"set shiftwidth=3
"set softtabstop=3
"set expandtab
nnoremap <C-L> :nohl<CR><C-L>
"set relativenumber
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
"set list
"inoremap kj <esc>
"inoremap jk <esc>
"cnoremap kj <C-C>
"cnoremap jk <C-C>
"set clipboard=unnamed
"set clipboard=unnamedplus
"set backspace=indent,eol,start

"filetype indent plugin on
