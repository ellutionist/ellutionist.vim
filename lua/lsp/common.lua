local leader_space = require("helper.keymap").leader_and_space

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    --[[ vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) ]]
    --[[ vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) ]]
    --[[ vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts) ]]
    --[[ vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts) ]]
    --[[ vim.keymap.set('n', '<space>wl', function() ]]
    --[[     print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
    --[[ end, bufopts) ]]
    --[[ vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) ]]
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    leader_space("rn", vim.lsp.buf.rename, bufopts)
    leader_space("lrn", vim.lsp.buf.rename, bufopts)
    leader_space("ldn", vim.diagnostic.goto_next, bufopts)
    leader_space("ldp", vim.diagnostic.goto_prev, bufopts)
    leader_space("lca", vim.lsp.buf.code_action, bufopts)
    --[[ vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) ]]
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>")
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
    -- vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
    -- leader_space('F', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

return {
    on_attach = on_attach,
    flags = flags,
}
