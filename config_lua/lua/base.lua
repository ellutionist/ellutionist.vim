vim.o.number = true
vim.o.relativenumber = true

vim.cmd("syntax on")

vim.o.ts = 2
vim.o.autoindent = true
vim.o.mouse = false

vim.cmd("set cursorline")
vim.cmd("au VimEnter * hi clear CursorLine")
vim.cmd("autocmd VimEnter * hi CursorLine gui=underline cterm=underline")
vim.cmd("autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2")
vim.cmd("autocmd FileType c,cpp setlocal foldmethod=syntax")

vim.cmd("filetype plugin indent on")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("autocmd FileType make setlocal noexpandtab")

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

