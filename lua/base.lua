vim.lsp.set_log_level("error")
vim.o.number = true
vim.o.relativenumber = true

vim.cmd("syntax on")

vim.o.ts = 2
vim.o.autoindent = true
vim.o.mouse = ""

vim.cmd "set cursorline"
vim.cmd "hi cursorline cterm=none term=none"
vim.cmd "autocmd WinEnter * setlocal cursorline"
vim.cmd "highlight CursorLine guibg=#303000 ctermbg=234"

-- vim.cmd("autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2")
-- vim.cmd("autocmd FileType c,cpp setlocal foldmethod=syntax")
-- vim.cmd("autocmd FileType c,cpp norm zR")
vim.cmd "set foldmethod=expr"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
vim.cmd "autocmd FileType lua,c,cpp norm zR"

vim.cmd("filetype plugin indent on")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("autocmd FileType make setlocal noexpandtab")
vim.cmd "tnoremap <Esc> <C-\\><C-n>"
vim.cmd "tnoremap <C-[> <C-\\><C-n>"

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
