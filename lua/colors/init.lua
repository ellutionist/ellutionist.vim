local colorscheme = "gruvbox"
local background = "dark"

vim.cmd.colorscheme(colorscheme)
vim.o.background = background

return {
    colorscheme = colorscheme,
    background = background,
}
