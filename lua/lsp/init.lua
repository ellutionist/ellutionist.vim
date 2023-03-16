return function()
    require "lsp.lua-ls" ()
    require "lsp.bash-ls" ()
    require "lsp.clangd-ls" ()
    require "lsp.json-ls" ()
    require 'lspconfig'.pyright.setup {}
end
