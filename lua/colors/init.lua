local color_env = os.getenv("NVIM_COLOR")
local colorscheme = color_env and string.len(color_env) > 0 and color_env or "gruvbox"
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

local function color_random()
    local colors_map = get_colors()
    local color_names = {}
    for k, v in pairs(colors_map) do
        table.insert(color_names, k)
    end

    local n = math.random(#color_names)
    local choose = color_names[n]

    print(choose)
    vim.cmd("colorscheme " .. choose)
end

require "mykeymaps.group".new_or_get("Color", "c")
    :add_entry("ToggleBackground", "b", "Toggle background", "let &bg=(&bg=='light'?'dark':'light')")
    :add_entry("Random", "r", "Random color", color_random)
    :bind()

-- ls("cb", "<cmd>:let &bg=(&bg=='light'?'dark':'light')<cr>")
-- ls("cr", color_random)

return {
    colorscheme = colorscheme,
    background = background,
}
