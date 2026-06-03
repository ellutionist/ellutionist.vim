local common = require "plugins.lsp.common"


vim.lsp.config("gopls", {
    on_attach = common.on_attach,
    settings = {
        gopls = {
            -- ["ui.inlayhint.hints"] = {
            --     compositeLiteralFields = true,
            --     constantValues = true,
            --     parameterNames = true
            -- },
        },
    },
}
)
vim.lsp.enable("gopls")
