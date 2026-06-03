return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = require "utils.lualine-setup",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },
  {
    "romgrk/barbar.nvim",
    config = require "utils.bufferline-setup",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = require "utils.nvimtree-setup",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require "utils.dashboard-setup",
    lazy = false,
  },
  {
    "RRethy/vim-illuminate",
    config = require "utils.illuminate-setup",
    event = "VeryLazy",
  },
}
