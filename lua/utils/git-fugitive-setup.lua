return function()
    local keymap = require "helper.keymap"
    local leader_and_space = keymap.leader_and_space
    local cmd = keymap.values.cmd
    leader_and_space("go", cmd "Git<CR> :wincmd o")
    leader_and_space("gc", cmd "Git commit<CR> :wincmd o")
end

