nnoremap <silent><leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><leader>ll <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>lg <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>l; <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>l, <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent>gD <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent>gp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><leader>rn, <cmd>lua vim.lsp.buf.rename()<CR>

lua << EOF

local util = require 'lspconfig.util'

require'lspconfig'.clangd.setup{
    cmd = { "clangd", 
            "--compile-commands-dir=build",
            "--query-driver=/usr/bin/g++",
            "--clang-tidy",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cc" },
    root_dir = util.root_pattern("build/compile_commands.json", "compile_flags.txt", ".git"),
    single_file_support = true
}

EOF

