return function()
    require 'bufferline'.setup {
        animation = true,
        highlight_visible = true,
        icons = {
            filetype = {
                custom_colors = true,
            },
            separator = {
                left = '▎',
            },
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                [vim.diagnostic.severity.WARN] = { enabled = false },
                [vim.diagnostic.severity.INFO] = { enabled = false },
                [vim.diagnostic.severity.HINT] = { enabled = true },
            },
        },
    }

    local function apply_highlight()
      local ts = vim.api.nvim_get_hl(0, { name = 'TabLineSel' })
      vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = ts.fg, bg = ts.bg, bold = true })
    end
    vim.schedule(apply_highlight)
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = apply_highlight,
    })

    local keymap_grp = require "core.keymaps.group"

    keymap_grp.new("Buffer", "b")
        :add_entry("ViewAllBuffers", "v", "View all buffers", "Telescope buffers")
        :add_entry("PickBuffer", "b", "Pick buffer", "BufferPick")
        :add_entry("NextBuffer", "n", "Next buffer", "BufferNext")
        :add_entry("PreviousBuffer", "p", "Previous buffer", "BufferPrevious")
        :add_entry("DeleteBuffer", "d", "Delete buffer", "BufferDelete")
        :add_entry("MoveBufferNext", "N", "Move next buffer", "BufferMoveNext")
        :add_entry("MoveBufferPrevious", "P", "Move previous buffer", "BufferMovePrevious")
        :add_entry("PinBuffer", "I", "Pin buffer", "BufferPin")
        :add_entry("CloseBuffer", "c", "Close buffer", "BufferClose")
        :add_entry("CloseAllButCurrentOrPinned", "q", "Close all but current or pinned",
            "BufferCloseAllButCurrentOrPinned")
        :add_entry("GotoBuffer1", "1", "Goto buffer 1", "BufferGoto 1")
        :add_entry("GotoBuffer2", "2", "Goto buffer 2", "BufferGoto 2")
        :add_entry("GotoBuffer3", "3", "Goto buffer 3", "BufferGoto 3")
        :add_entry("GotoBuffer4", "4", "Goto buffer 4", "BufferGoto 4")
        :add_entry("GotoBuffer5", "5", "Goto buffer 5", "BufferGoto 5")
        :add_entry("GotoBuffer6", "6", "Goto buffer 6", "BufferGoto 6")
        :add_entry("GotoBuffer7", "7", "Goto buffer 7", "BufferGoto 7")
        :add_entry("GotoBuffer8", "8", "Goto buffer 8", "BufferGoto 8")
        :add_entry("GotoBuffer9", "9", "Goto buffer 9", "BufferGoto 9")
        :bind()
end
