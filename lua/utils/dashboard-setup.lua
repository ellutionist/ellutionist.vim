return function()
    -- require 'alpha'.setup(require 'alpha.themes.startify'.config)
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.startify'
    startify.section.header.val = {
        [[███████╗██╗     ██╗     ██╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗██╗███████╗████████╗]],
        [[██╔════╝██║     ██║     ██║   ██║╚══██╔══╝██║██╔═══██╗████╗  ██║██║██╔════╝╚══██╔══╝]],
        [[█████╗  ██║     ██║     ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║██║███████╗   ██║   ]],
        [[██╔══╝  ██║     ██║     ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║██║╚════██║   ██║   ]],
        [[███████╗███████╗███████╗╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║██║███████║   ██║   ]],
        [[╚══════╝╚══════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝   ╚═╝   ]],
    }
    startify.section.top_buttons.val = {
        startify.button("f", "Find Files", ":Telescope find_files<CR>"),
    }
    -- disable MRU
    -- startify.section.mru.val = { { type = "padding", val = 0 } }
    -- disable MRU cwd
    startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
    -- disable nvim_web_devicons
    -- startify.nvim_web_devicons.enabled = false
    -- startify.nvim_web_devicons.highlight = false
    -- startify.nvim_web_devicons.highlight = 'Keyword'
    --
    startify.section.bottom_buttons.val = {
        startify.button("q", "Quit NVIM", ":qa<CR>"),
    }
    startify.section.footer.val = {
        { type = "text", val = "Holy Syntax" },
    }
    -- ignore filetypes in MRU

    alpha.setup(startify.config)
end
