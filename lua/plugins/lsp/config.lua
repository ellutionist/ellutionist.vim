return function()
    local common = require "plugins.lsp.common"
    require "plugins.lsp.lua-ls"
    require "plugins.lsp.clangd-ls"
    require "plugins.lsp.json-ls"
    require "plugins.lsp.pyright-lsp"
    require "plugins.lsp.rust"
    require "plugins.lsp.gopls-init"

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
