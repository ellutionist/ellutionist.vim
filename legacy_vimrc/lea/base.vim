set number
set relativenumber
syntax on
set ts=2
set autoindent

set cursorline
au VimEnter * hi clear CursorLine
au VimEnter * hi CursorLine gui=underline cterm=underline

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
autocmd FileType make setlocal noexpandtab

noremap <silent><tab>t :tabnew<cr>
noremap <silent><tab>c :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>l :tabn<cr>
noremap <silent><tab>h :tabp<cr>
" noremap <silent><leader>t :tabnew<cr>
" noremap <silent><leader>c :tabclose<cr>
noremap <silent><tab>1 :tabn 1<cr>
noremap <silent><tab>2 :tabn 2<cr>
noremap <silent><tab>3 :tabn 3<cr>
noremap <silent><tab>4 :tabn 4<cr>
noremap <silent><tab>5 :tabn 5<cr>
noremap <silent><tab>6 :tabn 6<cr>
noremap <silent><tab>7 :tabn 7<cr>
noremap <silent><tab>8 :tabn 8<cr>
noremap <silent><tab>9 :tabn 9<cr>
noremap <silent><s-tab> :tabnext<CR>
