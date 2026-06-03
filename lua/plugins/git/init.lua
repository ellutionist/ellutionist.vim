return {
  {
    "tpope/vim-fugitive",
    config = require "plugins.git.fugitive",
    cmd = { "Git", "G", "Gvdiffsplit", "Gdiffsplit" },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require "plugins.git.gitsigns",
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
}
