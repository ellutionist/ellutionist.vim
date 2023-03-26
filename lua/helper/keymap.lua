local _M = {}

-- _M.keymap_set = vim.keymap.set

_M.modes = {
    normal = "n",
    visual = "v",
    insert = "i",
}

function _M.normal(...)
    vim.keymap.set(_M.modes.normal, ...)
end

_M.keys = {
    ctrl = function(k)
        return string.format("<c-%s>", k)
    end,
    leader = function(k)
        return string.format("<leader>%s", k)
    end,
    space = function(k)
        return string.format("<space>%s", k)
    end,
    combine = function(...)
        return table.concat({ ... }, " ")
    end,
}

function _M.leader_and_space(key, ...)
    vim.keymap.set(_M.modes.normal, _M.keys.leader(key), ...)
    vim.keymap.set(_M.modes.normal, _M.keys.space(key), ...)
end

_M.values = {
    cmd = function(val)
        return string.format("<cmd>%s<cr>", val)
    end,
}

return _M
