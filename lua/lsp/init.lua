return function()
    local common = require "lsp.common"
    require "lsp.lua-ls"
    require "lsp.clangd-ls"
    require "lsp.json-ls"
    require "lsp.pyright-lsp"
    require "lsp.rust"

    local servers = {
        "luau_lsp",
        "gopls",
        "awk_ls",
        "cmake",
        "marksman",
        "tsserver",
        "ruff_lsp",
        "taplo",
        "bashls",
    }

    for _, server in ipairs(servers) do
        require("lspconfig")[server].setup { on_attach = common.on_attach }
    end

    -- require 'lspconfig'.luau_lsp.setup { on_attach = common.on_attach }
    -- require("lspconfig").gopls.setup { on_attach = common.on_attach }
    -- require("lspconfig").awk_ls.setup { on_attach = common.on_attach }
    -- require("lspconfig").cmake.setup { on_attach = common.on_attach }
    -- require 'lspconfig'.marksman.setup { on_attach = common.on_attach }
    -- require 'lspconfig'.tsserver.setup { on_attach = common.on_attach }
    -- require('lspconfig').ruff_lsp.setup { on_attach = common.on_attach, }
    -- require('lspconfig').taplo.setup { on_attach = common.on_attach, }
end
