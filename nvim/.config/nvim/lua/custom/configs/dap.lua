local dap = require("dap")
local dapui = require("dapui")

-- local mason_registry = require("mason-registry")
--
-- local codelldb = mason_registry.get_package("codelldb")
-- local extension_path = codelldb:get_install_path() .. "/extension"
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- -- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
--
-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     -- CHANGE THIS to your path!
--     command = codelldb_path,
--     args = {"--port", "${port}"},
--
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   }
-- }
-- -- -- Get the path to `codelldb` installed by Mason.nvim
-- -- local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension"
-- -- local codelldb_bin = codelldb_path .. "/adapter/codelldb"
-- dap.configurations.rust = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   },
-- }
--
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
