return function()
    local null_ls = require "null-ls"

    local leader_space = require("helper.keymap").leader_and_space

    local on_attach = function(client, bufnr)
        -- vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)
        leader_space("F", function()
            vim.lsp.buf.format { async = true }
        end)
    end

    null_ls.setup {
        on_attach = on_attach,
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
            null_ls.builtins.completion.spell,
            null_ls.builtins.formatting.shfmt,
        },
    }
end
