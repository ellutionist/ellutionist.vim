return {
    colors = require "colors.plugins",
    utils = {
        {
            'nvim-tree/nvim-tree.lua',
            config = require "utils.nvimtree",
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        },
        {
            'preservim/nerdcommenter',
            config = require "utils.nerdcommenter",
        },
        {
            'jiangmiao/auto-pairs',
        },
        {
            'nvim-lualine/lualine.nvim',
            config = require "utils.lualine",
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        },
        {
            'romgrk/barbar.nvim',
            config = require "utils.bufferline-setup",
            requires = 'nvim-web-devicons'
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            -- branch = "master",
            -- or                            , branch = '0.1.x',
            config = require "utils.telescope",
            requires = { { 'nvim-lua/plenary.nvim' } }
        },
        {
            'goolord/alpha-nvim',
            requires = { 'nvim-tree/nvim-web-devicons' },
            config = require "utils.dashboard-setup"
        },
    },
    github = {
        'tpope/vim-fugitive',
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end
        }
    },
    lsp = {
        'L3MON4D3/LuaSnip',
        {
            "hrsh7th/nvim-cmp",
            config = require "lsp.complete"
        },

        "hrsh7th/cmp-nvim-lsp",
        "nvim-treesitter/nvim-treesitter",

        {
            "simrat39/symbols-outline.nvim",
            config = require "lsp.outlines"
        },
        {
            'neovim/nvim-lspconfig',
            config = require "lsp"
        },
        {
            "williamboman/mason.nvim",
            config = function()
                require "mason".setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            commit = "a81503f0019942111fe464209237f8b4e85f4687",
            config = function()
                require "mason-lspconfig".setup {
                    -- ensure_installed = { "bashls", "lua_ls", "clangd", "jsonls" },
                }
            end
        },
    }
}
