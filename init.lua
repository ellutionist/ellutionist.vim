require "base"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = {
    colorscheme = { "gruvbox" },
  },
  change_detection = {
    enabled = false,
  },
  checker = {
    enabled = false,
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    require "core.colors"
    require "core.keymaps.group".new("Lazy", "L")
      :add_entry("Home", "l", "Lazy home", "Lazy")
      :add_entry("Sync", "s", "Sync plugins", "Lazy sync")
      :add_entry("Check", "c", "Check updates", "Lazy check")
      :add_entry("Update", "u", "Update plugins", "Lazy update")
      :add_entry("Clean", "C", "Clean plugins", "Lazy clean")
      :add_entry("Restore", "R", "Restore plugins", "Lazy restore")
      :bind()
    require "core.keymaps.group".bind_all_groups_intro()
  end,
})
