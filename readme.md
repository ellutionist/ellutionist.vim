# Environment

## env var
add this to your `~/.bashrc` or `~/.zshrc`
```
source ${path-to-env.sh}
```

## neovim
- Install [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Try to use appimage instead of tar package.

## vim-plug
- Install [vim-plug](https://github.com/junegunn/vim-plug#neovim)

## init.vim
```shell
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
```

```vim
" ~/.config/nvim/init.vim

call plug#begin()

call plug#end()
```

# Plugins

## [NERDTree](https://github.com/preservim/nerdtree)

### Install
Already added to the plugin list.

### Usage
| key binding | function | description |
| -- | -- | -- | 
| \<leader\>n | NERDTreeFocus | |
| ctrl-t | NERDTreeToggle | |
| ctrl-f | NERDTreeFind | focus the location of current buffer of the tree |

## [NERDCommenter](https://github.com/preservim/nerdcommenter)

### Install
Already added to the plugin list.

| key binding | function | description |
| -- | -- | -- | 
| \<leader\>cc | comment | |
| \<leader\>cn | nested comment | |
| \<leader\>c<space> | toggle comment | |

for other key bindings see [nerdcommenter.vim](./vimrc/nerdcommenter.vim).

# Language Development

## Clang
