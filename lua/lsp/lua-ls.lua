local common = require "lsp.common"

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- capabilities.textDocument.formatting = false
-- capabilities.textDocument.rangeFormatting = false
-- capabilities.textDocument.range_formatting = false

require("lspconfig").lua_ls.setup {
    on_attach = common.on_attach,
    flags = common.flags,

    -- cmd = { "/root/opt/lua-ls/bin/lua-language-server" },
    cmd = { "lua-language-server" },
    -- capabilities = capabilities,

    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                path = {
                    -- '?.lua',
                    -- '?/init.lua',
                    -- vim.fn.expand '~/.luarocks/share/lua/5.3/?.lua',
                    -- vim.fn.expand '~/.luarocks/share/lua/5.3/?/init.lua',
                    -- '/usr/share/5.3/?.lua',
                    '/usr/local/share/lua/5.1/?.lua',
                }

            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim", "require" },
            },
        },
    },
}
