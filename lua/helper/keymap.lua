local _M = {}

-- _M.keymap_set = vim.keymap.set

_M.modes = {
    normal = "n",
    visual = "v",
    insert = "i",
}

function _M.Normal(...)
    vim.keymap.set(_M.modes.normal, ...)
end

_M.keys = {
    ctrl = function(k)
        return string.format("<c-%s>", k)
    end,
    leader = function(k)
        return string.format("<leader>%s", k)
    end,
    combine = function(...)
        return table.concat({ ... }, " ")
    end
}

_M.values = {
    cmd = function(val)
        return string.format("<cmd>%s<cr>", val)
    end
}

return _M
