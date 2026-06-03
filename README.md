# nvim

Neovim config powered by [lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

```
init.lua              entry point, lazy.nvim bootstrap
lua/
├── base.lua          core editor settings
├── core/
│   ├── utils.lua     type-checking helpers
│   ├── colors/       colorscheme management, keymaps
│   └── keymaps/      declarative keymap system (which-key)
└── plugins/
    ├── colorschemes.lua
    ├── treesitter.lua
    ├── telescope.lua
    ├── test.lua
    ├── lsp/           LSP, completion, formatting, linting
    ├── dap/           debug adapter protocol
    ├── ui/            statusline, bufferline, file tree, dashboard
    ├── git/           fugitive, gitsigns, diffview
    └── editor/        commenting, jump, terminal, copilot
```

## Keymaps

`<leader>` and `<space>` are both usable prefixes.

| Prefix | Group |
|--------|-------|
| `<leader>l` | Language Server (diagnostics, hover, format, rename, code actions) |
| `<leader>d` | Debug (breakpoints, step, continue, run from config) |
| `<leader>T` | Telescope (find files, live grep, diagnostics, git) |
| `<leader>t` | File Explorer (nvim-tree) |
| `<leader>b` | Buffers (barbar) |
| `<leader>g` | Git Signs (hunk navigation) |
| `<leader>f` | Terminal (floaterm) |
| `<leader>e` | Test (vim-test) |
| `<leader>c` | Color (toggle bg, random colorscheme) |
| `<leader>L` | Lazy (plugin manager) |
| `<leader>??` | Show all keymap groups |

## LSP

Mason manages LSP installations. Supported servers: `lua_ls`, `clangd`, `pyright`, `gopls`, `jsonls`, `bashls`, `rust_analyzer` (via rustaceanvim), `dartls`, `taplo`, `marksman`, `ruff`, `cmake`, `awk_ls`.

LSP progress appears in a bottom-right popup during indexing.

## DAP

Debug adapters: **codelldb** (C/C++/Rust), **debugpy** (Python), **delve** (Go).

Project-level debug configs via `./dap-settings.json`:
```json
{
  "debug binary": {
    "type": "codelldb",
    "request": "launch",
    "program": "${workspaceFolder}/target/debug/mybin"
  }
}
```

## Project Config

### `./ra-config.json`
```json
{
  "features": ["my-feature"],
  "format_on_save": false,
  "disable_clippy": true
}
```

### Environment
- `NVIM_COLOR` — colorscheme override (default: `gruvbox`)
- `NVIM_TREE_SHOW_ICONS` — set to `"true"` to show file tree icons
