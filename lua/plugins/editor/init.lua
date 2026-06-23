return {
    {
        "preservim/nerdcommenter",
        config = require "plugins.editor.nerdcommenter",
        event = "VeryLazy",
    },
    {
        "folke/flash.nvim",
        config = require "plugins.editor.flash",
        event = "VeryLazy",
    },
    {
        "voldikss/vim-floaterm",
        config = require "plugins.editor.floaterm",
        keys = {
            { "<leader>f", desc = "Terminal" },
        },
    },
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },
    {
        "stevearc/aerial.nvim",
        config = require "plugins.editor.aerial",
        -- opts = {},
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    }
}
