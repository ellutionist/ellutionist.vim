return function()
    require("gitsigns").setup {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            local keymap_grp = require "mykeymaps.group"

            keymap_grp.new("GitSigns", "g")
                :add_entry("NextHunk", "n", "Go to the next hunk", gs.next_hunk)
                :add_entry("PrevHunk", "p", "Go to the previous hunk", gs.prev_hunk)
                :add_entry("StageHunk", "a", "Stage the current hunk", gs.stage_hunk, { "-" })
                :add_entry("UndoStageHunk", "u", "Undo stage the current hunk", gs.undo_stage_hunk)
                :add_entry("PreviewHunk", "P", "Preview the current hunk", gs.preview_hunk)
                :add_entry("ResetHunk", "r", "Reset the current hunk", gs.reset_hunk)
                :add_entry("ToggleDeleted", "d", "Toggle deleted", gs.toggle_deleted)
                :add_entry("DiffThis", "D", "Diff this", gs.diffthis)
                :add_entry("StageBuffer", "A", "Stage buffer", gs.stage_buffer)
                :add_entry("ResetBuffer", "R", "Reset buffer", gs.reset_buffer)
                :bind()
        end,
    }
end
