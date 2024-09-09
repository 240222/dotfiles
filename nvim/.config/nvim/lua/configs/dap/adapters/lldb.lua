local M = {}

M.adapter = {
	type = "executable",
  -- local installation of lldb-vscode
  command = "/usr/lib/llvm-14/bin/lldb-vscode",
	-- command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

M.config = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local argument_string = vim.fn.input("Program arguments: ")
			return vim.fn.split(argument_string, " ", true)
		end,
	},
}

return M
