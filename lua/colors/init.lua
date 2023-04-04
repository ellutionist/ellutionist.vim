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

local keymap = require "helper.keymap"
local ls = keymap.leader_and_space

-- local function color_toggle_background()
--     local current = vim.inspect(vim.o.background)
--     print(current)
--     if current == "dark" then
--         vim.cmd("set background=light")
--     else
--         vim.cmd("set background=dark")
--         -- vim.o.background = "dark"
--     end
-- end

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

ls("cb", "<cmd>:let &bg=(&bg=='light'?'dark':'light')<cr>")
ls("cr", color_random)

return {
    colorscheme = colorscheme,
    background = background,
}
