local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
    vim.keymap.set("n", "rn", vim.lsp.buf.rename)

    local keymap_grp = require "mykeymaps.group"
    keymap_grp.new_or_get("LanguageServer", "l")
        :add_entry("Definitions", "d", "Go to definitions",
            "Telescope lsp_definitions", { "gd" })
        :add_entry("References", "r", "Go to references",
            "Telescope lsp_references", { "gr" })
        :add_entry("Rename", "R", "Rename", vim.lsp.buf.rename)
        :add_entry("CodeAction", "a", "CodeAction", vim.lsp.buf.code_action)
        :add_entry("DiagnosticNext", "n", "DiagnosticNext",
            vim.diagnostic.goto_next)
        :add_entry("DiagnosticPrev", "p", "DiagnosticPrev",
            vim.diagnostic.goto_prev)
        :add_entry("Hover", "h", "Hover", vim.lsp.buf.hover)
        :bind()
end

local flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

return {
    on_attach = on_attach,
    flags = flags,
}
