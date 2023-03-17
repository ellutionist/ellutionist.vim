local dap = require "dap"

local codelldb_port = 13000
dap.adapters.codelldb = {
	type = "server",
	port = codelldb_port,
	executable = {
		command = "codelldb",
		args = { "--port", codelldb_port },
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input(
				"Path to executable: ",
				vim.fn.getcwd() .. "/",
				"file"
			)
		end,
        args = {},
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}
