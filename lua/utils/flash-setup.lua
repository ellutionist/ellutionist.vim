return function()
    local flash = require "flash"
    local function jump()
        flash.jump()
    end
    local function diagnostic()
        flash.jump({
            action = function(match, state)
                vim.api.nvim_win_call(match.win, function()
                    vim.api.nvim_win_set_cursor(match.win, match.pos)
                    vim.diagnostic.open_float()
                end)
                state:restore()
            end,
        })
    end
    local function match_under_cursor()
        flash.jump({
            pattern = vim.fn.expand("<cword>"),
        })
    end

    local function jump_to_line()
        flash.jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^"
        })
    end

    local function continue()
        flash.jump({ continue = true })
    end

    local function format(opts)
        return {
            { opts.match.label1, "FlashMatch" },
            { opts.match.label2, "FlashLabel" },
        }
    end

    local function two_chars_jump()
        flash.jump({
            search = { mode = "search" },
            label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
            pattern = [[\<]],
            action = function(match, state)
                state:hide()
                flash.jump({
                    search = { max_length = 0 },
                    highlight = { matches = false },
                    label = { format = format },
                    matcher = function(win)
                        -- limit matches to the current label
                        return vim.tbl_filter(function(m)
                            return m.label == match.label and m.win == win
                        end, state.results)
                    end,
                    labeler = function(matches)
                        for _, m in ipairs(matches) do
                            m.label = m.label2 -- use the second label
                        end
                    end,
                })
            end,
            labeler = function(matches, state)
                local labels = state:labels()
                for m, match in ipairs(matches) do
                    match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                    match.label2 = labels[(m - 1) % #labels + 1]
                    match.label = match.label1
                end
            end,
        })
    end


    require "mykeymaps.group".new_or_get(
        "Jump", "j"
    )
        :add_entry("Jump", "/", "Jump", jump, { "j" })
        :add_entry("Diagnostic", "d", "Diagnostic", diagnostic)
        :add_entry("Match", "*", "Match", match_under_cursor)
        :add_entry("Line", "l", "Line", jump_to_line)
        :add_entry("Continue", "c", "Continue", continue)
        :add_entry("TwoCharsJump", "2", "TwoCharsJump", two_chars_jump)
        :bind()
end
