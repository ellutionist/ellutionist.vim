return function()
    local crates = require "crates"
    crates.setup {
        lsp = {
            enabled = true,
            on_attach = function(client, bufnr)
                -- the same on_attach function as for your other lsp's
            end,
            actions = true,
            completion = true,
            hover = true,
        },

    }
end
