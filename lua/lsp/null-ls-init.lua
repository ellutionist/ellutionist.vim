return function()
    local null_ls = require "null-ls"

    local common = require "lsp.common"

    null_ls.setup {
        on_attach = common.on_attach,
        sources = {
            null_ls.builtins.formatting.autopep8,
            -- null_ls.builtins.formatting.stylua.with {
            -- extra_args = {
            --     "--call-parentheses",
            --     "None",
            --     "--quote-style",
            --     "AutoPreferDouble",
            --     "--column-width",
            --     "85",
            -- },
            -- },
            -- null_ls.builtins.diagnostics.eslint,
            -- null_ls.builtins.completion.spell,
            null_ls.builtins.formatting.shfmt,
        },
    }
end
