-- require "utils.nvimtree"
-- require "utils.nerdcommenter"
-- require "utils.lualine"
-- require "utils.telescope"
-- require "utils.bufferline-setup"

local _M = {}

function _M.non_empty_string(str)
    return type(str) == "string" and string.len(str) > 0
end

function _M.is_table(t)
    return type(t) == "table"
end

function _M.is_nil(t)
    return t == nil
end

function _M.is_function(f)
    return type(f) == "function"
end

return _M
