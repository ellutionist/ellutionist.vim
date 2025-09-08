local rt = require("rust-tools")
local common = require "lsp.common"

rt.setup({
    server = {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    -- features = "all"
                },
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
                check = {
                    enable = true,
                    command = "clippy",
                    allFeatures = true,
                },
            }
        },
        on_attach = function(client, bufnr)
            local f, _ = io.open("./ra-config.json", "r")

            if f then
                local config = vim.fn.json_decode(f:read("*all"))

                local features = config["features"]


                if type(features) == "table" then
                    -- print(vim.inspect(features))
                    client.config.settings["rust-analyzer"].cargo.features = features
                end
                local disable_clippy = config["disable_clippy"] or false

                if disable_clippy then
                    client.config.settings["rust-analyzer"].checkOnSave = {
                        enable = true,
                        command = "check",
                    }
                    client.config.settings["check"] = {
                        enable = true,
                        command = "check",
                        allFeatures = true,
                    }
                else
                    client.config.settings["rust-analyzer"].checkOnSave = {
                        enable = true,
                        command = "clippy",
                    }

                    client.config.settings["check"] = {
                        enable = true,
                        command = "clippy",
                        allFeatures = true,
                    }
                end
            end

            common.on_attach(client, bufnr)
            -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            --     vim.lsp.diagnostic.on_publish_diagnostics, {
            --         signs = {
            --             severity_limit = "Warning",
            --         },
            --         virtual_text = {
            --             severity_limit = "Warning",
            --         },
            --     }
            -- )
            -- Hover actions
            -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
