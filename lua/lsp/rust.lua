-- local rt = require("rust-tools")
local common = require "lsp.common"

local function rust_on_attach(client, bufnr)
    -- print "hello rust"
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
end

local config = {
    server = {
        auto_attach = true,
        on_attach = rust_on_attach,
        default_settings = {
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
    },
}

vim.g.rustaceanvim = config
-- vim.g.rustaceanvim.server.on_attach = rust_on_attach

-- config.on_attach = rust_on_attach
-- vim.lsp.config("rust_analyzer", config)
-- vim.lsp.enable("rust_analyzer")
