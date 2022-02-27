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

