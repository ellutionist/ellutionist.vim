return function()
    local common = require "lsp.common"
    require "lsp.lua-ls"
    require "lsp.bash-ls"
    require "lsp.clangd-ls"
    require "lsp.json-ls"
    require "lsp.pyright-lsp"
    require("lspconfig").gopls.setup { on_attach = common.on_attach }
    require("lspconfig").awk_ls.setup { on_attach = common.on_attach }
    require("lspconfig").cmake.setup { on_attach = common.on_attach }
    require 'lspconfig'.rust_analyzer.setup {
        settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    enable = false,
                }
            }
        }
    }
end
