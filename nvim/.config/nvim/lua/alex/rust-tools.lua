local codelldb_path = "/home/alex/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"
local liblldb_path =  "/home/alex/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so"

local opts = {
  -- debugging stuff
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path,liblldb_path)

    }
  }

require('rust-tools').setup(opts)
