return function()
    local lga_actions = require("telescope-live-grep-args.actions")
    require('telescope').setup({
        defaults = {
            layout_config = {
                vertical = { width = 0.99 },
                horizontal = { width = 0.99 }
                -- other layout configuration here
            },
            -- other defaults configuration here
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = {         -- extend mappings
                    i = {
                        ["<C-k>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    },
                },
                -- ... also accepts theme settings, for example:
                -- theme = "dropdown", -- use dropdown theme
                -- theme = { }, -- use own theme spec
                -- layout_config = { mirror=true }, -- mirror preview pane
            }
        }
        -- other configuration values here
    })

    local keymap_grp = require "mykeymaps.group"

    keymap_grp.new("Telescope", "T")
        :add_entry("Telescope", "T", "Open Telescope", "Telescope")
    -- :add_entry("LiveGrep", "g", "Live Grep", "Telescope live_grep")
        :add_entry("LiveGrep", "g", "Live Grep", require("telescope").extensions.live_grep_args.live_grep_args)
        :add_entry("FindFiles", "f", "Find Files", "Telescope find_files")
        :add_entry("Diagnostics", "d", "Diagnostics", "Telescope diagnostics")
        :add_entry("Colorscheme", "c", "Colorscheme", "Telescope colorscheme")
        :bind()
end
