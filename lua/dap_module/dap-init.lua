local km = require "helper.keymap"
local ls = km.leader_and_space

local function setup_signs()
    vim.fn.sign_define(
        "DapBreakpoint",
        { text = "🟥", texthl = "", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "🟦", texthl = "", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
        "DapStopped",
        { text = "⭐️", texthl = "", linehl = "", numhl = "" }
    )
end

setup_signs()

local dap = require "dap"
ls("db", dap.toggle_breakpoint)
ls("dO", dap.step_out)
ls("dI", dap.step_into)
ls("do", dap.step_over)
ls("dg", dap.continue)
ls("dn", dap.run_to_cursor)
ls("dc", dap.terminate)
ls("dC", dap.clear_breakpoints)
ls("dR", dap.run_last)
ls("dk", dap.up)
ls("dj", dap.down)

local function run_from_config()
    local fd = io.open(vim.fn.getcwd() .. "/dap-settings.json")
    if not fd then
        require("dap").continue()
        return
    end
    local txt = fd:read "a"
    fd:close()

    local config = vim.json.decode(txt)

    local names = {}
    for k, _ in pairs(config) do
        table.insert(names, k)
    end

    local name
    vim.ui.select(names, {
        prompt = "Select debug config:",
    }, function(choice)
        name = choice
        require("dap").run(config[name])
    end)
end

ls("dr", run_from_config)
