return function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = (require "colors").colorscheme,
            component_separators = { left = '', right = '|' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                { 'filename', path = 3 },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'progress', 'location' }
        },
        -- inactive_sections = {
        --     lualine_a = {},
        -- },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end
