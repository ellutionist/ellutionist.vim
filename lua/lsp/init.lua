return function()
    local common = require "lsp.common"
    require "lsp.lua-ls"
    require "lsp.clangd-ls"
    require "lsp.json-ls"
    require "lsp.pyright-lsp"
    require "lsp.rust"
    require "lsp.gopls-init"

    local servers = {
        "luau_lsp",
        -- "gopls",
        "awk_ls",
        "cmake",
        "marksman",
        -- "tsserver",
        -- "rust_analyzer",
        "ruff",
        "taplo",
        "bashls",
        "dartls",
    }

    for _, server in ipairs(servers) do
        vim.lsp.config(server, { on_attach = common.on_attach })
        vim.lsp.enable(server)
    end
end
