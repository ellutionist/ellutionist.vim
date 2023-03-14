local keymap = require "helper.keymap"
local Normal = keymap.Normal
local leader = keymap.keys.leader
local cmd = keymap.values.cmd

Normal(leader "TT", cmd "Telescope")
Normal(leader "Tg", cmd "Telescope live_grep")
Normal(leader "Tf", cmd "Telescope find_files")
Normal(leader "Td", cmd "Telescope diagnostics")

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

