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

local keymap_grp = require "mykeymaps.group"
local dap = require "dap"

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

keymap_grp.new_or_get("Debug", "d")
    :add_entry("ToggleBreakpoint", "b", "Toggle breakpoint", dap.toggle_breakpoint)
    :add_entry("StepOut", "O", "Step out", dap.step_out)
    :add_entry("StepInto", "I", "Step into", dap.step_into)
    :add_entry("StepOver", "o", "Step over", dap.step_over)
    :add_entry("Continue", "g", "Continue", dap.continue)
    :add_entry("RunToCursor", "n", "Run to cursor", dap.run_to_cursor)
    :add_entry("Terminate", "c", "Terminate", dap.terminate)
    :add_entry("ClearBreakpoints", "C", "Clear breakpoints", dap.clear_breakpoints)
    :add_entry("RunLast", "R", "Run last", dap.run_last)
    :add_entry("GoUp", "k", "GoUp", dap.up)
    :add_entry("GoDown", "j", "GoDown", dap.down)
    :add_entry("RunFromConfig", "r", "Run from config", run_from_config)
    :bind()
