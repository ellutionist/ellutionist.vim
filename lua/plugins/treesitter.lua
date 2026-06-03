return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.install").prefer_git = true
    end,
    lazy = false,
  },
}
