return {
    {
        "hrsh7th/nvim-cmp",
        config = require "plugins.lsp.complete",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        event = "InsertEnter",
    },
    {
        "neovim/nvim-lspconfig",
        config = require "plugins.lsp.config",
        dependencies = {
            "williamboman/mason.nvim",
        },
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        lazy = false,
    },
    {
        "nvimtools/none-ls.nvim",
        config = require "plugins.lsp.null-ls-init",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
    },
    {
        "saecki/crates.nvim",
        dependencies = { "nvimtools/none-ls.nvim" },
        config = require "plugins.lsp.crates-nvim",
        event = { "BufRead Cargo.toml" },
    },
    {
        "elentok/format-on-save.nvim",
        config = require "plugins.lsp.fmt-on-save-init",
        event = "VeryLazy",
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {}
        end,
        cmd = { "Trouble" },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },
            { "<leader>l",  desc = "LSP" },
        },
    },
    {
        "chrisgrieser/nvim-lsp-endhints",
        config = function()
            require("lsp-endhints").setup({
                label = {
                    truncateAtChars = 99,
                    padding = 1,
                    marginLeft = 0,
                    sameKindSeparator = ", ",
                },
            })
        end,
        event = "LspAttach",
    },
    {
        "aznhe21/actions-preview.nvim",
        config = require "plugins.lsp.actions-preview",
        event = "VeryLazy",
    },
    {
        "astral-sh/ruff-lsp",
        lazy = false,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        init = function()
            require "plugins.lsp.rust"
        end,
        lazy = false,
    },
    {
        "tamago324/nlsp-settings.nvim",
        lazy = false,
    },
    {
        "ray-x/go.nvim",
        config = function()
            require("go").setup()
        end,
        ft = { "go", "gomod" },
    },
}
