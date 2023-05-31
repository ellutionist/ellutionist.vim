---@alias StringRow string[]

---@class KeyMapGroup
---@field public name string
---@field public leader_key string
---@field public entries KeyMapEntry[]
---@field public rows StringRow[]
local _M = {}


local utils = require "utils"
local bind = require "mykeymaps.bind".leader_and_space
local entry = require "mykeymaps.entry"
local display = require "myui.mywindow".split_and_display

local groups = {}


function _M.wrap_cmd(cmd)
    return function()
        vim.cmd(cmd)
    end
end

local function new_group(name, leader_key)
    local self = setmetatable({}, { __index = _M })

    assert(utils.non_empty_string(name), "name must be a non-empty string")
    assert(utils.non_empty_string(leader_key), "leader_key must be a non-empty string")

    self.name = name
    self.leader_key = leader_key
    self.entries = {}
    self.rows = {
        { string.format("<%s>", self.name) },
        {}
    }

    return self
end

function _M.new_or_get(name, leader_key)
    local grp = groups[name]
    if not grp then
        grp = new_group(name, leader_key)
        groups[name] = grp
    end

    return grp
end

function _M.new(name, leader_key)
    local grp = new_group(name, leader_key)
    groups[name] = grp

    return grp
end

local function clone_array(arr)
    local result = {}
    for _, v in ipairs(arr) do
        table.insert(result, v)
    end
    return result
end

local function align_columns(rows)
    local max_cols = 0
    local result_rows = {}
    for _, row in ipairs(rows) do
        local cloned_row = clone_array(row)
        table.insert(result_rows, cloned_row)

        max_cols = math.max(max_cols, #row)
    end

    for _, row in ipairs(result_rows) do
        if #row < max_cols then
            for _ = #row + 1, max_cols do
                table.insert(row, "")
            end
        end

        assert(#row == max_cols)
    end

    for icol = 1, max_cols do
        local max_len = 0
        for _, row in ipairs(result_rows) do
            max_len = math.max(max_len, #row[icol])
        end
        -- print(icol, max_len)

        for _, row in ipairs(result_rows) do
            row[icol] = string.format("%-" .. max_len .. "s", row[icol])
            -- print(icol, row[icol], string.len(row[icol]))
        end
    end

    local aligned_lines = {}
    for _, row in ipairs(result_rows) do
        local line = table.concat(row, "    ")
        table.insert(aligned_lines, line)
    end

    return aligned_lines
end

function _M:add_entry(name, keys, description, action, alternatives)
    local the_act
    if type(action) == "string" then
        the_act = function()
            vim.cmd(action)
        end
    else
        the_act = action
    end
    local new_entry = entry.new(self.leader_key, name, keys, alternatives, description, the_act)
    table.insert(self.entries, new_entry)
    for _, row in ipairs(new_entry:describe()) do
        table.insert(self.rows, row)
    end
    return self
end

function _M:bind()
    for _, one_entry in ipairs(self.entries) do
        one_entry:bind()
    end

    local aligned_lines = align_columns(self.rows)

    bind(self.leader_key .. "?", function()
        display(aligned_lines)
    end)

    return self
end

local aligned_lines

local function show_all_groups_intro()
    local rows = {
        { "KeyMap Groups" },
        {}
    }

    local group_arr = {}
    for name, one_group in pairs(groups) do
        table.insert(group_arr, { name, one_group })
    end

    table.sort(group_arr, function(a, b)
        return a[1] < b[1]
    end)

    for _, tuple in ipairs(group_arr) do
        local one_group = tuple[2]
        table.insert(rows, {
            string.format("<%s>", one_group.name),
            string.format("{leader/space} %s(?)", one_group.leader_key),
        })
    end

    aligned_lines = align_columns(rows)
    -- end
    display(aligned_lines)
end

function _M.bind_all_groups_intro()
    bind("??", show_all_groups_intro)
end

return _M
