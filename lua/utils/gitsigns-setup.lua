return function()
    -- Parse git diff output and extract changed locations
    local function parse_git_diff()
        local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error ~= 0 then
            vim.notify("Not a git repository", vim.log.levels.ERROR)
            return {}
        end

        local diff_output = vim.fn.systemlist("git diff")
        if vim.v.shell_error ~= 0 then
            vim.notify("Failed to run git diff", vim.log.levels.ERROR)
            return {}
        end

        local changes = {}
        local current_file = nil
        local current_line = nil
        local in_hunk = false

        for _, line in ipairs(diff_output) do
            -- Match file path: diff --git a/file b/file
            local file_match = line:match("^diff %-%-git a/(.-) b/")
            if file_match then
                current_file = root .. "/" .. file_match
                in_hunk = false
            end

            -- Match hunk header: @@ -old_line,old_count +new_line,new_count @@
            local new_line = line:match("^@@ %-%d+,?%d* %+(%d+),?%d* @@")
            if new_line and current_file then
                current_line = tonumber(new_line)
                in_hunk = true
            elseif in_hunk and current_file and current_line then
                -- Process lines within the hunk
                if line:match("^%+") and not line:match("^%+%+%+") then
                    -- This is an added line (starts with +, but not +++)
                    table.insert(changes, {
                        file = current_file,
                        line = current_line,
                        col = 1,
                    })
                    current_line = current_line + 1
                elseif line:match("^%-") and not line:match("^%-%-%-") then
                    -- This is a deleted line (starts with -, but not ---)
                    -- Don't increment current_line for deleted lines
                    -- Add the location where the deletion occurred
                    table.insert(changes, {
                        file = current_file,
                        line = current_line,
                        col = 1,
                    })
                elseif line:match("^ ") then
                    -- Context line (starts with space)
                    current_line = current_line + 1
                elseif line:match("^\\") then
                    -- "\ No newline at end of file" - ignore
                elseif not line:match("^diff") and not line:match("^index") and not line:match("^%-%-%-") and not line:match("^%+%+%+") then
                    -- Unknown line type in hunk context - might be end of hunk
                    in_hunk = false
                end
            end
        end

        return changes
    end

    -- Jump to the next changed location project-wide
    local function jump_next_change()
        local changes = parse_git_diff()

        if #changes == 0 then
            vim.notify("No changes found in git diff", vim.log.levels.INFO)
            return
        end

        -- Get current position
        local current_file = vim.fn.expand("%:p")
        local current_line = vim.fn.line(".")

        -- Find next change after current position
        local next_index = nil
        for i = 1, #changes do
            local change = changes[i]
            if change.file > current_file or (change.file == current_file and change.line > current_line) then
                next_index = i
                break
            end
        end

        -- If no next change found, wrap to beginning
        if not next_index then
            next_index = 1
            vim.notify("Wrapped to first change", vim.log.levels.INFO)
        end

        local change = changes[next_index]

        -- Jump to the location
        vim.cmd("edit " .. vim.fn.fnameescape(change.file))
        vim.fn.cursor(change.line, change.col)
        vim.cmd("normal! ^zz") -- Move to first non-blank char and center the cursor
    end

    -- Jump to the previous changed location project-wide
    local function jump_prev_change()
        local changes = parse_git_diff()

        if #changes == 0 then
            vim.notify("No changes found in git diff", vim.log.levels.INFO)
            return
        end

        -- Get current position
        local current_file = vim.fn.expand("%:p")
        local current_line = vim.fn.line(".")

        -- Find previous change before current position
        local prev_index = nil
        for i = #changes, 1, -1 do
            local change = changes[i]
            if change.file < current_file or (change.file == current_file and change.line < current_line) then
                prev_index = i
                break
            end
        end

        -- If no previous change found, wrap to end
        if not prev_index then
            prev_index = #changes
            vim.notify("Wrapped to last change", vim.log.levels.INFO)
        end

        local change = changes[prev_index]

        -- Jump to the location
        vim.cmd("edit " .. vim.fn.fnameescape(change.file))
        vim.fn.cursor(change.line, change.col)
        vim.cmd("normal! ^zz") -- Move to first non-blank char and center the cursor
    end

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
                :add_entry("NextChangeProjectWide", "N", "Jump to next change (project-wide)", jump_next_change)
                :add_entry("PrevChangeProjectWide", "P", "Jump to prev change (project-wide)", jump_prev_change)
                :bind()
        end,
    }
end
