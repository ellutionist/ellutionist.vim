---@class KeyMapEntry
---@field public leader_key string
---@field public name string
---@field public keys string
---@field public alternatives string[]
---@field public description string
---@field public action function
---@field public mode string?
local _M = {}

local utils = require "utils"
local bind = require "mykeymaps.bind".leader_and_space
local bind_visual = require "mykeymaps.bind".leader_and_space_visual

function _M.new(leader_key, name, keys, alternatives, description, action, mode)
    local self = setmetatable({}, { __index = _M })

    assert(utils.non_empty_string(leader_key), "leader_key must be a non-empty string")
    assert(utils.non_empty_string(name), "name must be a non-empty string")
    assert(utils.non_empty_string(keys), "keys must be a non-empty string")
    assert(utils.is_table(alternatives) or utils.is_nil(alternatives), "alternatives must be a table or nil")
    assert(utils.non_empty_string(description), "description must be a non-empty string")
    assert(utils.is_function(action), "action must be a function")

    self.leader_key = leader_key
    self.name = name
    self.keys = keys
    self.alternatives = alternatives
    self.description = description
    self.action = action
    self.mode = mode

    return self
end

function _M:bind()
    local bind_func = (
        self.mode == "v" or self.mode == "visual"
    ) and bind_visual or bind

    bind_func(self.leader_key .. self.keys, self.action)
    if utils.is_table(self.alternatives) then
        for _, key in ipairs(self.alternatives) do
            bind_func(self.leader_key .. key, self.action)
        end
    end
end

function _M:describe()
    local alternatives
    if utils.is_table(self.alternatives) then
        alternatives = {}
        for _, alt in ipairs(self.alternatives) do
            table.insert(alternatives, self.leader_key .. alt)
        end
    end

    local alt_txt = alternatives and string.format(" (%s)", table.concat(alternatives, ", ")) or ""
    return {
        { string.format("*%s*", self.name),
            string.format("{leader/space} %s%s", self.leader_key .. self.keys, alt_txt),
            self.description },
    }
end

return _M
