local common = require "lsp.common"

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- capabilities.textDocument.formatting = false
-- capabilities.textDocument.rangeFormatting = false
-- capabilities.textDocument.range_formatting = false

local function setup_neodev()
    require("neodev").setup({})
end

pcall(setup_neodev)

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
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim", "require" },
            },
            -- workspace = {
            --     -- Make the server aware of Neovim runtime files
            --     library = vim.api.nvim_get_runtime_file("", true),
            -- },
            -- Do not send telemetry data containing a randomized but unique identifier
            -- telemetry = {
            --     enable = false,
            -- },
        },
    },
}
