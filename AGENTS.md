# AGENTS.md

This is the user's Neovim configuration managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Architecture

- **Plugin manager:** lazy.nvim, bootstrap in `init.lua`
- **Config language:** Lua
- **Plugin specs:** `lua/plugins/` — each `.lua` file or subdirectory with `init.lua` returns a lazy.nvim spec table
- **Core modules:** `lua/core/` (keymaps, colors, utils)
- **Keymap system:** Custom declarative system in `lua/core/keymaps/` wrapping which-key.nvim

## Conventions

- Use 2-space indentation in Lua files
- Plugin specs are lazy by default; use `lazy = false` only when needed (colorschemes, treesitter, mason, nvim-tree, alpha, nvim-nio, rustaceanvim, ruff-lsp, nlsp-settings)
- Config functions placed in the same directory as their spec (e.g., `lua/plugins/ui/dashboard.lua` for alpha-nvim)
- Single-plugin groups are flat `.lua` files; multi-file groups are directories with `init.lua`
- Keymaps use `<leader>` and `<space>` dual-binding via `core/keymaps/group.lua`
- Dependencies: `williamboman/mason.nvim` must load before `neovim/nvim-lspconfig`
- `mrcjkb/rustaceanvim` uses `init` hook (not `config`) to set `vim.g.rustaceanvim` before plugin loads

## Key files

| File | Purpose |
|---|---|
| `init.lua` | Entry point, lazy.nvim bootstrap, VeryLazy callback |
| `lua/base.lua` | Core editor options (numbers, tabs, folds, encoding) |
| `lua/core/keymaps/group.lua` | `KeyMapGroup` class with which-key integration |
| `lua/plugins/lsp/common.lua` | Shared LSP on_attach, progress popup, diagnostics keymaps |
| `lua/plugins/lsp/config.lua` | LSP entry — enables all servers |
| `lua/plugins/lsp/init.lua` | LSP plugin specs (nvim-cmp, lspconfig, mason, etc.) |
| `lua/plugins/dap/config.lua` | DAP entry — loads all debug adapters |
| `lazy-lock.json` | Pinned plugin versions |

## Env vars

- `NVIM_COLOR` — override colorscheme (default: `gruvbox`)
- `NVIM_TREE_SHOW_ICONS` — set to `"true"` for file tree icons

## Project config files

- `./ra-config.json` — rust-analyzer features, clippy, format-on-save
- `./dap-settings.json` — DAP launch configurations
