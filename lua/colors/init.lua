local colorscheme = "gruvbox"
local background = "dark"

local function get_colors()
    local colors = vim.list_extend(
        {},
        vim.tbl_filter(function(color)
            return true
        end, vim.fn.getcompletion("", "color"))
    )

    local color_map = {}
    for _, c in ipairs(colors) do
        color_map[c] = true
    end
    return color_map
end

local colors = get_colors()
if colors[colorscheme] then
    vim.cmd("colorscheme " .. colorscheme)
else
    colorscheme = nil
end

vim.o.background = background

return {
    colorscheme = colorscheme,
    background = background,
}
