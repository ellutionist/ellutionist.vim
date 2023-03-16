return function()
    require("dashboard").setup({
        theme = 'hyper',
        preview = {
            command = 'cat | lolcat -F 0.3 2>/dev/null',
            file_path = vim.env.HOME .. '/.config/nvim/static/neovim.cat',
            file_height = 11,
            file_width = 86,
        },
        config = {
            -- header = {
            --     [[███████╗██╗     ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗██╗███████╗████████╗]],
            --     [[██╔════╝██║     ██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║██║██╔════╝╚══██╔══╝]],
            --     [[█████╗  ██║     ██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║██║███████╗   ██║   ]],
            --     [[██╔══╝  ██║     ██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║██║╚════██║   ██║   ]],
            --     [[███████╗███████╗███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║██║███████║   ██║   ]],
            --     [[╚══════╝╚══════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝   ╚═╝   ]],
            -- },
            -- week_header = {
            --     enable = true,
            -- },
            shortcut = {
                {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                -- {
                --     desc = ' Apps',
                --     group = 'DiagnosticHint',
                --     action = 'Telescope app',
                --     key = 'a',
                -- },
                -- {
                --     desc = ' dotfiles',
                --     group = 'Number',
                --     action = 'Telescope dotfiles',
                --     key = 'd',
                -- },
            },
        },
    })
    -- vim.g.dashboard_preview_pipeline = 'lolcat'
end
