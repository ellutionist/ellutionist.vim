return function()
    require("symbols-outline").setup {
        show_numbers = true,
        show_relative_numbers = true,
        autofold_depth = 1,
        keymaps = {
            close = { "<Esc>", "q" },
            goto_location = "O",
            focus_location = "<cr>",
            hover_symbol = "h",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
            fold = "c",
            unfold = "o",
            fold_all = "R",
            unfold_all = "M",
            fold_reset = "rs",
        },

    }

    require "mykeymaps.group".new_or_get("Symbols", "S")
        :add_entry("Toggle", "S", "Toggle symbols outline", "SymbolsOutline")
        :add_entry("Open", "o", "Open symbols outline", "SymbolsOutlineOpen")
        :add_entry("Close", "c", "Close symbols outline", "SymbolsOutlineClose")
        :bind()
end
