local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>")
    vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions<cr>")
    vim.keymap.set("n", "rn", vim.lsp.buf.rename)


    -- require "lsp.inlay-hint".on_attach(client, bufnr)
    -- require "lsp.signature".on_attach(client, bufnr)

    local keymap_grp = require "mykeymaps.group"
    local grp = keymap_grp.new_or_get("LanguageServer", "l")
        :add_entry("Definitions", "d", "Go to definitions",
            "Trouble lsp_definitions", { "gd" })
        :add_entry("References", "r", "Go to references",
            "Trouble lsp_references", { "gr" })
        :add_entry("IncomingCalls", "I", "Incoming calls",
            "Telescope lsp_incoming_calls")
        :add_entry("Implementations", "i", "Implementations",
            "Trouble lsp_implementations")
        :add_entry("TypeDefinition", "t", "Type definition",
            "Trouble lsp_type_definitions")
        :add_entry("Rename", "R", "Rename", vim.lsp.buf.rename)
        :add_entry("CodeAction", "a", "CodeAction", require("actions-preview").code_actions)
        :add_entry("DiagnosticNext", "n", "DiagnosticNext",
            function()
                vim.diagnostic.goto_next({
                    severity = {
                        min = vim.diagnostic.severity.WARN
                    }
                })
            end)
        :add_entry("DiagnosticPrev", "p", "DiagnosticPrev",
            function()
                vim.diagnostic.goto_prev({
                    severity = {
                        min = vim.diagnostic.severity.WARN
                    }
                })
            end)
        :add_entry("Hover", "h", "Hover", vim.lsp.buf.hover)
        :add_entry("Format", "f", "Format", vim.lsp.buf.format)
        :add_entry("Signature", "s", "Signature", vim.lsp.buf.signature_help)
        :add_entry("LspInfo", "l", "Lsp Info", "LspInfo")

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
