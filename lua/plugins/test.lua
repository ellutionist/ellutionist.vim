return {
  {
    "vim-test/vim-test",
    config = function()
      require "core.keymaps.group".new_or_get("test", "e")
        :add_entry("Nearest", "n", "Test Nearest", "TestNearest")
        :add_entry("File", "f", "Test File", "TestFile")
        :bind()
    end,
    keys = {
      { "<leader>e", desc = "Test" },
    },
  },
}
