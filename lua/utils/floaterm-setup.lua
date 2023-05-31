return function()
    -- require("toggleterm").setup {}

    vim.g.floaterm_height = 0.8
    vim.g.floaterm_autoinsert = false
    require "mykeymaps.group".new_or_get(
        "Terminal", "t"
    )
        :add_entry("New", "o", "New terminal", "FloatermNew")
        :add_entry("Toggle", "t", "Toggle terminal", "FloatermToggle")
        :add_entry("Close", "c", "Close terminal", "FloatermKill")
        :add_entry("Hide", "h", "Hide terminal", "FloatermHide")
        :add_entry("Show", "s", "Show terminal", "FloatermShow")
        :add_entry("Next", "n", "Next terminal", "FloatermNext")
        :add_entry("Prev", "p", "Previous terminal", "FloatermPrev")
        :bind()
end
