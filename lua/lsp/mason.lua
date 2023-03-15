require "mason".setup()
require "mason-lspconfig".setup {
    ensure_installed = { "bashls", "lua_ls", "clangd", "jsonls" },
}

