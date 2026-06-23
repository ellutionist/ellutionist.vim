return function()
    -- https://github.com/stevearc/aerial.nvim

    require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            require "core.keymaps.group".new_or_get(
                "Symbols", "s"
            )
                :add_entry("Toggle", "t", "Aerial Toggle", "AerialToggle! right")
                :add_entry("Toggle", "f", "Aerial Toggle Float", "AerialToggle float")
                :add_entry("Toggle", "n", "Aerial Next Symbol", "AerialNext")
                :add_entry("Toggle", "p", "Aerial Previous Symbol", "AerialPrev")
                :bind()
        end,
    })
end
