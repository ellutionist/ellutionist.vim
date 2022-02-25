require('lspfuzzy').setup {
    jump_one = false,
    fzf_action = {               -- FZF actions
        ['ctrl-t'] = 'tab split',  -- go to location in a new tab
        ['ctrl-s'] = 'vsplit',     -- go to location in a vertical split
        ['ctrl-i'] = 'split',      -- go to location in a horizontal split
    }
}

--[[

    tab : select multiple entries
    shift+tab : deselect an entry
    ctrl-a : select all entries
    ctrl-d : deselect all entries
    ctrl-t : go to location in a new tab
    ctrl-v : go to location in a vertical split
    ctrl-x : go to location in a horizontal split

    shift+up: scroll preview up
    shift+down: scroll preview down
]]
