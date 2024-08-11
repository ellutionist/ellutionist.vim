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
        startify.button("f", "File Explorer", ":NvimTreeOpen<cr>"),
        startify.button("g", "Git", ":Git<CR> :wincmd o<cr>"),
        startify.button("T", "Telescope", ":Telescope<CR>"),
        startify.button("n", "New", ":enew<CR>"),
        startify.button("s", "Search Files", ":Telescope find_files<CR>"),
        startify.button("m", "Mason Installer", ":Mason<CR>"),
    }
    -- disable MRU
    startify.section.mru.val = { { type = "padding", val = 0 } }
    -- disable MRU cwd
    -- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
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
