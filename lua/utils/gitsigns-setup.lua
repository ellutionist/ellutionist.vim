return function()
    require("gitsigns").setup {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            local keymap = require "helper.keymap"
            local leader_and_space = keymap.leader_and_space
            leader_and_space("gn", gs.next_hunk)
            leader_and_space("gp", gs.prev_hunk)
            leader_and_space("ga", gs.stage_hunk)
            leader_and_space("g-", gs.stage_hunk)
            leader_and_space("gu", gs.undo_stage_hunk)

            leader_and_space("gp", gs.preview_hunk)
            leader_and_space("gr", gs.reset_hunk)

            leader_and_space("gd", gs.toggle_deleted)
            leader_and_space("gD", gs.diffthis)

            leader_and_space("gA", gs.stage_buffer)
            leader_and_space("gR", gs.reset_buffer)

            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
            map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
            map("n", "<leader>hS", gs.stage_buffer)
            map("n", "<leader>hu", gs.undo_stage_hunk)
            map("n", "<leader>hR", gs.reset_buffer)
            map("n", "<leader>hp", gs.preview_hunk)
            map("n", "<leader>hb", function()
                gs.blame_line { full = true }
            end)
            map("n", "<leader>tb", gs.toggle_current_line_blame)
            map("n", "<leader>hd", gs.diffthis)
            map("n", "<leader>hD", function()
                gs.diffthis "~"
            end)
            map("n", "<leader>td", gs.toggle_deleted)

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
    }
end
