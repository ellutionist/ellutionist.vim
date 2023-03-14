-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

require'nvim-tree.view'.View.winopts.relativenumber = true

local keymap = require "helper.keymap"
local Normal = keymap.Normal
local leader = keymap.keys.leader
local cmd = keymap.values.cmd

Normal(leader "to", cmd "NvimTreeOpen")
Normal(leader "tc", cmd "NvimTreeClose")
Normal(leader "tn", cmd "NvimTreeFocus")
Normal(leader "tF", cmd "NvimTreeFocus")
Normal(leader "tf", cmd "NvimTreeFindFile")

