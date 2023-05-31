return function()
    local keymap_grp = require "mykeymaps.group"

    keymap_grp.new("Telescope", "T")
        :add_entry("Telescope", "T", "Open Telescope", "Telescope")
        :add_entry("LiveGrep", "g", "Live Grep", "Telescope live_grep")
        :add_entry("FindFiles", "f", "Find Files", "Telescope find_files")
        :add_entry("Diagnostics", "d", "Diagnostics", "Telescope diagnostics")
        :add_entry("Colorscheme", "c", "Colorscheme", "Telescope colorscheme")
        :bind()

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
