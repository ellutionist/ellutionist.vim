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

    local keymap = require "helper.keymap"
    local leader_space = keymap.leader_and_space
    local cmd = keymap.values.cmd

    leader_space("SS", cmd "SymbolsOutline")
    leader_space("So", cmd "SymbolsOutlineOpen")
    leader_space("Sc", cmd "SymbolsOutlineClose")
end
