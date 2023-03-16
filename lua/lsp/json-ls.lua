local common = require "lsp.common"

require("lspconfig").jsonls.setup {
    on_attach = common.on_attach,
    flags = common.flags,
}
