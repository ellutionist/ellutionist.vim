return {
  {
    "preservim/nerdcommenter",
    config = require "utils.nerdcommenter-setup",
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    config = require "utils.flash-setup",
    event = "VeryLazy",
  },
  {
    "voldikss/vim-floaterm",
    config = require "utils.floaterm-setup",
    keys = {
      { "<leader>f", desc = "Terminal" },
    },
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
}
