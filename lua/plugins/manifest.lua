return {
    colors = require "colors.plugins",
    nvim = {
        -- {
        --     "folke/neodev.nvim",
        -- }
    },
    utils = {
        { "folke/which-key.nvim" },
        {
            "vim-test/vim-test",
            config = require "utils.test-setup",
        },
        {
            "nvim-tree/nvim-tree.lua",
            config = require "utils.nvimtree-setup",
            requires = {
                "nvim-tree/nvim-web-devicons",
            },
        },
        {
            "preservim/nerdcommenter",
            config = require "utils.nerdcommenter-setup",
        },
        {
            "jiangmiao/auto-pairs",
        },
        {
            "nvim-lualine/lualine.nvim",
            config = require "utils.lualine-setup",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        },
        {
            "romgrk/barbar.nvim",
            config = require "utils.bufferline-setup",
            requires = "nvim-web-devicons",
            tag = "v1.5.0"
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.4",
            -- branch = "master",
            -- or                            , branch = '0.1.x',
            config = require "utils.telescope-setup",
            requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
        },
        {
            "goolord/alpha-nvim",
            requires = { "nvim-tree/nvim-web-devicons" },
            config = require "utils.dashboard-setup",
        },
        {
            "RRethy/vim-illuminate",
            -- requires = { "nvim-tree/nvim-web-devicons" },
            config = require "utils.illuminate-setup",
        },
        {
            "github/copilot.vim",
        },
        {
            "voldikss/vim-floaterm",
            config = require "utils.floaterm-setup",
        },
        {
            "folke/flash.nvim",
            config = require "utils.flash-setup"
        },
    },
    github = {
        {
            "tpope/vim-fugitive",
            config = require "utils.git-fugitive-setup",
        },
        {
            "lewis6991/gitsigns.nvim",
            config = require "utils.gitsigns-setup",
        },
        {
            "sindrets/diffview.nvim"
        }
    },
    lsp = {
        "L3MON4D3/LuaSnip",
        {
            "hrsh7th/nvim-cmp",
            config = require "lsp.complete",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                -- "hrsh7th/cmp-buffer",
            },
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            requires = {
                "nvim-treesitter/nvim-treesitter",
            },
            config = require "utils.nvim-treesitter-setup",
        },
        {
            "simrat39/symbols-outline.nvim",
            config = require "lsp.outlines",
        },
        {
            "neovim/nvim-lspconfig",
            config = require "lsp",
            requires = {
                "simrat39/rust-tools.nvim"
            },
        },
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            commit = "a81503f0019942111fe464209237f8b4e85f4687",
            config = function()
                require("mason-lspconfig").setup {
                    -- ensure_installed = { "bashls", "lua_ls", "clangd", "jsonls" },
                }
            end,
        },
        {
            -- "jose-elias-alvarez/null-ls.nvim",
            "nvimtools/none-ls.nvim",
            config = require "lsp.null-ls-init",
            requires = { { "nvim-lua/plenary.nvim" } },
        },
        {
            "aznhe21/actions-preview.nvim",
            config = require "lsp.actions-preview",
        },
        {
            "saecki/crates.nvim",
            tag = "stable",
            requires = { "nvimtools/none-ls.nvim" },
            config = require "lsp.crates-nvim",
        },
        {
            "elentok/format-on-save.nvim",
            config = require "lsp.fmt-on-save-init",
        },
        {
            "folke/trouble.nvim"
        },
        {
            "astral-sh/ruff-lsp"
        },
    },
    debug = {
        {
            "mfussenegger/nvim-dap",
            config = require "dap_module",
        },
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require "dap_module.dap-ui-init"
            end,
            requires = {
                "mfussenegger/nvim-dap",
            },
        },
    },
    golang = {
        {
            'ray-x/go.nvim'
        }
    }
}
