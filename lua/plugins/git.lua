return {
  {
    "tpope/vim-fugitive",
    config = require "utils.git-fugitive-setup",
    cmd = { "Git", "G", "Gvdiffsplit", "Gdiffsplit" },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require "utils.gitsigns-setup",
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
}
