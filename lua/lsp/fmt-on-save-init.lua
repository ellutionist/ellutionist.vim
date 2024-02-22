return function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")
    format_on_save.setup({
        formatter_by_ft = {
            rust = formatters.lsp,
        }
    })
end
