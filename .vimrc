set number
set relativenumber
set tabstop=4
set shiftwidth=0
set shiftround
set autoindent
set smartindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrap
set hidden
set laststatus=2
set path+=**

filetype plugin indent on
syntax on

colorscheme habamax

augroup ftsettings
	autocmd!
	autocmd FileType c,cpp
		\ setlocal cindent |
		\ autocmd BufWritePost <buffer> silent !ctags -R
	autocmd FileType go setlocal formatexpr= formatprg=gofmt
	autocmd FileType help,netrw setlocal number relativenumber
	autocmd FileType nix setlocal expandtab tabstop=2 formatexpr= formatprg=nixfmt\ -
augroup END
