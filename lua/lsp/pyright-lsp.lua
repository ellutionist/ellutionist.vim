local common = require "lsp.common"
require("lspconfig").pyright.setup {
    on_attach = common.on_attach,
    flags = common.flags,
}
