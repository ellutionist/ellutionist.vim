return function()
    local keymap = require "helper.keymap"
    local leader_space = keymap.leader_and_space
    local cmd = keymap.values.cmd

    leader_space("TT", cmd "Telescope")
    leader_space("Tg", cmd "Telescope live_grep")
    leader_space("Tf", cmd "Telescope find_files")
    leader_space("Td", cmd "Telescope diagnostics")

    require('telescope').setup({
        defaults = {
            layout_config = {
                vertical = { width = 0.8 }
                -- other layout configuration here
            },
            -- other defaults configuration here
        },
        -- other configuration values here
    })
end
