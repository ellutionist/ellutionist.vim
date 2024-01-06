local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
    vim.keymap.set("n", "rn", vim.lsp.buf.rename)


    -- require "lsp.inlay-hint".on_attach(client, bufnr)
    -- require "lsp.signature".on_attach(client, bufnr)

    local keymap_grp = require "mykeymaps.group"
    local grp = keymap_grp.new_or_get("LanguageServer", "l")
        :add_entry("Definitions", "d", "Go to definitions",
            "Telescope lsp_definitions", { "gd" })
        :add_entry("References", "r", "Go to references",
            "Telescope lsp_references", { "gr" })
        :add_entry("IncomingCalls", "I", "Incoming calls",
            "Telescope lsp_incoming_calls")
        :add_entry("Implementations", "i", "Implementations",
            "Telescope lsp_implementations")
        :add_entry("TypeDefinition", "t", "Type definition",
            "Telescope lsp_type_definitions")
        :add_entry("Rename", "R", "Rename", vim.lsp.buf.rename)
        :add_entry("CodeAction", "a", "CodeAction", require("actions-preview").code_actions)
        :add_entry("DiagnosticNext", "n", "DiagnosticNext",
            vim.diagnostic.goto_next)
        :add_entry("DiagnosticPrev", "p", "DiagnosticPrev",
            vim.diagnostic.goto_prev)
        :add_entry("Hover", "h", "Hover", vim.lsp.buf.hover)
        :add_entry("Format", "f", "Format", vim.lsp.buf.format)
        :add_entry("Signature", "s", "Signature", vim.lsp.buf.signature_help)

    -- local ok = pcall(vim.lsp.inlay_hint, bufnr, true)
    -- if ok then
    --     grp:add_entry("InlayHintsToggle", "i", "InlayHintsToggle", function() vim.lsp.inlay_hint(bufnr, nil) end)
    -- end
    grp:bind()
end

local flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

return {
    on_attach = on_attach,
    flags = flags,
}
