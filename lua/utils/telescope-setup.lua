return function()
    local lga_actions = require("telescope-live-grep-args.actions")
    require('telescope').setup({
        defaults = {
            -- layout_config = {
            --     vertical = { width = 0.99 },
            --     horizontal = { width = 0.99 }
            -- },

            layout_strategy = 'center',
            layout_config = {
                anchor = "S",
                -- preview_cutoff = 100,
                width = 0.95,
                -- height = 0.95,
                -- mirror = true,
            },
            dynamic_preview_title = true,
        },
        pickers = {
            lsp_references = {
                -- theme = "ivy",
                layout_strategy = 'center',
                layout_config = {
                    anchor = "S",
                    -- preview_cutoff = 100,
                    width = 0.95,
                    -- height = 0.95,
                    -- mirror = true,
                },
                include_declaration = false,
                fname_width = 90,
                show_line = true,
                path_display = {
                    shorten = {
                        len = 1,
                        exclude = { 1, -3, -2, -1 },
                    }
                },
            },
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
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
        :add_entry("LiveGrep", "g", "Live Grep", require("telescope").extensions.live_grep_args.live_grep_args)
        :add_entry("GrepString", "s", "Grep String", "Telescope grep_string")
        :add_entry("FindFiles", "f", "Find Files", "Telescope find_files")
        :add_entry("Diagnostics", "d", "Diagnostics", "Telescope diagnostics")
        :add_entry("Colorscheme", "c", "Colorscheme", "Telescope colorscheme")
        :add_entry("Oldfiles", "o", "Old Files", "Telescope oldfiles")
        :add_entry("QuickFix", "q", "Quick Fix", "Telescope quickfix")
        :add_entry("Registers", "r", "Registers", "Telescope registers")
    -- git
        :add_entry("BufferCommits", "gC", "Buffer Git Commits", "Telescope git_bcommits")
        :add_entry("Commits", "gc", "Git Commits", "Telescope git_commits")
        :add_entry("Branches", "gb", "Git Branches", "Telescope git_branches")
        :bind()
end
