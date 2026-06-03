return function()
    require "plugins.dap.dap-init"
    require "plugins.dap.cpp-debug"
    require "plugins.dap.rust-debug"
    require "plugins.dap.python-debug"
    require "plugins.dap.go-debug"
end
