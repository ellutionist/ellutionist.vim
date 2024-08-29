local common = require "lsp.common"


require("lspconfig").gopls.setup { on_attach = common.on_attach,
    settings = {
        gopls = {
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true
            },
        },
    },
}
