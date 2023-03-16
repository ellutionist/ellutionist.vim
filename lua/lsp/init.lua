return function()
    require "lsp.lua-ls"
    require "lsp.bash-ls"
    require "lsp.clangd-ls"
    require "lsp.json-ls"
    require "lsp.pyright-lsp"
    require("lspconfig").gopls.setup {}
end
