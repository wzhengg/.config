vim.cmd [[

set number         " line numbers
set relativenumber " relative line numbers
set tabstop=4      " tabs are 4 columns wide
set shiftwidth=0   " use tabstop for indent width
set shiftround     " round indent to multiple of shiftwidth
set smartindent    " smart auto-indent
set nowrap         " disable line wrap
set ignorecase     " case-insensitive search
set smartcase      " case-sensitive search if pattern contains uppercase
set path+=**       " search subdirectories with :find

colorscheme habamax

" remove neovim-specific mappings to match vanilla vim.
mapclear

" for such a small config, i prefer seeing everything in one place over ftplugin.
" vim is a lot more concise than lua for simple autocmds.
augroup ftsettings
	autocmd!
	autocmd FileType c,cpp,go
		\ autocmd BufWritePost <buffer> silent !ctags -R
	autocmd FileType c,cpp setlocal cindent
	autocmd FileType go setlocal formatexpr= formatprg=gofmt
	autocmd FileType help,man,netrw setlocal number relativenumber
	autocmd FileType nix setlocal expandtab tabstop=2 formatexpr= formatprg=nixfmt\ -
augroup END

]]
