local common = require "lsp.common"
require("lspconfig").pyright.setup {
    on_attach = common.on_attach,
    flags = common.flags,
}
-- require("lspconfig").pylyzer.setup {
--     on_attach = common.on_attach,
--     flags = common.flags,
--     settings = {
--         python = {
--             inlayHints = true
--         }
--     }
--
-- }
