vim.opt.number         = true  -- line numbers
vim.opt.relativenumber = true  -- relative line numbers
vim.opt.tabstop        = 4     -- tabs are 4 columns wide
vim.opt.shiftwidth     = 0     -- use tabstop for indent width
vim.opt.shiftround     = true  -- round indent to multiple of shiftwidth
vim.opt.smartindent    = true  -- smart auto-indent
vim.opt.wrap           = false -- disable line wrap
vim.opt.ignorecase     = true  -- case-insensitive search
vim.opt.smartcase      = true  -- case-sensitive search if pattern contains uppercase

-- search subdirectories with :find
vim.opt.path:append({ "**" })

vim.cmd.colorscheme("habamax")

-- for such a small config, i prefer seeing everything in one place instead of using ftplugin.
-- vim commands are a lot more concise than lua for simple autocmds.
vim.cmd [[
	augroup ftsettings
		autocmd!
		autocmd FileType c,cpp
			\ setlocal cindent |
			\ autocmd BufWritePost <buffer> silent !ctags -R
		autocmd FileType go setlocal formatexpr= formatprg=gofmt
		autocmd FileType help,netrw setlocal number relativenumber
		autocmd FileType nix setlocal expandtab tabstop=2 formatexpr= formatprg=nixfmt\ -
	augroup END
]]
