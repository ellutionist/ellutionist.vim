local _M = {}

function _M.split_and_display(lines)
    vim.api.nvim_command("split")

    local new_bufnr = vim.api.nvim_create_buf(false, true)
    -- vim.api.nvim_buf_set_name(new_bufnr, "/tmp/help.txt")
    vim.api.nvim_set_current_buf(new_bufnr)

    vim.api.nvim_buf_set_lines(new_bufnr, 0, -1, true, lines)
    vim.bo[new_bufnr].readonly = true
    vim.bo[new_bufnr].filetype = "help"
    vim.api.nvim_buf_set_keymap(new_bufnr, "n", "q", ":q<CR>", { noremap = true, silent = true })
end

return _M
