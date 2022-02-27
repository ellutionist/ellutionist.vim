<!-- vim-markdown-toc Marked -->

* [Environment](#environment)
    * [env var](#env-var)
    * [neovim](#neovim)
    * [vim-plug](#vim-plug)
    * [init.vim](#init.vim)
* [Plugins](#plugins)
    * [NERDTree](#nerdtree)
        * [Install](#install)
        * [Usages](#usages)
    * [NERDCommenter](#nerdcommenter)
        * [Install](#install)
        * [Usages](#usages)
    * [vim-surround](#vim-surround)
        * [Install](#install)
        * [Usages](#usages)
    * [fzf](#fzf)
        * [Install](#install)
            * [fzf](#fzf)
            * [bat](#bat)
            * [ag](#ag)
    * [vim-markdown](#vim-markdown)
        * [Usages](#usages)
            * [Mappings](#mappings)
            * [Commands](#commands)
        * [Usages (fzf.vim)](#usages-(fzf.vim))
* [Language Development](#language-development)
    * [Lua](#lua)
        * [Language Server](#language-server)
        * [Lsp Config](#lsp-config)
    * [Clang](#clang)
        * [Language Server](#language-server)
        * [Lsp Config](#lsp-config)

<!-- vim-markdown-toc -->

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

### Usages
| key binding | function | description |
| -- | -- | -- | 
| \<leader\>n | NERDTreeFocus | |
| ctrl-t | NERDTreeToggle | |
| ctrl-f | NERDTreeFind | focus the location of current buffer of the tree |

## [NERDCommenter](https://github.com/preservim/nerdcommenter)

### Install
Already added to the plugin list.

### Usages

| key binding | function | description |
| -- | -- | -- | 
| \<leader\>cc | comment | |
| \<leader\>cn | nested comment | |
| \<leader\>c<space> | toggle comment | |

for other key bindings see [nerdcommenter.vim](./vimrc/nerdcommenter.vim).

## [vim-surround](https://github.com/tpope/vim-surround)

### Install

Installed by `vim-plug`.

### Usages

**c**hange **s**urround (from) "(double quote) to '(single quote)
```
cs"'
```

**y**ank **s**urround (text object, such as **i**n **w**ord, or **2** **w**ord) ]
`ysiw]`

```
ysiw]
ysiw[
ys2w(
```

**d**elete **s**urround "(double quote)
```
ds"
```

## [fzf](https://github.com/junegunn/fzf)

### Install
#### fzf
- The fzf will be install automatically by the `vim-plug`

#### [bat](https://github.com/sharkdp/bat#installation)

#### [ag](https://github.com/ggreer/the_silver_searcher#installing)

## [vim-markdown](https://github.com/preservim/vim-markdown)

### Usages

#### [Mappings](https://github.com/preservim/vim-markdown#mappings)

#### [Commands](https://github.com/preservim/vim-markdown#commands)

### Usages (fzf.vim)
| Command           | List                                                                                  |
|-------------------|---------------------------------------------------------------------------------------|
| `:Files [PATH]`   | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                                        |
| `:GFiles [OPTS]`  | Git files (`git ls-files`)                                                            |
| `:GFiles?`        | Git files (`git status`)                                                              |
| `:Buffers`        | Open buffers                                                                          |
| `:Colors`         | Color schemes                                                                         |
| `:Ag [PATTERN]`   | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:Rg [PATTERN]`   | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all)               |
| `:Lines [QUERY]`  | Lines in loaded buffers                                                               |
| `:BLines [QUERY]` | Lines in the current buffer                                                           |
| `:Tags [QUERY]`   | Tags in the project (`ctags -R`)                                                      |
| `:BTags [QUERY]`  | Tags in the current buffer                                                            |
| `:Marks`          | Marks                                                                                 |
| `:Windows`        | Windows                                                                               |
| `:Locate PATTERN` | `locate` command output                                                               |
| `:History`        | `v:oldfiles` and open buffers                                                         |
| `:History:`       | Command history                                                                       |
| `:History/`       | Search history                                                                        |
| `:Snippets`       | Snippets ([UltiSnips][us])                                                            |
| `:Commits`        | Git commits (requires [fugitive.vim][f])                                              |
| `:BCommits`       | Git commits for the current buffer; visual-select lines to track changes in the range |
| `:Commands`       | Commands                                                                              |
| `:Maps`           | Normal mode mappings                                                                  |
| `:Helptags`       | Help tags <sup id="a1">[1](#helptags)</sup>                                           |
| `:Filetypes`      | File types                                                                            |
| `ctrl-t`          | go to location in a new tab                                                           |
| `ctrl-v`          | go to location in a vertical split                                                    |
| `ctrl-`           | go to location in a horizontal split                                                  |

# Language Development

## Lua

### [Language Server](https://github.com/sumneko/lua-language-server)

- Download from [release](https://github.com/sumneko/lua-language-server/releases)
- You cannot simply create an symbolic link the the binary 'lua-langua-server', instead, make a shell script like this in the `bin` folder:

```shell
#!/bin/bash
$(dirname $(realpath $0))/lua-language-server
```

### Lsp Config

See [lspconfig-sumneko.lua](./vimrc/lspconfig-sumneko.lua)

## Clang

### [Language Server](https://clangd.llvm.org/installation.html)
```shell
# find clangd somewhere

which clangd

find / -name clangd

sudo ln -s /usr/lib/llvm-10/bin/clangd /usr/bin/clangd
```

### Lsp Config

See [lspconfig-clangd.lua](./vimrc/lspconfig-clangd.lua)

