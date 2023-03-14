return {
    colors = require "colors.plugins",
    utils = {
        {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        },
        'preservim/nerdcommenter',
        'jiangmiao/auto-pairs',
        {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        },
    },
    github = {
        'tpope/vim-fugitive',
        'lewis6991/gitsigns.nvim',
    },
    fzf = {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            -- branch = "master",
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
    },
    lsp = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',
        "nvim-treesitter/nvim-treesitter",
        "simrat39/symbols-outline.nvim",
        'L3MON4D3/LuaSnip',
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    }
}
