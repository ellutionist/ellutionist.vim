return function()
    local crates = require "crates"
    crates.setup {
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },

        on_attach = function(bufnr)
            print "crates.nvim: on_attach"
            local keymap_grp = require "mykeymaps.group"
            local grp = keymap_grp.new_or_get("LanguageServer", "l")
                :add_entry("Popup", "P", "Show Popup",
                    function()
                        crates.show_popup()
                    end)
            grp:bind()
        end,
    }
end
