return function()
    local format_on_save = require("format-on-save")
    -- local formatters = require("format-on-save.formatters")

    local function get_formatter_table()
        local fmt_lib = require("format-on-save.formatters")
        local formatter_by_ft = {
            rust = fmt_lib.lsp,
            toml = fmt_lib.lsp,
            lua = fmt_lib.lsp,
            sh = fmt_lib.lsp,
        }
        local f, _ = io.open("./ra-config.json", "r")

        if f then
            local config = vim.fn.json_decode(f:read("*all"))

            local disable_fmt = config["format_on_save"]
            if disable_fmt == false then
                formatter_by_ft.rust = nil
            end
        end
        return formatter_by_ft
    end

    format_on_save.setup({
        formatter_by_ft = get_formatter_table()
    })
end
