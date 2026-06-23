-- return {
--     {
--         "romus204/tree-sitter-manager.nvim",
--         dependencies = {}, -- tree-sitter CLI must be installed system-wide
--         config = function()
--             require("tree-sitter-manager").setup()
--         end,
--     }
--
-- }

return {
    {
        "romus204/tree-sitter-manager.nvim",
        -- 在读取缓冲区或打开新文件时懒加载
        event = { "BufReadPost", "BufNewFile" },
        -- 确保在调用该插件的任何原生功能前已完成初始化
        lazy = true,
        opts = {
            -- 开启自动安装：当打开未安装解析器的文件时，后台自动拉取并编译
            auto_install = true,

            -- 如果需要让某些特定语言不参与自动安装，可以在此排除
            -- noauto_install = { "markdown" },

            -- 默认情况下，插件会使用自带打包的常用语言高亮查询文件（runtime/queries/）
            -- 如果你想强制使用语法仓库自带的最新 queries，可以设为 true
            use_repo_queries = false,
        },
        config = function(_, opts)
            -- 初始化插件配置
            require("tree-sitter-manager").setup(opts)

            -- 开启原生 Neovim Tree-sitter 高亮（Neovim 0.12 内置原生 API）
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    -- 使用 pcall 容错，防止遇到未支持的边缘文件类型时报错中断
                    pcall(vim.treesitter.start, args.buf)
                end,
            })

            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
        -- 绑定快捷键打开 TUI 管理界面
        keys = {
            { "<leader>ts", "<cmd>TSManager<cr>", desc = "打开 Tree-sitter 管理器" },
        },
    }
}
