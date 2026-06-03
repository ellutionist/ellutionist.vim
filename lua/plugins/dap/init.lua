return {
  {
    "nvim-neotest/nvim-nio",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = require "plugins.dap.config",
    keys = {
      { "<leader>d", desc = "Debug" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "plugins.dap.dap-ui-init"
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap",
    },
    keys = {
      { "<leader>du", desc = "DAP UI" },
    },
  },
}
