-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local WIDTH_RATIO = 0.5
local HEIGHT_RATIO = 0.8

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 40,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2)
                    - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        }
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    git = {
        ignore = false,
    }
})

require 'nvim-tree.view'.View.winopts.relativenumber = true

local keymap = require "helper.keymap"
local Normal = keymap.Normal
local leader = keymap.keys.leader
local cmd = keymap.values.cmd

Normal(leader "to", cmd "NvimTreeOpen")
Normal(leader "tc", cmd "NvimTreeClose")
Normal(leader "tn", cmd "NvimTreeFocus")
Normal(leader "tF", cmd "NvimTreeFocus")
Normal(leader "tf", cmd "NvimTreeFindFileToggle")
