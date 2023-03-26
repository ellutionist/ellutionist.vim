local common = require "lsp.common"
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = "utf8"


require("lspconfig").clangd.setup {
    on_attach = common.on_attach,
    flags = common.flags,

    capabilities = capabilities,
    cmd = {
        "clangd",
        "--query-driver=/usr/bin/g++",
        "--fallback-style=Google",
        "--clang-tidy",
        "--compile-commands-dir=build",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--header-insertion=iwyu",
    },
}
