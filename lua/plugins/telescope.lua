return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local lga_actions = require("telescope-live-grep-args.actions")
      require("telescope").setup({
        defaults = {
          layout_strategy = "center",
          layout_config = {
            anchor = "S",
            width = 0.95,
          },
          dynamic_preview_title = true,
        },
        pickers = {
          lsp_references = {
            layout_strategy = "center",
            layout_config = {
              anchor = "S",
              width = 0.95,
            },
            include_declaration = false,
            fname_width = 90,
            show_line = true,
            path_display = {
              shorten = {
                len = 1,
                exclude = { 1, -3, -2, -1 },
              },
            },
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
        },
      })

      local keymap_grp = require "core.keymaps.group"

      local function telescope_error_diagnostics()
        require("telescope.builtin").diagnostics({ severity_limit = "ERROR" })
      end

      keymap_grp.new("Telescope", "T")
        :add_entry("Telescope", "T", "Open Telescope", "Telescope")
        :add_entry("LiveGrep", "g", "Live Grep", require("telescope").extensions.live_grep_args.live_grep_args)
        :add_entry("GrepString", "s", "Grep String", "Telescope grep_string")
        :add_entry("FindFiles", "f", "Find Files", "Telescope find_files")
        :add_entry("Diagnostics", "d", "Diagnostics", "Telescope diagnostics")
        :add_entry("DiagnosticsError", "D", "DiagnosticsError", telescope_error_diagnostics)
        :add_entry("Colorscheme", "c", "Colorscheme", "Telescope colorscheme")
        :add_entry("Oldfiles", "o", "Old Files", "Telescope oldfiles")
        :add_entry("QuickFix", "q", "Quick Fix", "Telescope quickfix")
        :add_entry("Registers", "r", "Registers", "Telescope registers")
        :add_entry("Buffers", "b", "Buffers", "Telescope buffers")
        :add_entry("BufferCommits", "gC", "Buffer Git Commits", "Telescope git_bcommits")
        :add_entry("Commits", "gc", "Git Commits", "Telescope git_commits")
        :add_entry("Branches", "gb", "Git Branches", "Telescope git_branches")
        :bind()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>T", desc = "Telescope" },
    },
  },
}
