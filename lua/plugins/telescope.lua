return {
  {
    "nvim-telescope/telescope.nvim",
    config = require "utils.telescope-setup",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>T", desc = "Telescope" },
    },
  },
}
