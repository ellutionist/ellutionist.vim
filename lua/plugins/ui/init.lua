return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = require "plugins.ui.lualine",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },
  {
    "romgrk/barbar.nvim",
    config = require "plugins.ui.bufferline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = require "plugins.ui.nvimtree",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require "plugins.ui.dashboard",
    lazy = false,
  },
  {
    "RRethy/vim-illuminate",
    config = require "plugins.ui.illuminate",
    event = "VeryLazy",
  },
}
