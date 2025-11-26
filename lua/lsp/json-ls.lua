local common = require "lsp.common"

vim.lsp.config("jsonls", {
    on_attach = common.on_attach,
    flags = common.flags,
}
)
vim.lsp.enable("jsonls")
