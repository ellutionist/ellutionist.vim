call plug#begin()

Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'neovim/nvim-lspconfig'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'

Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'

Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

call plug#end()
