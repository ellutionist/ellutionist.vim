local common = require "lsp.common"

vim.lsp.config("pyright", {
    on_attach = common.on_attach,
    flags = common.flags,
})
vim.lsp.enable("pyright")
