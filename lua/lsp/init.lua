return function()
    require "lsp.lua-ls"
    require "lsp.bash-ls"
    require "lsp.clangd-ls"
    require "lsp.json-ls"
    require "lsp.pyright-lsp"
    require("lspconfig").gopls.setup {}
    require("lspconfig").awk_ls.setup {}
    require("lspconfig").cmake.setup {}
end
